import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

/// 临时文件类型
enum TempFileType {
  /// 下载文件
  download,

  /// 缓存文件
  cache,

  /// 图片
  image,

  /// 视频
  video,

  /// 音频
  audio,

  /// 文档
  document,

  /// 其他
  other,
}

/// 临时文件信息
class TempFileInfo {
  const TempFileInfo({
    required this.path,
    required this.name,
    required this.type,
    required this.size,
    required this.createdAt,
  });

  /// 文件路径
  final String path;

  /// 文件名
  final String name;

  /// 文件类型
  final TempFileType type;

  /// 文件大小（字节）
  final int size;

  /// 创建时间
  final DateTime createdAt;

  /// 格式化的文件大小
  String get sizeFormatted {
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    if (size < 1024 * 1024 * 1024) {
      return '${(size / 1024 / 1024).toStringAsFixed(1)} MB';
    }
    return '${(size / 1024 / 1024 / 1024).toStringAsFixed(1)} GB';
  }

  /// 文件是否存在
  Future<bool> exists() async => File(path).exists();

  /// 删除文件
  Future<void> delete() async {
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// 获取文件
  File get file => File(path);
}

/// 临时文件管理器
///
/// 提供临时文件的创建、存储、查询和清理功能
///
/// 使用示例：
/// ```dart
/// // 初始化
/// await TempFileManager.instance.init();
///
/// // 保存数据到临时文件
/// final fileInfo = await TempFileManager.instance.saveBytes(
///   data,
///   fileName: 'image.jpg',
///   type: TempFileType.image,
/// );
///
/// // 获取临时文件
/// final file = await TempFileManager.instance.getFile('image.jpg');
///
/// // 清理过期文件
/// await TempFileManager.instance.cleanExpired(Duration(days: 7));
///
/// // 清理所有临时文件
/// await TempFileManager.instance.cleanAll();
/// ```
class TempFileManager {
  TempFileManager._();

  static TempFileManager? _instance;
  Directory? _tempDir;
  Directory? _cacheDir;

  static TempFileManager get instance {
    _instance ??= TempFileManager._();
    return _instance!;
  }

  /// 临时目录
  Directory? get tempDir => _tempDir;

  /// 缓存目录
  Directory? get cacheDir => _cacheDir;

  /// 是否已初始化
  bool get isInitialized => _tempDir != null;

  // ==================== 初始化 ====================

  /// 初始化临时文件管理器
  Future<void> init() async {
    _tempDir = await getTemporaryDirectory();
    _cacheDir = await getApplicationCacheDirectory();

    // 确保子目录存在
    for (final type in TempFileType.values) {
      final subDir = Directory('${_tempDir!.path}/${type.name}');
      if (!await subDir.exists()) {
        await subDir.create(recursive: true);
      }
    }
  }

  // ==================== 文件操作 ====================

  /// 保存字节数据到临时文件
  ///
  /// [data] 文件数据
  /// [fileName] 文件名（可选，自动生成）
  /// [type] 文件类型
  /// [subDir] 子目录（可选）
  Future<TempFileInfo> saveBytes(
    Uint8List data, {
    String? fileName,
    TempFileType type = TempFileType.other,
    String? subDir,
  }) async {
    _ensureInitialized();

    final name = fileName ?? _generateFileName(type);
    final path = _buildPath(name, type, subDir);

    final file = File(path);
    await file.parent.create(recursive: true);
    await file.writeAsBytes(data);

    return TempFileInfo(
      path: path,
      name: name,
      type: type,
      size: data.length,
      createdAt: DateTime.now(),
    );
  }

  /// 保存文件到临时目录
  ///
  /// [sourceFile] 源文件
  /// [fileName] 新文件名（可选）
  /// [type] 文件类型
  Future<TempFileInfo> saveFile(
    File sourceFile, {
    String? fileName,
    TempFileType type = TempFileType.other,
    String? subDir,
  }) async {
    _ensureInitialized();

    final name = fileName ?? sourceFile.path.split('/').last;
    final path = _buildPath(name, type, subDir);

    final destFile = File(path);
    await destFile.parent.create(recursive: true);
    await sourceFile.copy(path);

    final stat = await destFile.stat();

    return TempFileInfo(
      path: path,
      name: name,
      type: type,
      size: stat.size,
      createdAt: DateTime.now(),
    );
  }

  /// 保存流数据到临时文件
  Future<TempFileInfo> saveStream(
    Stream<List<int>> stream, {
    String? fileName,
    TempFileType type = TempFileType.other,
    String? subDir,
    void Function(int bytes)? onProgress,
  }) async {
    _ensureInitialized();

    final name = fileName ?? _generateFileName(type);
    final path = _buildPath(name, type, subDir);

    final file = File(path);
    await file.parent.create(recursive: true);

    final sink = file.openWrite();
    int totalBytes = 0;

    await for (final chunk in stream) {
      sink.add(chunk);
      totalBytes += chunk.length;
      onProgress?.call(totalBytes);
    }

    await sink.close();

    return TempFileInfo(
      path: path,
      name: name,
      type: type,
      size: totalBytes,
      createdAt: DateTime.now(),
    );
  }

