import 'dart:io';
import 'dart:typed_data';

import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';

/// 保存结果
class GallerySaveResult {
  const GallerySaveResult({
    required this.success,
    this.filePath,
    this.error,
  });

  /// 是否成功
  final bool success;

  /// 保存后的文件路径
  final String? filePath;

  /// 错误信息
  final String? error;

  /// 创建成功结果
  factory GallerySaveResult.success(String? filePath) {
    return GallerySaveResult(success: true, filePath: filePath);
  }

  /// 创建失败结果
  factory GallerySaveResult.failure(String error) {
    return GallerySaveResult(success: false, error: error);
  }
}

/// 相册保存工具
///
/// 提供保存图片和视频到系统相册的功能
///
/// 使用示例：
/// ```dart
/// // 保存图片数据到相册
/// final result = await GallerySaver.saveImage(
///   imageBytes,
///   name: 'my_image',
///   quality: 100,
/// );
///
/// // 保存图片文件到相册
/// final result = await GallerySaver.saveImageFile(
///   File('/path/to/image.jpg'),
/// );
///
/// // 保存视频到相册
/// final result = await GallerySaver.saveVideoFile(
///   File('/path/to/video.mp4'),
/// );
///
/// // 保存网络图片到相册
/// final result = await GallerySaver.saveNetworkImage(
///   'https://example.com/image.jpg',
/// );
/// ```
class GallerySaver {
  GallerySaver._();

  // ==================== 保存图片 ====================

  /// 保存图片数据到相册
  ///
  /// [imageBytes] 图片数据
  /// [name] 文件名（不含扩展名）
  /// [quality] 图片质量（1-100）
  /// [isReturnImagePath] 是否返回保存路径
  static Future<GallerySaveResult> saveImage(
    Uint8List imageBytes, {
    String? name,
    int quality = 100,
    bool isReturnImagePath = true,
  }) async {
    try {
      final result = await ImageGallerySaverPlus.saveImage(
        imageBytes,
        name: name ?? 'image_${DateTime.now().millisecondsSinceEpoch}',
        quality: quality,
        isReturnImagePathOfIOS: isReturnImagePath,
      );

      if (result != null && result['isSuccess'] == true) {
        return GallerySaveResult.success(result['filePath'] as String?);
      }

      return GallerySaveResult.failure(
        result?['errorMessage']?.toString() ?? '保存失败',
      );
    } catch (e) {
      return GallerySaveResult.failure(e.toString());
    }
  }

  /// 保存图片文件到相册
  ///
  /// [file] 图片文件
  /// [name] 文件名（不含扩展名），为空则使用原文件名
  static Future<GallerySaveResult> saveImageFile(
    File file, {
    String? name,
  }) async {
    try {
      if (!await file.exists()) {
        return GallerySaveResult.failure('文件不存在');
      }

      final result = await ImageGallerySaverPlus.saveFile(
        file.path,
        name: name,
        isReturnPathOfIOS: true,
      );

      if (result != null && result['isSuccess'] == true) {
        return GallerySaveResult.success(result['filePath'] as String?);
      }

      return GallerySaveResult.failure(
        result?['errorMessage']?.toString() ?? '保存失败',
      );
    } catch (e) {
      return GallerySaveResult.failure(e.toString());
    }
  }

  // ==================== 保存视频 ====================

  /// 保存视频文件到相册
  ///
  /// [file] 视频文件
  /// [name] 文件名（不含扩展名），为空则使用原文件名
  static Future<GallerySaveResult> saveVideoFile(
    File file, {
    String? name,
  }) async {
    try {
      if (!await file.exists()) {
        return GallerySaveResult.failure('文件不存在');
      }

      final result = await ImageGallerySaverPlus.saveFile(
        file.path,
        name: name,
        isReturnPathOfIOS: true,
      );

      if (result != null && result['isSuccess'] == true) {
        return GallerySaveResult.success(result['filePath'] as String?);
      }

      return GallerySaveResult.failure(
        result?['errorMessage']?.toString() ?? '保存失败',
      );
    } catch (e) {
      return GallerySaveResult.failure(e.toString());
    }
  }

  /// 保存视频数据到相册
  ///
  /// 先保存到临时文件，再保存到相册
  static Future<GallerySaveResult> saveVideo(
    Uint8List videoBytes, {
    String? name,
  }) async {
    try {
      // 创建临时文件
      final tempDir = Directory.systemTemp;
      final tempFileName = name ?? 'video_${DateTime.now().millisecondsSinceEpoch}';
      final tempFile = File('${tempDir.path}/$tempFileName.mp4');

      await tempFile.writeAsBytes(videoBytes);

      // 保存到相册
      final result = await saveVideoFile(tempFile, name: name);

      // 删除临时文件
      if (await tempFile.exists()) {
        await tempFile.delete();
      }

      return result;
    } catch (e) {
      return GallerySaveResult.failure(e.toString());
    }
  }

  // ==================== 保存网络资源 ====================

  /// 保存网络图片到相册
  ///
  /// [url] 图片URL
  /// [name] 文件名（不含扩展名）
  /// [headers] 请求头
  static Future<GallerySaveResult> saveNetworkImage(
    String url, {
    String? name,
    Map<String, String>? headers,
  }) async {
    try {
      // 下载图片
      final httpClient = HttpClient();
      final request = await httpClient.getUrl(Uri.parse(url));

      headers?.forEach((key, value) {
        request.headers.add(key, value);
      });

      final response = await request.close();

      if (response.statusCode != 200) {
        return GallerySaveResult.failure('下载失败: ${response.statusCode}');
      }

      final bytes = await _readResponseBytes(response);
      httpClient.close();

      // 保存到相册
      return saveImage(bytes, name: name);
    } catch (e) {
      return GallerySaveResult.failure(e.toString());
    }
  }

  /// 保存网络视频到相册
  ///
  /// [url] 视频URL
  /// [name] 文件名（不含扩展名）
  /// [headers] 请求头
  /// [onProgress] 下载进度回调
  static Future<GallerySaveResult> saveNetworkVideo(
    String url, {
    String? name,
    Map<String, String>? headers,
    void Function(int received, int total)? onProgress,
  }) async {
    try {
      // 下载视频
      final httpClient = HttpClient();
      final request = await httpClient.getUrl(Uri.parse(url));

      headers?.forEach((key, value) {
        request.headers.add(key, value);
      });

      final response = await request.close();

      if (response.statusCode != 200) {
        return GallerySaveResult.failure('下载失败: ${response.statusCode}');
      }

      final totalBytes = response.contentLength;
      final chunks = <int>[];
      int receivedBytes = 0;

      await for (final chunk in response) {
        chunks.addAll(chunk);
        receivedBytes += chunk.length;
        onProgress?.call(receivedBytes, totalBytes);
      }

      httpClient.close();

      // 保存到相册
      return saveVideo(Uint8List.fromList(chunks), name: name);
    } catch (e) {
      return GallerySaveResult.failure(e.toString());
    }
  }

  // ==================== 私有方法 ====================

  static Future<Uint8List> _readResponseBytes(HttpClientResponse response) async {
    final chunks = <int>[];
    await for (final chunk in response) {
      chunks.addAll(chunk);
    }
    return Uint8List.fromList(chunks);
  }
}
