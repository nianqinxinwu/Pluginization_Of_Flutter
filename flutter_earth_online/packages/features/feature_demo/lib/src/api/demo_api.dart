import 'package:core/core.dart';

/// Demo 模块 API 定义
///
/// 展示如何在业务模块中定义私有接口
///
/// 使用示例：
/// ```dart
/// final api = DemoApi();
///
/// // 基础使用
/// dio.get(api.userList);
///
/// // 带路径参数
/// dio.get(api.userDetail('123'));
///
/// // 分页查询
/// dio.get(api.userPagedList(page: 1, pageSize: 20));
/// ```

/// 用户相关接口
class UserApi extends ApiBuilder {
  const UserApi() : super(ApiPrefix.v1);

  /// 用户登录 POST /api/v1/user/login
  String get login => path('/user/login');

  /// 用户注册 POST /api/v1/user/register
  String get register => path('/user/register');

  /// 用户退出 POST /api/v1/user/logout
  String get logout => path('/user/logout');

  /// 获取用户信息 GET /api/v1/user/profile
  String get profile => path('/user/profile');

  /// 更新用户信息 PUT /api/v1/user/profile
  String get updateProfile => path('/user/profile');

  /// 修改密码 POST /api/v1/user/password
  String get changePassword => path('/user/password');

  /// 获取指定用户信息 GET /api/v1/user/{id}
  String userDetail(String userId) => pathWithParams('/user/{id}', {'id': userId});

  /// 关注用户 POST /api/v1/user/{id}/follow
  String followUser(String userId) => pathWithParams('/user/{id}/follow', {'id': userId});
}

/// 文章相关接口（RESTful 风格示例）
class ArticleApi extends RestfulApiBuilder {
  const ArticleApi() : super(ApiPrefix.v1);

  @override
  String get resource => 'article';

  // 继承自 RestfulApiBuilder 的方法：
  // - list: GET /api/v1/article
  // - detail(id): GET /api/v1/article/{id}
  // - create: POST /api/v1/article
  // - update(id): PUT /api/v1/article/{id}
  // - delete(id): DELETE /api/v1/article/{id}
  // - pagedList(): GET /api/v1/article?page=1&pageSize=20

  /// 文章点赞 POST /api/v1/article/{id}/like
  String like(dynamic id) => path('/article/$id/like');

  /// 文章评论列表 GET /api/v1/article/{id}/comments
  String comments(dynamic id) => path('/article/$id/comments');

  /// 文章收藏 POST /api/v1/article/{id}/favorite
  String favorite(dynamic id) => path('/article/$id/favorite');

  /// 按分类获取文章
  String byCategory(String categoryId, {int page = 1, int pageSize = 20}) {
    return paginatedPath(
      '/article/category/$categoryId',
      page: page,
      pageSize: pageSize,
    );
  }

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

/// AI 服务接口示例
class AiApi extends ApiBuilder {
  const AiApi() : super(ApiPrefix.ai, serviceType: ServiceType.ai);

  /// 文本对话 POST /ai/v1/chat/completions
  String get chatCompletions => path('/chat/completions');

  /// 图像生成 POST /ai/v1/images/generations
  String get imageGeneration => path('/images/generations');

  /// 语音转文字 POST /ai/v1/audio/transcriptions
  String get audioTranscription => path('/audio/transcriptions');

  /// 文字转语音 POST /ai/v1/audio/speech
  String get textToSpeech => path('/audio/speech');
}

/// WebSocket 接口示例
class WsApi extends ApiBuilder {
  const WsApi() : super(ApiPrefix.wss, serviceType: ServiceType.wss);

  /// 聊天房间 WS /wss/v1/chat/{roomId}
  String chatRoom(String roomId) => pathWithParams('/chat/{roomId}', {'roomId': roomId});

  /// 通知推送 WS /wss/v1/notification
  String get notification => path('/notification');

  /// 实时数据 WS /wss/v1/realtime/{channel}
  String realtime(String channel) => pathWithParams('/realtime/{channel}', {'channel': channel});
}

/// Demo 模块 API 入口
///
/// 提供统一的 API 访问入口
class DemoApi {
  const DemoApi();

  /// 用户相关接口
  UserApi get user => const UserApi();

  /// 文章相关接口
  ArticleApi get article => const ArticleApi();

  /// AI 服务接口
  AiApi get ai => const AiApi();

  /// WebSocket 接口
  WsApi get ws => const WsApi();
}

/// 全局 API 实例
const demoApi = DemoApi();
