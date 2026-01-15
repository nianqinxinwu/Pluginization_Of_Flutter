import 'dart:io';

import 'package:dio/dio.dart';

import '../config/env_config.dart';
import 'dio_interceptors.dart';
import 'http_headers.dart';
import 'network_logger.dart';

/// 网络请求响应结果
class ApiResult<T> {
  const ApiResult({
    required this.success,
    this.data,
    this.message,
    this.code,
  });

  /// 是否成功
  final bool success;

  /// 响应数据
  final T? data;

  /// 错误/提示信息
  final String? message;

  /// 业务状态码
  final int? code;

  /// 创建成功结果
  factory ApiResult.success(T data, {String? message, int? code}) {
    return ApiResult(
      success: true,
      data: data,
      message: message,
      code: code,
    );
  }

  /// 创建失败结果
  factory ApiResult.failure(String message, {int? code}) {
    return ApiResult(
      success: false,
      message: message,
      code: code,
    );
  }
}

/// Dio Client - 网络请求封装
///
/// 提供完整的 RESTful API 支持，包括：
/// - GET, POST, PUT, DELETE, PATCH 方法
/// - 加密/不加密两种模式
/// - 基础 Header / 全量 Header 可配置
/// - 文件上传/下载
///
/// 使用示例：
/// ```dart
/// // 1. 初始化（在 main.dart 中）
/// await DioClient.instance.init();
///
/// // 2. 普通请求（不加密，全量 Header）
/// final result = await DioClient.instance.get('/api/users');
///
/// // 3. 加密请求
/// final result = await DioClient.instance.postEncrypted(
///   '/api/login',
///   data: {'username': 'test', 'password': '123456'},
/// );
///
/// // 4. 自定义配置请求
/// final result = await DioClient.instance.post(
///   '/api/data',
///   data: {'key': 'value'},
///   headerType: HeaderType.basic,
///   encryptConfig: EncryptConfig.full,
/// );
/// ```
class DioClient {
  DioClient._();

  static DioClient? _instance;
  late Dio _dio;
  bool _initialized = false;

  static DioClient get instance {
    _instance ??= DioClient._();
    return _instance!;
  }

  /// 获取 Dio 实例（用于高级自定义）
  Dio get dio => _dio;

  /// 是否已初始化
  bool get isInitialized => _initialized;

  // ==================== 初始化 ====================

