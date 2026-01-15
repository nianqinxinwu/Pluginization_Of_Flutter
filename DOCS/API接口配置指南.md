# API 接口配置指南

本文档说明在 Flutter 插件化项目中如何配置和管理 API 接口。

## 架构概述

采用 **混合管理模式（方案 C）**：
- **公共接口**：集中在 `packages/core` 的 `CommonApi`
- **私有接口**：分布在各业务模块，继承 `ApiBuilder`

```
packages/core/lib/src/config/
├── api_config.dart          # 前缀 + 基础类 + 公共接口

packages/features/feature_xxx/lib/src/
├── api/
│   ├── xxx_api.dart         # 模块私有接口
│   └── index.dart           # 统一导出
```

## 核心类说明

### 1. ApiPrefix - API 版本前缀

```dart
abstract class ApiPrefix {
  static const String v1 = '/api/v1';       // RESTful API v1
  static const String v2 = '/api/v2';       // RESTful API v2
  static const String admin = '/admin/api/v1'; // 管理后台
  static const String ai = '/ai/v1';        // AI 服务
  static const String wss = '/wss/v1';      // WebSocket
  static const String open = '/open/api/v1'; // 开放平台

  // 自定义前缀
  static String custom(String prefix, {String version = 'v1'});
}
```

### 2. ServiceType - 服务类型

```dart
enum ServiceType {
  main,   // 主服务（baseUrl）
  ai,     // AI 服务（aiServiceUrl）
  wss,    // WebSocket 服务（wssUrl）
  other,  // 其他服务（otherBaseUrl）
}
```

### 3. CommonApi - 公共接口

多模块共享的接口集中定义：

```dart
abstract class CommonApi {
  // 应用配置
  static const String appConfig = '${ApiPrefix.v1}/app/config';
  static const String checkUpdate = '${ApiPrefix.v1}/app/check-update';

  // 通用功能
  static const String uploadFile = '${ApiPrefix.v1}/common/upload';
  static const String regionList = '${ApiPrefix.v1}/common/regions';

  // 验证相关
  static const String sendSmsCode = '${ApiPrefix.v1}/common/sms/send';
}
```

### 4. ApiBuilder - 接口构建器基类

业务模块继承此类定义私有接口：

```dart
abstract class ApiBuilder {
  final String prefix;
  final ServiceType serviceType;

  // 构建完整路径
  String path(String endpoint);

  // 带路径参数
  String pathWithParams(String endpoint, Map<String, dynamic> params);

  // 带查询参数
  String pathWithQuery(String endpoint, Map<String, dynamic> queryParams);
}
```

### 5. PaginatedApiBuilder - 分页接口构建器

```dart
abstract class PaginatedApiBuilder extends ApiBuilder {
  // 构建分页接口
  String paginatedPath(
    String endpoint, {
    int page = 1,
    int pageSize = 20,
    Map<String, dynamic>? extraParams,
  });
}
```

### 6. RestfulApiBuilder - RESTful 接口构建器

```dart
abstract class RestfulApiBuilder extends PaginatedApiBuilder {
  String get resource;  // 资源名称

  String get list;              // GET /resource
  String detail(dynamic id);    // GET /resource/{id}
  String get create;            // POST /resource
  String update(dynamic id);    // PUT /resource/{id}
  String delete(dynamic id);    // DELETE /resource/{id}
  String pagedList({...});      // GET /resource?page=1&pageSize=20
}
```

## 使用示例

### 1. 基础使用 - 继承 ApiBuilder

```dart
// feature_user/lib/src/api/user_api.dart
import 'package:core/core.dart';

class UserApi extends ApiBuilder {
  const UserApi() : super(ApiPrefix.v1);

  /// POST /api/v1/user/login
  String get login => path('/user/login');

  /// GET /api/v1/user/profile
  String get profile => path('/user/profile');

  /// GET /api/v1/user/{id}
  String userDetail(String userId) =>
      pathWithParams('/user/{id}', {'id': userId});
}
```

