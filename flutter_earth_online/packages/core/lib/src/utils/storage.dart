import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储工具类
///
/// 基于 SharedPreferences 的单例封装，提供类型安全的存取方法
///
/// 使用前需要初始化：
/// ```dart
/// await Storage.instance.init();
/// ```
class Storage {
  Storage._internal();

  static final Storage _instance = Storage._internal();

  /// 获取单例实例
  static Storage get instance => _instance;

  late final SharedPreferences _prefs;
  bool _initialized = false;

  /// 是否已初始化
  bool get isInitialized => _initialized;

  /// 初始化存储
  Future<void> init() async {
    if (_initialized) return;
    _prefs = await SharedPreferences.getInstance();
    _initialized = true;
  }

  /// 确保已初始化
  void _ensureInitialized() {
    if (!_initialized) {
      throw StateError('Storage has not been initialized. Call init() first.');
    }
  }

  // ==================== String ====================

  /// 存储字符串
  Future<bool> setString(String key, String value) async {
    _ensureInitialized();
    return _prefs.setString(key, value);
  }

  /// 获取字符串
  String getString(String key, {String defaultValue = ''}) {
    _ensureInitialized();
    return _prefs.getString(key) ?? defaultValue;
  }

  /// 获取字符串（可空）
  String? getStringOrNull(String key) {
    _ensureInitialized();
    return _prefs.getString(key);
  }

  // ==================== Bool ====================

  /// 存储布尔值
  Future<bool> setBool(String key, bool value) async {
    _ensureInitialized();
    return _prefs.setBool(key, value);
  }

  /// 获取布尔值
  bool getBool(String key, {bool defaultValue = false}) {
    _ensureInitialized();
    return _prefs.getBool(key) ?? defaultValue;
  }

  // ==================== Int ====================

  /// 存储整数
  Future<bool> setInt(String key, int value) async {
    _ensureInitialized();
    return _prefs.setInt(key, value);
  }

  /// 获取整数
  int getInt(String key, {int defaultValue = 0}) {
    _ensureInitialized();
    return _prefs.getInt(key) ?? defaultValue;
  }

  // ==================== Double ====================

  /// 存储浮点数
  Future<bool> setDouble(String key, double value) async {
    _ensureInitialized();
    return _prefs.setDouble(key, value);
  }

  /// 获取浮点数
  double getDouble(String key, {double defaultValue = 0.0}) {
    _ensureInitialized();
    return _prefs.getDouble(key) ?? defaultValue;
  }

  // ==================== List<String> ====================

  /// 存储字符串列表
  Future<bool> setStringList(String key, List<String> value) async {
    _ensureInitialized();
    return _prefs.setStringList(key, value);
  }

  /// 获取字符串列表
  List<String> getStringList(String key) {
    _ensureInitialized();
    return _prefs.getStringList(key) ?? [];
  }

  // ==================== JSON ====================

  /// 存储 JSON 对象
  Future<bool> setJson(String key, Object value) async {
    _ensureInitialized();
    return _prefs.setString(key, jsonEncode(value));
  }

  /// 获取 JSON 对象
  T? getJson<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    _ensureInitialized();
    final jsonString = _prefs.getString(key);
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final map = jsonDecode(jsonString) as Map<String, dynamic>;
      return fromJson(map);
    } catch (e) {
      return null;
    }
  }

  /// 获取 JSON Map
  Map<String, dynamic>? getJsonMap(String key) {
    _ensureInitialized();
    final jsonString = _prefs.getString(key);
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  /// 获取 JSON List
  List<T>? getJsonList<T>(
      String key, T Function(Map<String, dynamic>) fromJson) {
    _ensureInitialized();
    final jsonString = _prefs.getString(key);
    if (jsonString == null || jsonString.isEmpty) return null;
    try {
      final list = jsonDecode(jsonString) as List;
      return list
          .map((item) => fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return null;
    }
  }

  // ==================== 通用操作 ====================

  /// 检查 key 是否存在
  bool containsKey(String key) {
    _ensureInitialized();
    return _prefs.containsKey(key);
  }

  /// 删除指定 key
  Future<bool> remove(String key) async {
    _ensureInitialized();
    return _prefs.remove(key);
  }

  /// 删除多个 key
  Future<void> removeAll(List<String> keys) async {
    _ensureInitialized();
    for (final key in keys) {
      await _prefs.remove(key);
    }
  }

  /// 清空所有数据
  Future<bool> clear() async {
    _ensureInitialized();
    return _prefs.clear();
  }

  /// 获取所有 key
  Set<String> getKeys() {
    _ensureInitialized();
    return _prefs.getKeys();
  }
}

/// 便捷别名
typedef AppStorage = Storage;
