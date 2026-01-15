import 'dart:convert';

import 'package:dio/dio.dart';

import '../config/env_config.dart';
import '../utils/encrypt.dart';
import 'http_headers.dart';
import 'network_logger.dart';

/// 加密模式枚举
enum EncryptMode {
  /// 不加密
  none,

  /// 仅加密请求
  requestOnly,

  /// 仅加密响应
  responseOnly,

  /// 请求和响应都加密
  both,
}

/// 加密配置
class EncryptConfig {
  const EncryptConfig({
    this.mode = EncryptMode.none,
    this.key,
    this.iv,
    this.encryptedDataKey = 'data',
  });

  /// 加密模式
  final EncryptMode mode;

  /// AES 密钥（为空则使用默认密钥）
  final String? key;

  /// AES IV（为空则使用默认 IV）
  final String? iv;

  /// 加密数据在响应中的 key
  final String encryptedDataKey;

  /// 是否需要加密请求
  bool get shouldEncryptRequest =>
      mode == EncryptMode.requestOnly || mode == EncryptMode.both;

  /// 是否需要解密响应
  bool get shouldDecryptResponse =>
      mode == EncryptMode.responseOnly || mode == EncryptMode.both;

  /// 不加密的配置
  static const EncryptConfig none = EncryptConfig(mode: EncryptMode.none);

  /// 完全加密的配置
  static const EncryptConfig full = EncryptConfig(mode: EncryptMode.both);
}

// ==================== 请求配置扩展 ====================

/// 请求额外配置
class RequestExtra {
  const RequestExtra({
    this.headerType = HeaderType.full,
    this.encryptConfig = EncryptConfig.none,
    this.showLoading = false,
    this.showErrorToast = true,
    this.retryCount = 0,
  });

  /// Header 类型
  final HeaderType headerType;

  /// 加密配置
  final EncryptConfig encryptConfig;

  /// 是否显示 Loading
  final bool showLoading;

  /// 是否显示错误 Toast
  final bool showErrorToast;

  /// 重试次数
  final int retryCount;

  Map<String, dynamic> toMap() {
    return {
      'headerType': headerType.index,
      'encryptConfig': {
        'mode': encryptConfig.mode.index,
        'key': encryptConfig.key,
        'iv': encryptConfig.iv,
        'encryptedDataKey': encryptConfig.encryptedDataKey,
      },
      'showLoading': showLoading,
      'showErrorToast': showErrorToast,
      'retryCount': retryCount,
    };
  }

  static RequestExtra fromMap(Map<String, dynamic>? map) {
    if (map == null) return const RequestExtra();

    final encryptMap = map['encryptConfig'] as Map<String, dynamic>?;
    EncryptConfig encryptConfig = EncryptConfig.none;

    if (encryptMap != null) {
      encryptConfig = EncryptConfig(
        mode: EncryptMode.values[encryptMap['mode'] as int? ?? 0],
        key: encryptMap['key'] as String?,
        iv: encryptMap['iv'] as String?,
        encryptedDataKey: encryptMap['encryptedDataKey'] as String? ?? 'data',
      );
    }

    return RequestExtra(
      headerType: HeaderType.values[map['headerType'] as int? ?? 1],
      encryptConfig: encryptConfig,
      showLoading: map['showLoading'] as bool? ?? false,
      showErrorToast: map['showErrorToast'] as bool? ?? true,
      retryCount: map['retryCount'] as int? ?? 0,
    );
  }
}

// ==================== 拦截器实现 ====================

/// Auth Interceptor - 认证拦截器
///
/// 负责：
/// 1. 根据配置添加对应类型的 Header
/// 2. Token 过期处理（401）
/// 3. Token 刷新
class AuthInterceptor extends Interceptor {
  AuthInterceptor({this.onTokenExpired});

  /// Token 过期回调
  final Future<void> Function()? onTokenExpired;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 获取请求配置
    final extra = RequestExtra.fromMap(
      options.extra['requestExtra'] as Map<String, dynamic>?,
    );

    // 根据配置获取对应类型的 Header
    final headers = await HttpHeaders.getHeaders(extra.headerType);

    // 合并 Header
    options.headers.addAll(headers);

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 处理 401 未授权错误
    if (err.response?.statusCode == 401) {
      onTokenExpired?.call();
    }

    handler.next(err);
  }
}

/// Encrypt Interceptor - 加密/解密拦截器
///
/// 负责：
/// 1. 请求数据加密（POST/PUT/PATCH body）
/// 2. 响应数据解密
class EncryptInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final extra = RequestExtra.fromMap(
      options.extra['requestExtra'] as Map<String, dynamic>?,
    );

    // 如果需要加密请求且有请求体
    if (extra.encryptConfig.shouldEncryptRequest && options.data != null) {
      try {
        Map<String, dynamic> dataMap;

        if (options.data is Map<String, dynamic>) {
          dataMap = options.data as Map<String, dynamic>;
        } else if (options.data is String) {
          dataMap = jsonDecode(options.data as String) as Map<String, dynamic>;
        } else {
          // 不支持的数据类型，跳过加密
          handler.next(options);
          return;
        }

        // AES 加密
        final encryptedData = EncryptUtil.encryptJson(
          dataMap,
          key: extra.encryptConfig.key,
          iv: extra.encryptConfig.iv,
        );

        // 替换请求数据
        options.data = {
          extra.encryptConfig.encryptedDataKey: encryptedData,
        };

        // 标记请求已加密
        options.extra['isEncrypted'] = true;
      } catch (e) {
        // 加密失败，继续发送原始数据
        handler.next(options);
        return;
      }
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final extra = RequestExtra.fromMap(
      response.requestOptions.extra['requestExtra'] as Map<String, dynamic>?,
    );

    // 如果需要解密响应
    if (extra.encryptConfig.shouldDecryptResponse && response.data != null) {
      try {
        final responseData = response.data;
        String? encryptedData;

        if (responseData is Map<String, dynamic>) {
          encryptedData =
              responseData[extra.encryptConfig.encryptedDataKey] as String?;
        } else if (responseData is String) {
          encryptedData = responseData;
        }

        if (encryptedData != null && encryptedData.isNotEmpty) {
          // AES 解密
          final decryptedData = EncryptUtil.decryptJson(
            encryptedData,
            key: extra.encryptConfig.key,
            iv: extra.encryptConfig.iv,
          );

          // 替换响应数据
          response.data = decryptedData;
        }
      } catch (e) {
        // 解密失败，返回原始数据
        handler.next(response);
        return;
      }
    }

    handler.next(response);
  }
}