  /// 初始化 Dio Client
  ///
  /// [baseUrl] 基础 URL，为空则从 EnvConfig 获取
  /// [connectTimeout] 连接超时时间
  /// [receiveTimeout] 接收超时时间
  /// [sendTimeout] 发送超时时间
  /// [onTokenExpired] Token 过期回调
  /// [onError] 错误回调（用于显示 Toast）
  /// [logConfig] 日志配置，默认使用完整日志
  Future<void> init({
    String? baseUrl,
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 30),
    Duration sendTimeout = const Duration(seconds: 30),
    Future<void> Function()? onTokenExpired,
    void Function(String message)? onError,
    NetworkLogConfig logConfig = NetworkLogConfig.full,
  }) async {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? EnvConfig.instance.baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );

    // 添加拦截器（顺序重要）
    _dio.interceptors.addAll([
      // 1. 认证拦截器（添加 Header）
      AuthInterceptor(onTokenExpired: onTokenExpired),
      // 2. 加密拦截器
      EncryptInterceptor(),
      // 3. 重试拦截器
      RetryInterceptor(dio: _dio),
      // 4. 日志拦截器（使用完整打印）
      AppLogInterceptor(logConfig: logConfig),
      // 5. 错误拦截器（最后处理错误）
      ErrorInterceptor(onError: onError),
    ]);

    _initialized = true;
  }

  /// 更新 BaseUrl
  void updateBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  // ==================== RESTful API（不加密） ====================

  /// GET 请求
  ///
  /// [path] 请求路径
  /// [queryParameters] 查询参数
  /// [headerType] Header 类型（默认全量）
  /// [options] 额外配置
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.full,
    Options? options,
    CancelToken? cancelToken,
    bool showLoading = false,
    bool showErrorToast = true,
    int retryCount = 0,
  }) {
    return _request<T>(
      path,
      method: 'GET',
      queryParameters: queryParameters,
      headerType: headerType,
      encryptConfig: EncryptConfig.none,
      options: options,
      cancelToken: cancelToken,
      showLoading: showLoading,
      showErrorToast: showErrorToast,
      retryCount: retryCount,
    );
  }

  /// POST 请求
  ///
  /// [path] 请求路径
  /// [data] 请求体数据
  /// [queryParameters] 查询参数
  /// [headerType] Header 类型（默认全量）
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.full,
    Options? options,
    CancelToken? cancelToken,
    bool showLoading = false,
    bool showErrorToast = true,
    int retryCount = 0,
  }) {
    return _request<T>(
      path,
      method: 'POST',
      data: data,
      queryParameters: queryParameters,
      headerType: headerType,
      encryptConfig: EncryptConfig.none,
      options: options,
      cancelToken: cancelToken,
      showLoading: showLoading,
      showErrorToast: showErrorToast,
      retryCount: retryCount,
    );
  }

  /// PUT 请求
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.full,
    Options? options,
    CancelToken? cancelToken,
    bool showLoading = false,
    bool showErrorToast = true,
    int retryCount = 0,
  }) {
    return _request<T>(
      path,
      method: 'PUT',
      data: data,
      queryParameters: queryParameters,
      headerType: headerType,
      encryptConfig: EncryptConfig.none,
      options: options,
      cancelToken: cancelToken,
      showLoading: showLoading,
      showErrorToast: showErrorToast,
      retryCount: retryCount,
    );
  }

  /// DELETE 请求
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.full,
    Options? options,
    CancelToken? cancelToken,
    bool showLoading = false,
    bool showErrorToast = true,
    int retryCount = 0,
  }) {
    return _request<T>(
      path,
      method: 'DELETE',
      data: data,
      queryParameters: queryParameters,
      headerType: headerType,
      encryptConfig: EncryptConfig.none,
      options: options,
      cancelToken: cancelToken,
      showLoading: showLoading,
      showErrorToast: showErrorToast,
      retryCount: retryCount,
    );
  }

  /// PATCH 请求
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.full,
    Options? options,
    CancelToken? cancelToken,
    bool showLoading = false,
    bool showErrorToast = true,
    int retryCount = 0,
  }) {
    return _request<T>(
      path,
      method: 'PATCH',
      data: data,
      queryParameters: queryParameters,
      headerType: headerType,
      encryptConfig: EncryptConfig.none,
      options: options,
      cancelToken: cancelToken,
      showLoading: showLoading,
      showErrorToast: showErrorToast,
      retryCount: retryCount,
    );
  }

  // ==================== RESTful API（加密） ====================

  /// GET 请求（加密）
  Future<Response<T>> getEncrypted<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.full,
    EncryptConfig encryptConfig = EncryptConfig.full,
    Options? options,
    CancelToken? cancelToken,
    bool showLoading = false,
    bool showErrorToast = true,
    int retryCount = 0,
  }) {
    return _request<T>(
      path,
      method: 'GET',
      queryParameters: queryParameters,
      headerType: headerType,
      encryptConfig: encryptConfig,
      options: options,
      cancelToken: cancelToken,
      showLoading: showLoading,
      showErrorToast: showErrorToast,
      retryCount: retryCount,
    );
  }

  /// POST 请求（加密）
  Future<Response<T>> postEncrypted<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.full,
    EncryptConfig encryptConfig = EncryptConfig.full,
    Options? options,
    CancelToken? cancelToken,
    bool showLoading = false,
    bool showErrorToast = true,
    int retryCount = 0,
  }) {
    return _request<T>(
      path,
      method: 'POST',
      data: data,
      queryParameters: queryParameters,
      headerType: headerType,
      encryptConfig: encryptConfig,
      options: options,
      cancelToken: cancelToken,
      showLoading: showLoading,
      showErrorToast: showErrorToast,
      retryCount: retryCount,
    );
  }

  /// PUT 请求（加密）
  Future<Response<T>> putEncrypted<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.full,
    EncryptConfig encryptConfig = EncryptConfig.full,
    Options? options,
    CancelToken? cancelToken,
    bool showLoading = false,
    bool showErrorToast = true,
    int retryCount = 0,
  }) {
    return _request<T>(
      path,
      method: 'PUT',
      data: data,
      queryParameters: queryParameters,
      headerType: headerType,
      encryptConfig: encryptConfig,
      options: options,
      cancelToken: cancelToken,
      showLoading: showLoading,
      showErrorToast: showErrorToast,
      retryCount: retryCount,
    );
  }

  /// DELETE 请求（加密）
  Future<Response<T>> deleteEncrypted<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.full,
    EncryptConfig encryptConfig = EncryptConfig.full,
    Options? options,
    CancelToken? cancelToken,
    bool showLoading = false,
    bool showErrorToast = true,
    int retryCount = 0,
  }) {
    return _request<T>(
      path,
      method: 'DELETE',
      data: data,
      queryParameters: queryParameters,
      headerType: headerType,
      encryptConfig: encryptConfig,
      options: options,
      cancelToken: cancelToken,
      showLoading: showLoading,
      showErrorToast: showErrorToast,
      retryCount: retryCount,
    );
  }

  /// PATCH 请求（加密）
  Future<Response<T>> patchEncrypted<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.full,
    EncryptConfig encryptConfig = EncryptConfig.full,
    Options? options,
    CancelToken? cancelToken,
    bool showLoading = false,
    bool showErrorToast = true,
    int retryCount = 0,
  }) {
    return _request<T>(
      path,
      method: 'PATCH',
      data: data,
      queryParameters: queryParameters,
      headerType: headerType,
      encryptConfig: encryptConfig,
      options: options,
      cancelToken: cancelToken,
      showLoading: showLoading,
      showErrorToast: showErrorToast,
      retryCount: retryCount,
    );
  }

  // ==================== 自定义请求 ====================

  /// 通用请求方法
  ///
  /// 支持完全自定义 Header 类型和加密配置
  Future<Response<T>> request<T>(
    String path, {
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.full,
    EncryptConfig encryptConfig = EncryptConfig.none,
    Options? options,
    CancelToken? cancelToken,
    bool showLoading = false,
    bool showErrorToast = true,
    int retryCount = 0,
  }) {
    return _request<T>(
      path,
      method: method,
      data: data,
      queryParameters: queryParameters,
      headerType: headerType,
      encryptConfig: encryptConfig,
      options: options,
      cancelToken: cancelToken,
      showLoading: showLoading,
      showErrorToast: showErrorToast,
      retryCount: retryCount,
    );
  }

  // ==================== 文件操作 ====================

  /// 上传文件
  ///
  /// [path] 上传接口路径
  /// [file] 文件
  /// [fileKey] 文件字段名
  /// [data] 额外参数
  /// [onSendProgress] 上传进度回调
  Future<Response<T>> uploadFile<T>(
    String path, {
    required File file,
    String fileKey = 'file',
    Map<String, dynamic>? data,
    HeaderType headerType = HeaderType.full,
    void Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    final fileName = file.path.split('/').last;
    final formData = FormData.fromMap({
      fileKey: await MultipartFile.fromFile(file.path, filename: fileName),
      ...?data,
    });

    return _request<T>(
      path,
      method: 'POST',
      data: formData,
      headerType: headerType,
      encryptConfig: EncryptConfig.none,
      options: Options(contentType: Headers.multipartFormDataContentType),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
    );
  }

  /// 上传多个文件
  Future<Response<T>> uploadFiles<T>(
    String path, {
    required List<File> files,
    String fileKey = 'files',
    Map<String, dynamic>? data,
    HeaderType headerType = HeaderType.full,
    void Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    final multipartFiles = <MultipartFile>[];
    for (final file in files) {
      final fileName = file.path.split('/').last;
      multipartFiles.add(
        await MultipartFile.fromFile(file.path, filename: fileName),
      );
    }

    final formData = FormData.fromMap({
      fileKey: multipartFiles,
      ...?data,
    });

    return _request<T>(
      path,
      method: 'POST',
      data: formData,
      headerType: headerType,
      encryptConfig: EncryptConfig.none,
      options: Options(contentType: Headers.multipartFormDataContentType),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
    );
  }

  /// 下载文件
  ///
  /// [url] 文件 URL
  /// [savePath] 保存路径
  /// [onReceiveProgress] 下载进度回调
  Future<Response> downloadFile(
    String url,
    String savePath, {
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.basic,
    void Function(int received, int total)? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    final extra = RequestExtra(
      headerType: headerType,
      encryptConfig: EncryptConfig.none,
    );

    return _dio.download(
      url,
      savePath,
      queryParameters: queryParameters,
      options: Options(
        extra: {'requestExtra': extra.toMap()},
      ),
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );
  }

  // ==================== 私有方法 ====================

  /// 内部请求方法
  Future<Response<T>> _request<T>(
    String path, {
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    HeaderType headerType = HeaderType.full,
    EncryptConfig encryptConfig = EncryptConfig.none,
    Options? options,
    CancelToken? cancelToken,
    bool showLoading = false,
    bool showErrorToast = true,
    int retryCount = 0,
    void Function(int sent, int total)? onSendProgress,
    void Function(int received, int total)? onReceiveProgress,
  }) {
    // 构建请求配置
    final requestExtra = RequestExtra(
      headerType: headerType,
      encryptConfig: encryptConfig,
      showLoading: showLoading,
      showErrorToast: showErrorToast,
      retryCount: retryCount,
    );

    // 合并 Options
    final mergedOptions = (options ?? Options()).copyWith(
      method: method,
      extra: {
        ...?options?.extra,
        'requestExtra': requestExtra.toMap(),
      },
    );

    return _dio.request<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: mergedOptions,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}

/// 便捷别名
typedef Http = DioClient;