  /// 获取临时文件
  Future<File?> getFile(
    String fileName, {
    TempFileType type = TempFileType.other,
    String? subDir,
  }) async {
    _ensureInitialized();

    final path = _buildPath(fileName, type, subDir);
    final file = File(path);

    if (await file.exists()) {
      return file;
    }
    return null;
  }

  /// 检查文件是否存在
  Future<bool> exists(
    String fileName, {
    TempFileType type = TempFileType.other,
    String? subDir,
  }) async {
    _ensureInitialized();

    final path = _buildPath(fileName, type, subDir);
    return File(path).exists();
  }

  /// 删除临时文件
  Future<bool> deleteFile(
    String fileName, {
    TempFileType type = TempFileType.other,
    String? subDir,
  }) async {
    _ensureInitialized();

    final path = _buildPath(fileName, type, subDir);
    final file = File(path);

    if (await file.exists()) {
      await file.delete();
      return true;
    }
    return false;
  }

  /// 获取临时文件路径
  String getTempPath(
    String fileName, {
    TempFileType type = TempFileType.other,
    String? subDir,
  }) {
    _ensureInitialized();
    return _buildPath(fileName, type, subDir);
  }

  // ==================== 查询操作 ====================

  /// 获取指定类型的所有临时文件
  Future<List<TempFileInfo>> listFiles({
    TempFileType? type,
  }) async {
    _ensureInitialized();

    final files = <TempFileInfo>[];
    final types = type != null ? [type] : TempFileType.values;

    for (final t in types) {
      final dir = Directory('${_tempDir!.path}/${t.name}');
      if (await dir.exists()) {
        await for (final entity in dir.list()) {
          if (entity is File) {
            final stat = await entity.stat();
            files.add(TempFileInfo(
              path: entity.path,
              name: entity.path.split('/').last,
              type: t,
              size: stat.size,
              createdAt: stat.modified,
            ));
          }
        }
      }
    }

    return files;
  }

  /// 获取临时文件总大小
  Future<int> getTotalSize({TempFileType? type}) async {
    final files = await listFiles(type: type);
    return files.fold<int>(0, (sum, file) => sum + file.size);
  }

  /// 获取格式化的总大小
  Future<String> getTotalSizeFormatted({TempFileType? type}) async {
    final size = await getTotalSize(type: type);
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    if (size < 1024 * 1024 * 1024) {
      return '${(size / 1024 / 1024).toStringAsFixed(1)} MB';
    }
    return '${(size / 1024 / 1024 / 1024).toStringAsFixed(1)} GB';
  }

  // ==================== 清理操作 ====================

  /// 清理过期的临时文件
  ///
  /// [maxAge] 最大保留时间
  /// [type] 指定类型，为空则清理所有类型
  Future<int> cleanExpired(
    Duration maxAge, {
    TempFileType? type,
  }) async {
    _ensureInitialized();

    final now = DateTime.now();
    final files = await listFiles(type: type);
    int deletedCount = 0;

    for (final fileInfo in files) {
      if (now.difference(fileInfo.createdAt) > maxAge) {
        await fileInfo.delete();
        deletedCount++;
      }
    }

    return deletedCount;
  }

  /// 清理指定类型的所有临时文件
  Future<int> cleanByType(TempFileType type) async {
    _ensureInitialized();

    final dir = Directory('${_tempDir!.path}/${type.name}');
    if (!await dir.exists()) return 0;

    int deletedCount = 0;
    await for (final entity in dir.list()) {
      if (entity is File) {
        await entity.delete();
        deletedCount++;
      }
    }

    return deletedCount;
  }

  /// 清理所有临时文件
  Future<int> cleanAll() async {
    _ensureInitialized();

    int deletedCount = 0;
    for (final type in TempFileType.values) {
      deletedCount += await cleanByType(type);
    }

    return deletedCount;
  }

  /// 清理超过指定大小的文件
  ///
  /// [maxTotalSize] 最大总大小（字节）
  /// [type] 指定类型
  Future<int> cleanBySize(
    int maxTotalSize, {
    TempFileType? type,
  }) async {
    final files = await listFiles(type: type);

    // 按创建时间排序（旧文件在前）
    files.sort((a, b) => a.createdAt.compareTo(b.createdAt));

    int currentSize = files.fold<int>(0, (sum, f) => sum + f.size);
    int deletedCount = 0;

    for (final file in files) {
      if (currentSize <= maxTotalSize) break;

      await file.delete();
      currentSize -= file.size;
      deletedCount++;
    }

    return deletedCount;
  }

  // ==================== 私有方法 ====================

  void _ensureInitialized() {
    if (!isInitialized) {
      throw StateError('TempFileManager 未初始化，请先调用 init()');
    }
  }

  String _buildPath(String fileName, TempFileType type, String? subDir) {
    final basePath = '${_tempDir!.path}/${type.name}';
    if (subDir != null && subDir.isNotEmpty) {
      return '$basePath/$subDir/$fileName';
    }
    return '$basePath/$fileName';
  }

  String _generateFileName(TempFileType type) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final ext = _getDefaultExtension(type);
    return '${type.name}_$timestamp$ext';
  }

  String _getDefaultExtension(TempFileType type) {
    switch (type) {
      case TempFileType.image:
        return '.jpg';
      case TempFileType.video:
        return '.mp4';
      case TempFileType.audio:
        return '.mp3';
      case TempFileType.document:
        return '.pdf';
      default:
        return '.tmp';
    }
  }
}
