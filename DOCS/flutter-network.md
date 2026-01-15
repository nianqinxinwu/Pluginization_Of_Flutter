# Flutter 网络请求规范

本技能文件定义 `packages/core/network` 中网络模块的标准使用方式。

---

## 导入方式

```dart
import 'package:core/core.dart';
```

---

## DioClient 基础用法

### 初始化

```dart
// 使用默认配置
final client = DioClient();

// 自定义配置
final client = DioClient(
  baseUrl: 'https://api.example.com',
  connectTimeout: Duration(seconds: 30),
  receiveTimeout: Duration(seconds: 30),
  enableLog: true,
  enableRetry: true,
  maxRetries: 3,
);
```

### GET 请求

```dart
// 基础 GET
final response = await client.get<Map<String, dynamic>>(
  '/users',
  queryParameters: {'page': 1, 'limit': 10},
);

// 使用基础 Header
final response = await client.get<Map<String, dynamic>>(
  '/public/data',
  headerType: HeaderType.basic,
);
```

### POST 请求

```dart
// JSON 数据
final response = await client.post<Map<String, dynamic>>(
  '/users',
  data: {'name': '张三', 'email': 'zhangsan@example.com'},
);

// 表单数据
final response = await client.post<Map<String, dynamic>>(
  '/login',
  data: FormData.fromMap({
    'username': 'admin',
    'password': '123456',
  }),
);
```

### PUT / DELETE / PATCH

```dart
// PUT
final response = await client.put<Map<String, dynamic>>(
  '/users/1',
  data: {'name': '李四'},
);

// DELETE
final response = await client.delete<void>('/users/1');

// PATCH
final response = await client.patch<Map<String, dynamic>>(
  '/users/1',
  data: {'status': 'active'},
);
```

---

## Header 配置

### HeaderType.basic（基础 Header）

适用于公开接口，不需要身份验证：

```dart
final response = await client.get<Map<String, dynamic>>(
  '/public/config',
  headerType: HeaderType.basic,
);
```

包含字段：
- `Content-Type`: application/json
- `Accept`: application/json
- `X-Platform`: iOS/Android
- `X-App-Version`: 应用版本
- `X-Device-Id`: 设备标识

### HeaderType.full（完整 Header）

适用于需要身份验证的接口（**默认**）：

```dart
final response = await client.get<Map<String, dynamic>>(
  '/user/profile',
  headerType: HeaderType.full,
);
```

额外包含：
- `Authorization`: Bearer {token}
- `X-Refresh-Token`: 刷新令牌

### Token 管理

```dart
// 保存 Token
await HttpHeaders.saveToken(
  accessToken: 'your_access_token',
  refreshToken: 'your_refresh_token',
);

// 获取 Token
final token = await HttpHeaders.getToken();

// 清除 Token
await HttpHeaders.clearTokens();
```

---

## 加密请求

### 加密配置

```dart
enum EncryptConfig {
  none,           // 不加密
  requestOnly,    // 仅加密请求
  responseOnly,   // 仅加密响应
  full,           // 请求和响应都加密
}
```

### 加密方法

```dart
// 加密 GET
final response = await client.getEncrypted<Map<String, dynamic>>(
  '/secure/data',
  encryptConfig: EncryptConfig.full,
);

// 加密 POST（敏感数据必须使用）
final response = await client.postEncrypted<Map<String, dynamic>>(
  '/auth/login',
  data: {'password': password},
  encryptConfig: EncryptConfig.full,
);

// 加密 PUT
final response = await client.putEncrypted<Map<String, dynamic>>(
  '/secure/users/1',
  data: {'password': 'newPassword'},
);

// 加密 DELETE
final response = await client.deleteEncrypted<void>('/secure/users/1');

// 加密 PATCH
final response = await client.patchEncrypted<Map<String, dynamic>>(
  '/secure/users/1',
  data: {'email': 'new@example.com'},
);
```

---

## 文件上传与下载

### 文件上传

```dart
final response = await client.uploadFile<Map<String, dynamic>>(
  '/upload',
  file: File('/path/to/image.jpg'),
  fileKey: 'file',
  extraData: {'description': '用户头像'},
  onSendProgress: (sent, total) {
    final progress = (sent / total * 100).toStringAsFixed(1);
    print('上传进度: $progress%');
  },
);
```

### 普通下载

```dart
final response = await client.downloadFile(
  'https://example.com/file.zip',
  '/path/to/save/file.zip',
  onReceiveProgress: (received, total) {
    if (total != -1) {
      print('下载进度: ${(received / total * 100).toStringAsFixed(1)}%');
    }
  },
);
```

