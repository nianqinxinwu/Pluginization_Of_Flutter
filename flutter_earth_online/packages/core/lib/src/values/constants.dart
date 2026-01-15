/// 应用常量配置
///
/// 存储 Key、配置常量等
class AppConstants {
  AppConstants._();

  // ==================== 存储 Key ====================

  /// 语言代码
  static const String storageLanguageCode = 'language_code';

  /// 主题模式
  static const String storageThemeCode = 'theme_code';

  /// 是否已打开过（首次引导页）
  static const String storageAlreadyOpen = 'already_open';

  /// 用户 Token
  static const String storageToken = 'token';

  /// 刷新 Token
  static const String storageRefreshToken = 'refresh_token';

  /// 用户资料
  static const String storageProfile = 'profile';

  /// 用户 ID
  static const String storageUserId = 'user_id';

  /// 设备 ID
  static const String storageDeviceId = 'device_id';

  // ==================== 缓存 Key ====================

  /// 首页 Banner
  static const String cacheHomeBanner = 'cache_home_banner';

  /// 首页分类
  static const String cacheHomeCategories = 'cache_home_categories';

  /// 商品分类
  static const String cacheProductCategories = 'cache_product_categories';

  /// 搜索历史
  static const String cacheSearchHistory = 'cache_search_history';

  // ==================== 配置常量 ====================

  /// 分页默认每页数量
  static const int pageSize = 20;

  /// 搜索防抖时间（毫秒）
  static const int searchDebounceMs = 300;

  /// Toast 显示时间（毫秒）
  static const int toastDurationMs = 2000;

  /// 缓存过期时间（小时）
  static const int cacheExpireHours = 24;

  /// 图片压缩质量
  static const int imageCompressQuality = 80;

  /// 图片最大宽度
  static const int imageMaxWidth = 1080;

  /// 图片最大高度
  static const int imageMaxHeight = 1920;

  // ==================== 正则表达式 ====================

  /// 手机号正则（中国大陆）
  static final RegExp phoneRegex = RegExp(r'^1[3-9]\d{9}$');

  /// 邮箱正则
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// 身份证号正则
  static final RegExp idCardRegex = RegExp(
    r'^[1-9]\d{5}(18|19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])\d{3}[\dXx]$',
  );

  /// URL 正则
  static final RegExp urlRegex = RegExp(
    r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
  );

  // ==================== 动画时长 ====================

  /// 快速动画
  static const Duration animationFast = Duration(milliseconds: 150);

  /// 普通动画
  static const Duration animationNormal = Duration(milliseconds: 300);

  /// 慢速动画
  static const Duration animationSlow = Duration(milliseconds: 500);
}

/// 存储 Key 便捷访问
///
/// 使用示例：
/// ```dart
/// Storage.setString(StorageKeys.token, 'xxx');
/// ```
typedef StorageKeys = AppConstants;
