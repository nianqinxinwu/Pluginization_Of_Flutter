import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:core/core.dart';

part 'demo_provider.g.dart';

/// Demo 网络请求状态管理
@riverpod
class DemoNetwork extends _$DemoNetwork {
  late final Dio _dio;

  @override
  FutureOr<String?> build() {
    _dio = Dio(BaseOptions(
      baseUrl: EnvConfig.instance.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
    return null;
  }

  /// 测试 GET 请求
  Future<void> testGetRequest() async {
    state = const AsyncValue.loading();

    try {
      // 使用 httpbin.org 作为测试 API
      final response = await Dio().get('https://httpbin.org/get', queryParameters: {
        'env': EnvConfig.instance.currentEnvType.label,
        'timestamp': DateTime.now().toIso8601String(),
      });

      final prettyJson = const JsonEncoder.withIndent('  ').convert(response.data);
      state = AsyncValue.data('GET 请求成功\n\n$prettyJson');
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  /// 测试 POST 请求
  Future<void> testPostRequest() async {
    state = const AsyncValue.loading();

    try {
      // 使用 httpbin.org 作为测试 API
      final response = await Dio().post(
        'https://httpbin.org/post',
        data: {
          'env': EnvConfig.instance.currentEnvType.label,
          'baseUrl': EnvConfig.instance.baseUrl,
          'message': 'Hello from Flutter!',
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      final prettyJson = const JsonEncoder.withIndent('  ').convert(response.data);
      state = AsyncValue.data('POST 请求成功\n\n$prettyJson');
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  /// 自定义请求测试
  Future<void> customRequest({
    required String url,
    String method = 'GET',
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
  }) async {
    state = const AsyncValue.loading();

    try {
      final Response response;
      if (method.toUpperCase() == 'POST') {
        response = await _dio.post(url, data: data, queryParameters: params);
      } else {
        response = await _dio.get(url, queryParameters: params);
      }

      final prettyJson = const JsonEncoder.withIndent('  ').convert(response.data);
      state = AsyncValue.data('$method 请求成功\n\n$prettyJson');
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }
}