---

## 分段下载 (ChunkedDownloader)

### 下载到内存

```dart
final downloader = ChunkedDownloader();

final result = await downloader.downloadAndMerge(
  url: 'https://example.com/large-file.zip',
  onProgress: (progress) {
    print('进度: ${progress.progressPercent.toStringAsFixed(1)}%');
    print('速度: ${progress.speedFormatted}');
  },
);

if (result.success) {
  final data = result.mergedData!;
  // 使用数据...
}
```

### 下载到文件

```dart
final result = await downloader.downloadToFile(
  url: 'https://example.com/large-file.zip',
  savePath: '/path/to/save/file.zip',
  onProgress: (progress) {
    print('进度: ${progress.progressPercent.toStringAsFixed(1)}%');
    print('剩余时间: ${progress.remainingTimeFormatted}');
  },
);

if (result.success) {
  print('文件已保存到: ${result.filePath}');
}
```

### 下载到临时文件

```dart
final result = await downloader.downloadToTempFile(
  url: 'https://example.com/video.mp4',
  fileName: 'my_video.mp4',
  fileType: TempFileType.video,
  onProgress: (progress) {
    print('进度: ${progress.progressPercent.toStringAsFixed(1)}%');
  },
);

if (result.success && result.tempFileInfo != null) {
  final tempFile = result.tempFileInfo!;
  print('临时文件: ${tempFile.path}');

  // 使用完后删除
  await tempFile.delete();
}
```

### 取消下载

```dart
final cancelToken = CancelToken();

// 开始下载
downloader.downloadToFile(
  url: url,
  savePath: savePath,
  cancelToken: cancelToken,
);

// 取消
cancelToken.cancel('用户取消');
```

---

## 日志配置

### 预设配置

```dart
// 完整日志（开发环境推荐）
final client = DioClient(logConfig: NetworkLogConfig.full);

// 简洁日志
final client = DioClient(logConfig: NetworkLogConfig.minimal);

// 无日志（生产环境）
final client = DioClient(logConfig: NetworkLogConfig.none);

// 仅错误日志
final client = DioClient(logConfig: NetworkLogConfig.errorOnly);
```

### 自定义配置

```dart
final logConfig = NetworkLogConfig(
  enableRequestLog: true,
  enableResponseLog: true,
  enableErrorLog: true,
  enableHeaderLog: true,
  enableBodyLog: true,
  useDeveloperLog: true,   // 使用 developer.log（无截断）
  maxPrintLength: 0,       // 0 = 不限制
  prettyJson: true,
);

final client = DioClient(logConfig: logConfig);
```

---

## 错误处理

### 异常类型处理

```dart
try {
  final response = await client.get('/api/data');
} on DioException catch (e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      showError('连接超时');
      break;
    case DioExceptionType.sendTimeout:
      showError('发送超时');
      break;
    case DioExceptionType.receiveTimeout:
      showError('接收超时');
      break;
    case DioExceptionType.badResponse:
      handleHttpError(e.response?.statusCode);
      break;
    case DioExceptionType.cancel:
      // 请求已取消，通常不需要处理
      break;
    default:
      showError('网络错误');
  }
}
```

### HTTP 状态码处理

```dart
void handleHttpError(int? statusCode) {
  switch (statusCode) {
    case 400:
      showError('请求参数错误');
      break;
    case 401:
      // 清除 Token 并跳转登录
      HttpHeaders.clearTokens();
      navigateToLogin();
      break;
    case 403:
      showError('没有权限');
      break;
    case 404:
      showError('资源不存在');
      break;
    case 500:
      showError('服务器错误');
      break;
    default:
      showError('未知错误');
  }
}
```

---

## 服务层封装

### 标准 API 服务

```dart
class UserService {
  final DioClient _client;

  UserService([DioClient? client]) : _client = client ?? DioClient();

  /// 获取用户信息
  Future<User> getUser(String id) async {
    final response = await _client.get<Map<String, dynamic>>('/users/$id');
    return User.fromJson(response.data!);
  }

  /// 获取用户列表
  Future<List<User>> getUsers({int page = 1, int limit = 20}) async {
    final response = await _client.get<List<dynamic>>(
      '/users',
      queryParameters: {'page': page, 'limit': limit},
    );
    return response.data!.map((e) => User.fromJson(e)).toList();
  }

  /// 创建用户
  Future<User> createUser(User user) async {
    final response = await _client.post<Map<String, dynamic>>(
      '/users',
      data: user.toJson(),
    );
    return User.fromJson(response.data!);
  }

  /// 更新用户
  Future<User> updateUser(String id, Map<String, dynamic> data) async {
    final response = await _client.put<Map<String, dynamic>>(
      '/users/$id',
      data: data,
    );
    return User.fromJson(response.data!);
  }

  /// 删除用户
  Future<void> deleteUser(String id) async {
    await _client.delete('/users/$id');
  }
}
```