### 2. RESTful 风格 - 继承 RestfulApiBuilder

```dart
class ArticleApi extends RestfulApiBuilder {
  const ArticleApi() : super(ApiPrefix.v1);

  @override
  String get resource => 'article';

  // 自动获得以下方法：
  // - list: GET /api/v1/article
  // - detail(id): GET /api/v1/article/{id}
  // - create: POST /api/v1/article
  // - update(id): PUT /api/v1/article/{id}
  // - delete(id): DELETE /api/v1/article/{id}

  /// 自定义方法：POST /api/v1/article/{id}/like
  String like(dynamic id) => path('/article/$id/like');

  /// 搜索文章
  String search(String keyword, {int page = 1, int pageSize = 20}) {
    return paginatedPath(
      '/article/search',
      page: page,
      pageSize: pageSize,
      extraParams: {'keyword': keyword},
    );
  }
}
```

### 3. 不同服务类型

```dart
// AI 服务
class AiApi extends ApiBuilder {
  const AiApi() : super(ApiPrefix.ai, serviceType: ServiceType.ai);

  String get chatCompletions => path('/chat/completions');
}

// WebSocket 服务
class WsApi extends ApiBuilder {
  const WsApi() : super(ApiPrefix.wss, serviceType: ServiceType.wss);

  String chatRoom(String roomId) =>
      pathWithParams('/chat/{roomId}', {'roomId': roomId});
}
```

### 4. 模块 API 入口

```dart
// feature_xxx/lib/src/api/xxx_api.dart
class XxxModuleApi {
  const XxxModuleApi();

  UserApi get user => const UserApi();
  ArticleApi get article => const ArticleApi();
  AiApi get ai => const AiApi();
}

// 全局实例
const xxxApi = XxxModuleApi();

// 使用
dio.post(xxxApi.user.login, data: {...});
dio.get(xxxApi.article.detail(123));
```

## 与 Dio 配合使用

```dart
// 网络请求封装
class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> request(
    String path, {
    ServiceType serviceType = ServiceType.main,
    ...
  }) {
    // 根据 serviceType 选择不同的 baseUrl
    final baseUrl = _getBaseUrl(serviceType);
    return _dio.request(baseUrl + path, ...);
  }

  String _getBaseUrl(ServiceType type) {
    final env = EnvConfig.instance.currentConfig;
    switch (type) {
      case ServiceType.main:
        return env.baseUrl;
      case ServiceType.ai:
        return env.aiServiceUrl;
      case ServiceType.wss:
        return env.wssUrl;
      case ServiceType.other:
        return env.otherBaseUrl;
    }
  }
}
```

## 目录结构规范

```
packages/features/feature_xxx/
├── lib/
│   ├── feature_xxx.dart       # 模块入口
│   └── src/
│       ├── api/               # API 定义
│       │   ├── user_api.dart
│       │   ├── order_api.dart
│       │   └── index.dart     # 统一导出
│       ├── pages/
│       ├── widgets/
│       ├── providers/
│       └── index.dart
```

## 命名规范

| 类型 | 命名规则 | 示例 |
|------|----------|------|
| API 类 | `XxxApi` | `UserApi`, `OrderApi` |
| 方法名 | 小驼峰 | `login`, `getUserInfo` |
| 路径参数 | `{paramName}` | `/user/{id}/profile` |
| 资源名 | 小写复数 | `users`, `articles` |

## 最佳实践

1. **公共接口放 Core**：跨模块共享的接口放在 `CommonApi`
2. **私有接口放模块**：模块特有的接口放在各自的 `api/` 目录
3. **使用常量**：API 路径定义为 getter 或常量，避免硬编码
4. **统一前缀**：所有前缀通过 `ApiPrefix` 管理
5. **类型安全**：使用 `ServiceType` 区分不同服务
6. **RESTful 优先**：资源类接口优先使用 `RestfulApiBuilder`
