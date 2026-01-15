import 'dart:io';

import '../config/env_config.dart';
import '../utils/storage.dart';

/// Header 类型枚举
enum HeaderType {
  /// 基础 Header - 仅包含基本信息
  basic,

  /// 全量 Header - 包含认证和完整设备信息
  full,
}

/// HTTP Headers 配置
///
/// 提供基础 Header 和全量 Header 两种配置
///
/// 使用示例：
/// ```dart
/// // 基础 Header（无需认证的接口）
/// final headers = HttpHeaders.basic;
///
/// // 全量 Header（需要认证的接口）
/// final headers = await HttpHeaders.full();
///
/// // 根据类型获取
/// final headers = await HttpHeaders.getHeaders(HeaderType.full);
/// ```
class HttpHeaders {
  HttpHeaders._();

  // ==================== 存储 Key ====================

  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _deviceIdKey = 'device_id';

  // ==================== Token 管理 ====================

  /// 获取存储的 Token
  static Future<String?> getToken() async {
    return Storage.instance.getString(_tokenKey);
  }

  /// 保存 Token
  static Future<void> saveToken(String token) async {
    await Storage.instance.setString(_tokenKey, token);
  }

  /// 获取 Refresh Token
  static Future<String?> getRefreshToken() async {
    return Storage.instance.getString(_refreshTokenKey);
  }

  /// 保存 Refresh Token
  static Future<void> saveRefreshToken(String token) async {
    await Storage.instance.setString(_refreshTokenKey, token);
  }

  /// 清除所有 Token
  static Future<void> clearTokens() async {
    await Storage.instance.remove(_tokenKey);
    await Storage.instance.remove(_refreshTokenKey);
  }

  /// 获取用户 ID
  static Future<String?> getUserId() async {
    return Storage.instance.getString(_userIdKey);
  }

  /// 保存用户 ID
  static Future<void> saveUserId(String userId) async {
    await Storage.instance.setString(_userIdKey, userId);
  }

  /// 获取设备 ID
  static Future<String?> getDeviceId() async {
    return Storage.instance.getString(_deviceIdKey);
  }

  /// 保存设备 ID
  static Future<void> saveDeviceId(String deviceId) async {
    await Storage.instance.setString(_deviceIdKey, deviceId);
  }

  // ==================== Header 构建 ====================

  /// 基础 Header
  ///
  /// 包含：Content-Type, Accept, Platform, App-Version, Env
  static Map<String, String> get basic {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Platform': _platform,
      'App-Version': _appVersion,
      'Env': EnvConfig.instance.currentEnvType.label,
    };
  }

  /// 全量 Header（异步）
  ///
  /// 包含基础 Header + Authorization, User-Id, Device-Id, Timestamp, Nonce
  static Future<Map<String, String>> full() async {
    final token = await getToken();
    final userId = await getUserId();
    final deviceId = await getDeviceId();

    return {
      ...basic,
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
      if (userId != null && userId.isNotEmpty) 'User-Id': userId,
      if (deviceId != null && deviceId.isNotEmpty) 'Device-Id': deviceId,
      'Timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
      'Nonce': _generateNonce(),
    };
  }

  /// 根据类型获取 Header
  static Future<Map<String, String>> getHeaders(HeaderType type) async {
    switch (type) {
      case HeaderType.basic:
        return basic;
      case HeaderType.full:
        return full();
    }
  }

  /// 创建自定义 Header
  ///
  /// [type] Header 类型（基础或全量）
  /// [extra] 额外的 Header 字段
  static Future<Map<String, String>> custom({
    HeaderType type = HeaderType.basic,
    Map<String, String>? extra,
  }) async {
    final headers = await getHeaders(type);
    if (extra != null) {
      headers.addAll(extra);
    }
    return headers;
  }

  // ==================== 私有方法 ====================

  /// 获取平台标识
  static String get _platform {
    if (Platform.isAndroid) return 'android';
    if (Platform.isIOS) return 'ios';
    if (Platform.isMacOS) return 'macos';
    if (Platform.isWindows) return 'windows';
    if (Platform.isLinux) return 'linux';
    return 'unknown';
  }

  /// 获取应用版本（可从 PackageInfo 获取，这里用占位符）
  static String get _appVersion => '1.0.0';

  /// 生成随机 Nonce
  static String _generateNonce() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final random = now % 100000;
    return '$now$random';
  }
}