/// Log Interceptor - 日志拦截器
///
/// 负责：
/// 1. 请求日志打印
/// 2. 响应日志打印
/// 3. 错误日志打印
///
/// 使用 [NetworkLogger] 进行完整日志打印，支持：
/// - developer.log 不截断日志
/// - 格式化 JSON 输出
/// - 可配置的日志级别和内容
class AppLogInterceptor extends Interceptor {
  AppLogInterceptor({
    this.enableLog = true,
    NetworkLogConfig? logConfig,
  }) {
    // 初始化日志配置
    if (logConfig != null) {
      NetworkLogger.instance.init(config: logConfig);
    }
  }

  final bool enableLog;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_shouldLog) {
      NetworkLogger.instance.logRequest(options);
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (_shouldLog) {
      NetworkLogger.instance.logResponse(response);
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_shouldLog) {
      NetworkLogger.instance.logError(err);
    }
    handler.next(err);
  }

  bool get _shouldLog => enableLog && EnvConfig.instance.enableLog;
}

/// Error Interceptor - 错误处理拦截器
///
/// 负责：
/// 1. 统一错误格式
/// 2. 网络错误处理
/// 3. 服务端错误处理
class ErrorInterceptor extends Interceptor {
  ErrorInterceptor({this.onError});

  /// 错误回调（用于显示 Toast 等）
  final void Function(String message)? onError;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 记录请求开始时间
    options.extra['startTime'] = DateTime.now();
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final extra = RequestExtra.fromMap(
      err.requestOptions.extra['requestExtra'] as Map<String, dynamic>?,
    );

    // 解析错误信息
    final message = _parseError(err);

    // 如果配置了显示错误 Toast
    if (extra.showErrorToast) {
      onError?.call(message);
    }

    // 包装为自定义异常
    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: err.error,
        message: message,
      ),
    );
  }

  String _parseError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return '连接超时，请检查网络';
      case DioExceptionType.sendTimeout:
        return '发送超时，请检查网络';
      case DioExceptionType.receiveTimeout:
        return '接收超时，请检查网络';
      case DioExceptionType.badCertificate:
        return '证书验证失败';
      case DioExceptionType.badResponse:
        return _parseResponseError(err.response);
      case DioExceptionType.cancel:
        return '请求已取消';
      case DioExceptionType.connectionError:
        return '网络连接失败，请检查网络';
      case DioExceptionType.unknown:
        if (err.error != null) {
          return err.error.toString();
        }
        return '未知错误';
    }
  }

  String _parseResponseError(Response? response) {
    if (response == null) return '服务器无响应';

    final statusCode = response.statusCode ?? 0;

    // 尝试从响应体获取错误信息
    if (response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;
      final message = data['message'] ?? data['msg'] ?? data['error'];
      if (message != null) return message.toString();
    }

    // 根据状态码返回默认错误信息
    switch (statusCode) {
      case 400:
        return '请求参数错误';
      case 401:
        return '未授权，请重新登录';
      case 403:
        return '拒绝访问';
      case 404:
        return '请求的资源不存在';
      case 405:
        return '请求方法不允许';
      case 408:
        return '请求超时';
      case 500:
        return '服务器内部错误';
      case 502:
        return '网关错误';
      case 503:
        return '服务不可用';
      case 504:
        return '网关超时';
      default:
        return '请求失败 ($statusCode)';
    }
  }
}

/// Retry Interceptor - 重试拦截器
///
/// 负责：
/// 1. 请求失败自动重试
/// 2. 可配置重试次数和间隔
class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    required this.dio,
    this.retryDelays = const [
      Duration(seconds: 1),
      Duration(seconds: 2),
      Duration(seconds: 3),
    ],
  });

  final Dio dio;
  final List<Duration> retryDelays;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final extra = RequestExtra.fromMap(
      err.requestOptions.extra['requestExtra'] as Map<String, dynamic>?,
    );

    // 获取当前重试次数
    final currentRetry = err.requestOptions.extra['currentRetry'] as int? ?? 0;

    // 检查是否需要重试
    if (_shouldRetry(err) &&
        currentRetry < extra.retryCount &&
        currentRetry < retryDelays.length) {
      // 等待后重试
      await Future<void>.delayed(retryDelays[currentRetry]);

      // 更新重试次数
      err.requestOptions.extra['currentRetry'] = currentRetry + 1;

      try {
        // 重新发起请求
        final response = await dio.fetch(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        // 重试失败，继续传递错误
      }
    }

    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response?.statusCode != null &&
            err.response!.statusCode! >= 500);
  }
}
