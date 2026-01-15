import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:core/core.dart';

part 'demo_api_service.g.dart';

/// Demo API Service - 示例网络请求服务
class DemoApiService {
  DemoApiService(this._dio);

  final Dio _dio;

  /// 获取用户列表 (示例)
  Future<Response> fetchUsers({int page = 1, int pageSize = 10}) async {
    return _dio.get(
      '/users',
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
      },
    );
  }

  /// 获取用户详情 (示例)
  Future<Response> fetchUserDetail(int userId) async {
    return _dio.get('/users/$userId');
  }

  /// 测试 GET 请求
  Future<Response> testGet(String path, {Map<String, dynamic>? params}) async {
    return _dio.get(path, queryParameters: params);
  }

  /// 测试 POST 请求
  Future<Response> testPost(String path, {Map<String, dynamic>? data}) async {
    return _dio.post(path, data: data);
  }
}

/// DemoApiService Provider
@riverpod
DemoApiService demoApiService(DemoApiServiceRef ref) {
  final dio = Dio(BaseOptions(
    baseUrl: EnvConfig.instance.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  ));

  return DemoApiService(dio);
}
