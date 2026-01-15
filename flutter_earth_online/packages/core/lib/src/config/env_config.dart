import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 环境类型枚举
enum EnvType {
  /// 开发环境
  development,

  /// 测试环境
  test,

  /// 预发布环境
  production,

  /// 线上环境
  release,
}

/// 环境类型扩展
extension EnvTypeExtension on EnvType {
  /// 环境显示标识
  String get label {
    switch (this) {
      case EnvType.development:
        return 'dev';
      case EnvType.test:
        return 'test';
      case EnvType.production:
        return 'prePro';
      case EnvType.release:
        return 'release';
    }
  }

  /// 环境中文名称
  String get displayName {
    switch (this) {
      case EnvType.development:
        return '开发环境';
      case EnvType.test:
        return '测试环境';
      case EnvType.production:
        return '预发布环境';
      case EnvType.release:
        return '线上环境';
    }
  }
}

/// 环境配置
class EnvConfiguration {
  const EnvConfiguration({
    required this.envType,
    required this.baseUrl,
    required this.wsUrl,
    required this.wssUrl,
    required this.aiServiceUrl,
    required this.otherBaseUrl,
    this.enableLog = true,
  });

  /// 环境类型
  final EnvType envType;

  /// API 基础地址
  final String baseUrl;

  /// WebSocket 地址 (ws://)
  final String wsUrl;

  /// WebSocket 安全连接地址 (wss://)
  final String wssUrl;

  /// AI 服务器地址
  final String aiServiceUrl;

  /// 额外服务器地址
  final String otherBaseUrl;

  /// 是否启用日志
  final bool enableLog;
}

/// Environment Configuration - 环境变量配置
class EnvConfig {
  EnvConfig._();

  static EnvConfig? _instance;

  static EnvConfig get instance {
    _instance ??= EnvConfig._();
    return _instance!;
  }

  static const String _envStorageKey = 'app_env_type';

  /// 环境配置映射表
  static final Map<EnvType, EnvConfiguration> _envConfigurations = {
    EnvType.development: const EnvConfiguration(
      envType: EnvType.development,
      baseUrl: 'https://dev-api.example.com',
      wsUrl: 'ws://dev-ws.example.com',
      wssUrl: 'wss://dev-ws.example.com',
      aiServiceUrl: 'https://dev-ai.example.com',
      otherBaseUrl: 'https://dev-other.example.com',
      enableLog: true,
    ),
    EnvType.test: const EnvConfiguration(
      envType: EnvType.test,
      baseUrl: 'https://test-api.example.com',
      wsUrl: 'ws://test-ws.example.com',
      wssUrl: 'wss://test-ws.example.com',
      aiServiceUrl: 'https://test-ai.example.com',
      otherBaseUrl: 'https://test-other.example.com',
      enableLog: true,
    ),
    EnvType.production: const EnvConfiguration(
      envType: EnvType.production,
      baseUrl: 'https://pre-api.example.com',
      wsUrl: 'ws://pre-ws.example.com',
      wssUrl: 'wss://pre-ws.example.com',
      aiServiceUrl: 'https://pre-ai.example.com',
      otherBaseUrl: 'https://pre-other.example.com',
      enableLog: true,
    ),
    EnvType.release: const EnvConfiguration(
      envType: EnvType.release,
      baseUrl: 'https://api.example.com',
      wsUrl: 'ws://ws.example.com',
      wssUrl: 'wss://ws.example.com',
      aiServiceUrl: 'https://ai.example.com',
      otherBaseUrl: 'https://other.example.com',
      enableLog: false,
    ),
  };

  /// 当前环境类型
  EnvType _currentEnvType = EnvType.release;

  /// 环境变更回调列表
  final List<VoidCallback> _listeners = [];

  /// 获取当前环境类型
  EnvType get currentEnvType => _currentEnvType;

  /// 获取当前环境配置
  EnvConfiguration get currentConfig => _envConfigurations[_currentEnvType]!;

  /// 获取当前 API 基础地址
  String get baseUrl => currentConfig.baseUrl;

  /// 获取当前 WebSocket 地址 (ws://)
  String get wsUrl => currentConfig.wsUrl;

  /// 获取当前 WebSocket 安全连接地址 (wss://)
  String get wssUrl => currentConfig.wssUrl;

  /// 获取当前 AI 服务器地址
  String get aiServiceUrl => currentConfig.aiServiceUrl;

  /// 获取当前额外服务器地址
  String get otherBaseUrl => currentConfig.otherBaseUrl;

  /// 是否启用日志
  bool get enableLog => currentConfig.enableLog;

  /// 是否为 Release 环境
  bool get isRelease => _currentEnvType == EnvType.release;

  /// 是否显示环境切换按钮 (非 Release 环境显示)
  bool get showEnvSwitcher => !isRelease;

  /// 初始化环境配置
  /// [defaultEnv] 默认环境类型，仅在没有缓存时使用
  Future<void> init({EnvType defaultEnv = EnvType.release}) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEnvIndex = prefs.getInt(_envStorageKey);

    if (savedEnvIndex != null &&
        savedEnvIndex >= 0 &&
        savedEnvIndex < EnvType.values.length) {
      _currentEnvType = EnvType.values[savedEnvIndex];
    } else {
      _currentEnvType = defaultEnv;
    }
  }

  /// 切换环境
  Future<void> switchEnv(EnvType envType) async {
    if (_currentEnvType == envType) return;

    _currentEnvType = envType;

    // 持久化存储
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_envStorageKey, envType.index);

    // 通知监听者
    _notifyListeners();
  }

  /// 添加环境变更监听
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  /// 移除环境变更监听
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  /// 通知所有监听者
  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  /// 获取所有环境配置
  List<EnvConfiguration> get allConfigurations =>
      _envConfigurations.values.toList();

  /// 获取指定环境的配置
  EnvConfiguration getConfig(EnvType envType) => _envConfigurations[envType]!;
}
