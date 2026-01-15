import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';

/// 日志级别
enum LogLevel {
  /// 调试级别
  debug,

  /// 信息级别
  info,

  /// 警告级别
  warning,

  /// 错误级别
  error,
}

/// 网络日志配置
class NetworkLogConfig {
  const NetworkLogConfig({
    this.enableLog = true,
    this.printRequest = true,
    this.printResponse = true,
    this.printError = true,
    this.printRequestHeader = true,
    this.printResponseHeader = false,
    this.printRequestBody = true,
    this.printResponseBody = true,
    this.maxPrintLength = 0, // 0 表示不限制
    this.useDeveloperLog = true, // 使用 developer.log 支持完整打印
    this.compactMode = false,
  });

  /// 是否启用日志
  final bool enableLog;

  /// 是否打印请求
  final bool printRequest;

  /// 是否打印响应
  final bool printResponse;

  /// 是否打印错误
  final bool printError;

  /// 是否打印请求头
  final bool printRequestHeader;

  /// 是否打印响应头
  final bool printResponseHeader;

  /// 是否打印请求体
  final bool printRequestBody;

  /// 是否打印响应体
  final bool printResponseBody;

  /// 最大打印长度（0 表示不限制）
  final int maxPrintLength;

  /// 使用 developer.log（支持完整打印，不截断）
  final bool useDeveloperLog;

  /// 紧凑模式（减少边框装饰）
  final bool compactMode;

  /// 默认配置
  static const NetworkLogConfig defaultConfig = NetworkLogConfig();

  /// 完整日志配置
  static const NetworkLogConfig full = NetworkLogConfig(
    printRequestHeader: true,
    printResponseHeader: true,
    maxPrintLength: 0,
    useDeveloperLog: true,
  );

  /// 简洁配置
  static const NetworkLogConfig compact = NetworkLogConfig(
    printRequestHeader: false,
    printResponseHeader: false,
    compactMode: true,
  );
}

/// 网络日志类
///
/// 支持完整打印，不截断日志内容
///
/// 使用示例：
/// ```dart
/// // 初始化
/// NetworkLogger.instance.init(config: NetworkLogConfig.full);
///
/// // 打印请求
/// NetworkLogger.instance.logRequest(options);
///
/// // 打印响应
/// NetworkLogger.instance.logResponse(response);
/// ```
class NetworkLogger {
  NetworkLogger._();

  static NetworkLogger? _instance;
  NetworkLogConfig _config = NetworkLogConfig.defaultConfig;

  static NetworkLogger get instance {
    _instance ??= NetworkLogger._();
    return _instance!;
  }

  /// 初始化日志配置
  void init({NetworkLogConfig config = NetworkLogConfig.defaultConfig}) {
    _config = config;
  }

  /// 更新配置
  void updateConfig(NetworkLogConfig config) {
    _config = config;
  }

  /// 获取当前配置
  NetworkLogConfig get config => _config;

  // ==================== 日志方法 ====================

  /// 打印请求日志
  void logRequest(RequestOptions options) {
    if (!_config.enableLog || !_config.printRequest) return;

    final buffer = StringBuffer();

    if (_config.compactMode) {
      buffer.writeln('→ ${options.method} ${options.uri}');
    } else {
      buffer.writeln(_divider('REQUEST'));
      buffer.writeln('│ URL: ${options.uri}');
      buffer.writeln('│ Method: ${options.method}');
    }

    if (_config.printRequestHeader && options.headers.isNotEmpty) {
      buffer.writeln(_config.compactMode ? '│ Headers:' : '├─ Headers:');
      _formatMap(options.headers).split('\n').forEach((line) {
        buffer.writeln('│   $line');
      });
    }

    if (options.queryParameters.isNotEmpty) {
      buffer.writeln(_config.compactMode ? '│ Query:' : '├─ Query Parameters:');
      _formatMap(options.queryParameters).split('\n').forEach((line) {
        buffer.writeln('│   $line');
      });
    }

    if (_config.printRequestBody && options.data != null) {
      buffer.writeln(_config.compactMode ? '│ Body:' : '├─ Request Body:');
      _formatData(options.data).split('\n').forEach((line) {
        buffer.writeln('│   $line');
      });
    }

    if (!_config.compactMode) {
      buffer.writeln(_bottomDivider());
    }

    _print(buffer.toString(), level: LogLevel.info, name: 'HTTP_REQUEST');
  }

