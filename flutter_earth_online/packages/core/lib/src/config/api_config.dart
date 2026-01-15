/// API Configuration - 接口地址配置
///
/// 采用混合管理模式：
/// - 公共接口：集中在 core 包的 [CommonApi]
/// - 私有接口：分布在各业务模块，继承 [ApiBuilder]
///
/// 使用示例：
/// ```dart
/// // 1. 使用公共接口
/// dio.get(CommonApi.appConfig);
///
/// // 2. 使用模块私有接口
/// final userApi = UserApi();
/// dio.post(userApi.login, data: {...});
/// ```

/// API 版本前缀
///
/// 用于统一管理所有 API 版本前缀，避免硬编码
abstract class ApiPrefix {
  ApiPrefix._();

  /// RESTful API v1
  static const String v1 = '/api/v1';

  /// RESTful API v2
  static const String v2 = '/api/v2';

  /// 管理后台 API
  static const String admin = '/admin/api/v1';

  /// AI 服务 API
  static const String ai = '/ai/v1';

  /// WebSocket 服务
  static const String wss = '/wss/v1';

  /// 开放平台 API
  static const String open = '/open/api/v1';

  /// 自定义前缀（用于特殊场景）
  static String custom(String prefix, {String version = 'v1'}) {
    return '/$prefix/$version';
  }
}

/// 服务类型枚举
///
/// 用于区分不同的后端服务
enum ServiceType {
  /// 主服务（baseUrl）
  main,

  /// AI 服务（aiServiceUrl）
  ai,

  /// WebSocket 服务（wssUrl）
  wss,

  /// 其他服务（otherBaseUrl）
  other,
}

/// 公共接口定义
///
/// 多模块共享的接口统一定义在此处
abstract class CommonApi {
  CommonApi._();

  // ==================== 应用配置 ====================

  /// 获取应用配置
  static const String appConfig = '${ApiPrefix.v1}/app/config';

  /// 获取应用版本信息
  static const String appVersion = '${ApiPrefix.v1}/app/version';

  /// 检查更新
  static const String checkUpdate = '${ApiPrefix.v1}/app/check-update';

  // ==================== 通用功能 ====================

  /// 文件上传
  static const String uploadFile = '${ApiPrefix.v1}/common/upload';

  /// 图片上传
  static const String uploadImage = '${ApiPrefix.v1}/common/upload/image';

  /// 视频上传
  static const String uploadVideo = '${ApiPrefix.v1}/common/upload/video';

  /// 获取地区列表
  static const String regionList = '${ApiPrefix.v1}/common/regions';

  /// 获取字典数据
  static const String dictList = '${ApiPrefix.v1}/common/dict';

  // ==================== 验证相关 ====================

  /// 发送短信验证码
  static const String sendSmsCode = '${ApiPrefix.v1}/common/sms/send';

  /// 验证短信验证码
  static const String verifySmsCode = '${ApiPrefix.v1}/common/sms/verify';

  /// 发送邮箱验证码
  static const String sendEmailCode = '${ApiPrefix.v1}/common/email/send';

  // ==================== 搜索相关 ====================

  /// 热门搜索
  static const String hotSearch = '${ApiPrefix.v1}/common/search/hot';

  /// 搜索建议
  static const String searchSuggest = '${ApiPrefix.v1}/common/search/suggest';
}

/// 接口构建器基类
///
/// 业务模块继承此类来定义模块私有接口
///
/// 使用示例：
/// ```dart
/// class UserApi extends ApiBuilder {
///   const UserApi() : super(ApiPrefix.v1);
///
///   String get login => path('/user/login');
///   String get register => path('/user/register');
/// }
/// ```
abstract class ApiBuilder {
  /// API 前缀
  final String prefix;

  /// 服务类型，默认为主服务
  final ServiceType serviceType;

  const ApiBuilder(
    this.prefix, {
    this.serviceType = ServiceType.main,
  });

  /// 构建完整的接口路径
  ///
  /// [endpoint] 接口路径，如 '/user/login'
  String path(String endpoint) {
    // 确保 endpoint 以 / 开头
    final normalizedEndpoint =
        endpoint.startsWith('/') ? endpoint : '/$endpoint';
    return '$prefix$normalizedEndpoint';
  }

  /// 构建带参数的接口路径
  ///
  /// [endpoint] 接口路径模板，如 '/user/{id}/profile'
  /// [params] 路径参数，如 {'id': '123'}
  ///
  /// 示例：
  /// ```dart
  /// pathWithParams('/user/{id}/profile', {'id': '123'})
  /// // 返回: '/api/v1/user/123/profile'
  /// ```
  String pathWithParams(String endpoint, Map<String, dynamic> params) {
    var result = endpoint;
    params.forEach((key, value) {
      result = result.replaceAll('{$key}', value.toString());
    });
    return path(result);
  }

  /// 构建带查询参数的接口路径
  ///
  /// [endpoint] 接口路径
  /// [queryParams] 查询参数
  ///
  /// 示例：
  /// ```dart
  /// pathWithQuery('/user/list', {'page': 1, 'size': 10})
  /// // 返回: '/api/v1/user/list?page=1&size=10'
  /// ```
  String pathWithQuery(String endpoint, Map<String, dynamic> queryParams) {
    final basePath = path(endpoint);
    if (queryParams.isEmpty) return basePath;

    final queryString = queryParams.entries
        .where((e) => e.value != null)
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
        .join('&');

    return '$basePath?$queryString';
  }
}

/// 分页接口构建器
///
/// 提供分页相关的便捷方法
abstract class PaginatedApiBuilder extends ApiBuilder {
  const PaginatedApiBuilder(
    super.prefix, {
    super.serviceType,
  });

  /// 构建分页接口路径
  ///
  /// [endpoint] 接口路径
  /// [page] 页码，从 1 开始
  /// [pageSize] 每页数量
  /// [extraParams] 额外参数
  String paginatedPath(
    String endpoint, {
    int page = 1,
    int pageSize = 20,
    Map<String, dynamic>? extraParams,
  }) {
    final params = <String, dynamic>{
      'page': page,
      'pageSize': pageSize,
      ...?extraParams,
    };
    return pathWithQuery(endpoint, params);
  }
}

/// RESTful 接口构建器
///
/// 提供 RESTful 风格的 CRUD 便捷方法
abstract class RestfulApiBuilder extends PaginatedApiBuilder {
  /// 资源名称，如 'user', 'order'
  String get resource;

  const RestfulApiBuilder(
    super.prefix, {
    super.serviceType,
  });

  /// 获取列表 GET /resource
  String get list => path('/$resource');

  /// 获取详情 GET /resource/{id}
  String detail(dynamic id) => path('/$resource/$id');

  /// 创建 POST /resource
  String get create => path('/$resource');

  /// 更新 PUT /resource/{id}
  String update(dynamic id) => path('/$resource/$id');

  /// 删除 DELETE /resource/{id}
  String delete(dynamic id) => path('/$resource/$id');

  /// 分页列表
  String pagedList({
    int page = 1,
    int pageSize = 20,
    Map<String, dynamic>? filters,
  }) {
    return paginatedPath(
      '/$resource',
      page: page,
      pageSize: pageSize,
      extraParams: filters,
    );
  }
}