### 敏感数据服务

```dart
class AuthService {
  final DioClient _client;

  AuthService([DioClient? client]) : _client = client ?? DioClient();

  /// 登录（加密传输）
  Future<LoginResult> login(String username, String password) async {
    final response = await _client.postEncrypted<Map<String, dynamic>>(
      '/auth/login',
      data: {'username': username, 'password': password},
      headerType: HeaderType.basic,
      encryptConfig: EncryptConfig.full,
    );

    final result = LoginResult.fromJson(response.data!);

    // 保存 Token
    await HttpHeaders.saveToken(
      accessToken: result.accessToken,
      refreshToken: result.refreshToken,
    );

    return result;
  }

  /// 修改密码（加密传输）
  Future<void> changePassword(String oldPassword, String newPassword) async {
    await _client.postEncrypted<void>(
      '/auth/change-password',
      data: {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      },
      encryptConfig: EncryptConfig.full,
    );
  }

  /// 登出
  Future<void> logout() async {
    await _client.post('/auth/logout');
    await HttpHeaders.clearTokens();
  }
}
```

### 服务 Provider

```dart
@riverpod
UserService userService(Ref ref) {
  return UserService();
}

@riverpod
AuthService authService(Ref ref) {
  return AuthService();
}
```

---

## 网络请求规则

### 1. 必须使用 DioClient

```dart
// ✅ 正确
final client = DioClient();
final response = await client.get('/users');

// ❌ 错误
final dio = Dio();
final response = await dio.get('/users');
```

### 2. 敏感数据必须加密

```dart
// ✅ 正确 - 密码等敏感数据使用加密
await client.postEncrypted('/login', data: {'password': pwd});

// ❌ 错误 - 明文传输敏感数据
await client.post('/login', data: {'password': pwd});
```

### 3. 公开接口使用基础 Header

```dart
// ✅ 正确 - 公开接口不带 Token
await client.get('/public/config', headerType: HeaderType.basic);

// ❌ 错误 - 公开接口带完整 Header
await client.get('/public/config', headerType: HeaderType.full);
```

### 4. 返回值使用 Freezed 模型

```dart
// ✅ 正确 - 使用 Freezed 模型
final response = await client.get<Map<String, dynamic>>('/user');
return User.fromJson(response.data!);

// ❌ 错误 - 直接使用 Map
final response = await client.get('/user');
return response.data;
```

### 5. 通过 AsyncValue 暴露给 UI

```dart
// ✅ 正确 - 使用 AsyncValue
@riverpod
Future<List<User>> users(Ref ref) async {
  final service = ref.read(userServiceProvider);
  return service.getUsers();
}

// 在 UI 中
final usersAsync = ref.watch(usersProvider);
return usersAsync.when(
  loading: () => CircularProgressIndicator(),
  error: (e, s) => AppErrorWidget(title: e.toString()),
  data: (users) => _buildList(users),
);
```

---

## 方法速查表

| 用途 | 方法 |
|------|------|
| GET 请求 | `client.get()` |
| POST 请求 | `client.post()` |
| PUT 请求 | `client.put()` |
| DELETE 请求 | `client.delete()` |
| PATCH 请求 | `client.patch()` |
| 加密 GET | `client.getEncrypted()` |
| 加密 POST | `client.postEncrypted()` |
| 加密 PUT | `client.putEncrypted()` |
| 加密 DELETE | `client.deleteEncrypted()` |
| 加密 PATCH | `client.patchEncrypted()` |
| 文件上传 | `client.uploadFile()` |
| 普通下载 | `client.downloadFile()` |
| 分段下载 | `ChunkedDownloader.downloadToFile()` |
| 保存 Token | `HttpHeaders.saveToken()` |
| 清除 Token | `HttpHeaders.clearTokens()` |

---

## 检查清单

### 新建 API 服务

- [ ] 创建服务类并注入 DioClient
- [ ] 敏感接口使用加密方法
- [ ] 返回值使用 Freezed 模型
- [ ] 创建对应的 Provider
- [ ] 添加到 index.dart 导出

### 网络请求

- [ ] 使用 DioClient 而非原生 Dio
- [ ] 选择正确的 HeaderType
- [ ] 敏感数据使用加密传输
- [ ] 正确处理异常
- [ ] 通过 AsyncValue 暴露给 UI