  /// 打印响应日志
  void logResponse(Response response) {
    if (!_config.enableLog || !_config.printResponse) return;

    final buffer = StringBuffer();
    final duration = _getRequestDuration(response);

    if (_config.compactMode) {
      buffer.writeln(
        '← ${response.statusCode} ${response.requestOptions.uri} (${duration}ms)',
      );
    } else {
      buffer.writeln(_divider('RESPONSE'));
      buffer.writeln('│ URL: ${response.requestOptions.uri}');
      buffer.writeln('│ Status: ${response.statusCode} ${response.statusMessage ?? ""}');
      buffer.writeln('│ Duration: ${duration}ms');
    }

    if (_config.printResponseHeader && response.headers.map.isNotEmpty) {
      buffer.writeln(_config.compactMode ? '│ Headers:' : '├─ Response Headers:');
      response.headers.forEach((name, values) {
        buffer.writeln('│   $name: ${values.join(", ")}');
      });
    }

    if (_config.printResponseBody && response.data != null) {
      buffer.writeln(_config.compactMode ? '│ Data:' : '├─ Response Body:');
      _formatData(response.data).split('\n').forEach((line) {
        buffer.writeln('│   $line');
      });
    }

    if (!_config.compactMode) {
      buffer.writeln(_bottomDivider());
    }

    _print(buffer.toString(), level: LogLevel.info, name: 'HTTP_RESPONSE');
  }

  /// 打印错误日志
  void logError(DioException error) {
    if (!_config.enableLog || !_config.printError) return;

    final buffer = StringBuffer();

    if (_config.compactMode) {
      buffer.writeln('✗ ${error.type} ${error.requestOptions.uri}');
      buffer.writeln('│ ${error.message}');
    } else {
      buffer.writeln(_divider('ERROR', char: '!'));
      buffer.writeln('│ URL: ${error.requestOptions.uri}');
      buffer.writeln('│ Method: ${error.requestOptions.method}');
      buffer.writeln('│ Type: ${error.type}');
      buffer.writeln('│ Message: ${error.message}');
    }

    if (error.response != null) {
      buffer.writeln('├─ Response:');
      buffer.writeln('│   Status: ${error.response?.statusCode}');
      if (error.response?.data != null) {
        buffer.writeln('│   Data:');
        _formatData(error.response?.data).split('\n').forEach((line) {
          buffer.writeln('│     $line');
        });
      }
    }

    if (error.error != null) {
      buffer.writeln('├─ Error Object:');
      buffer.writeln('│   ${error.error}');
    }

    if (error.stackTrace != null) {
      buffer.writeln('├─ Stack Trace:');
      error.stackTrace.toString().split('\n').take(10).forEach((line) {
        buffer.writeln('│   $line');
      });
    }

    if (!_config.compactMode) {
      buffer.writeln(_bottomDivider(char: '!'));
    }

    _print(buffer.toString(), level: LogLevel.error, name: 'HTTP_ERROR');
  }

  /// 自定义日志
  void log(
    String message, {
    LogLevel level = LogLevel.info,
    String? name,
  }) {
    if (!_config.enableLog) return;
    _print(message, level: level, name: name ?? 'HTTP');
  }

  // ==================== 私有方法 ====================

  /// 打印日志
  void _print(String message, {LogLevel level = LogLevel.info, String? name}) {
    if (_config.useDeveloperLog) {
      // 使用 developer.log，支持完整打印
      developer.log(
        message,
        name: name ?? 'NetworkLogger',
        level: _logLevelToInt(level),
      );
    } else {
      // 使用 print，可能会被截断
      final lines = message.split('\n');
      for (final line in lines) {
        // ignore: avoid_print
        print(line);
      }
    }
  }

  /// 日志级别转换
  int _logLevelToInt(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 500;
      case LogLevel.info:
        return 800;
      case LogLevel.warning:
        return 900;
      case LogLevel.error:
        return 1000;
    }
  }

  /// 格式化 Map
  String _formatMap(Map<String, dynamic> map) {
    if (map.isEmpty) return '{}';

    try {
      final encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(map);
    } catch (e) {
      return map.toString();
    }
  }

  /// 格式化数据
  String _formatData(dynamic data) {
    if (data == null) return 'null';

    String formatted;

    if (data is Map || data is List) {
      try {
        final encoder = JsonEncoder.withIndent('  ');
        formatted = encoder.convert(data);
      } catch (e) {
        formatted = data.toString();
      }
    } else if (data is FormData) {
      final buffer = StringBuffer();
      buffer.writeln('FormData {');
      for (final field in data.fields) {
        buffer.writeln('  ${field.key}: ${field.value}');
      }
      for (final file in data.files) {
        buffer.writeln('  ${file.key}: [File: ${file.value.filename}]');
      }
      buffer.write('}');
      formatted = buffer.toString();
    } else {
      formatted = data.toString();
    }

    // 如果配置了最大长度限制
    if (_config.maxPrintLength > 0 && formatted.length > _config.maxPrintLength) {
      return '${formatted.substring(0, _config.maxPrintLength)}\n... (truncated, total: ${formatted.length} chars)';
    }

    return formatted;
  }

  /// 获取请求耗时
  int _getRequestDuration(Response response) {
    final startTime = response.requestOptions.extra['startTime'] as DateTime?;
    if (startTime != null) {
      return DateTime.now().difference(startTime).inMilliseconds;
    }
    return 0;
  }

  /// 顶部分割线
  String _divider(String title, {String char = '═'}) {
    final side = char * 20;
    return '╔$side $title $side╗';
  }

  /// 底部分割线
  String _bottomDivider({String char = '═'}) {
    return '╚${char * 50}╝';
  }
}

/// 便捷别名
typedef HttpLogger = NetworkLogger;
