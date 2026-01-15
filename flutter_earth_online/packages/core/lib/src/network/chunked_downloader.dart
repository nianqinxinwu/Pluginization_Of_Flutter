import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'network_logger.dart';

/// 下载块信息
class DownloadChunk {
  const DownloadChunk({
    required this.index,
    required this.start,
    required this.end,
    required this.data,
  });

  /// 块索引
  final int index;

  /// 起始字节
  final int start;

  /// 结束字节
  final int end;

  /// 块数据
  final Uint8List data;

  /// 块大小
  int get size => data.length;
}

/// 下载进度信息
class DownloadProgress {
  const DownloadProgress({
    required this.totalBytes,
    required this.downloadedBytes,
    required this.completedChunks,
    required this.totalChunks,
    this.speed = 0,
  });

  /// 总字节数
  final int totalBytes;

  /// 已下载字节数
  final int downloadedBytes;

  /// 已完成块数
  final int completedChunks;

  /// 总块数
  final int totalChunks;

  /// 下载速度（字节/秒）
  final double speed;

  /// 下载进度（0.0 - 1.0）
  double get progress => totalBytes > 0 ? downloadedBytes / totalBytes : 0;

  /// 进度百分比
  int get progressPercent => (progress * 100).toInt();

  /// 格式化的速度
  String get speedFormatted {
    if (speed < 1024) {
      return '${speed.toStringAsFixed(0)} B/s';
    } else if (speed < 1024 * 1024) {
      return '${(speed / 1024).toStringAsFixed(1)} KB/s';
    } else {
      return '${(speed / 1024 / 1024).toStringAsFixed(1)} MB/s';
    }
  }

  /// 是否完成
  bool get isCompleted => completedChunks == totalChunks;
}

/// 下载结果
class DownloadResult {
  const DownloadResult({
    required this.success,
    this.chunks,
    this.mergedData,
    this.filePath,
    this.error,
  });

  /// 是否成功
  final bool success;

  /// 下载的分块数据
  final List<DownloadChunk>? chunks;

  /// 合并后的完整数据
  final Uint8List? mergedData;

  /// 保存的文件路径
  final String? filePath;

  /// 错误信息
  final String? error;

  /// 创建成功结果（分块）
  factory DownloadResult.chunks(List<DownloadChunk> chunks) {
    return DownloadResult(success: true, chunks: chunks);
  }

  /// 创建成功结果（合并数据）
  factory DownloadResult.merged(Uint8List data) {
    return DownloadResult(success: true, mergedData: data);
  }

  /// 创建成功结果（文件）
  factory DownloadResult.file(String path) {
    return DownloadResult(success: true, filePath: path);
  }

  /// 创建失败结果
  factory DownloadResult.failure(String error) {
    return DownloadResult(success: false, error: error);
  }
}

/// 分段下载配置
class ChunkedDownloadConfig {
  const ChunkedDownloadConfig({
    this.chunkSize = 1024 * 1024 * 2, // 2MB per chunk
    this.maxConcurrent = 3,
    this.timeout = const Duration(minutes: 5),
    this.retryCount = 3,
    this.retryDelay = const Duration(seconds: 2),
  });

  /// 每块大小（字节）
  final int chunkSize;

  /// 最大并发数
  final int maxConcurrent;

  /// 超时时间
  final Duration timeout;

  /// 重试次数
  final int retryCount;

  /// 重试延迟
  final Duration retryDelay;

  /// 默认配置
  static const ChunkedDownloadConfig defaultConfig = ChunkedDownloadConfig();

  /// 小文件配置（单块下载）
  static const ChunkedDownloadConfig small = ChunkedDownloadConfig(
    chunkSize: 1024 * 1024 * 10, // 10MB
    maxConcurrent: 1,
  );

  /// 大文件配置
  static const ChunkedDownloadConfig large = ChunkedDownloadConfig(
    chunkSize: 1024 * 1024 * 5, // 5MB per chunk
    maxConcurrent: 5,
  );
}

/// 分段下载器
///
/// 支持：
/// - 多线程分段下载
/// - 断点续传
/// - 进度回调
/// - 分块数据输出或合并输出
///
/// 使用示例：
/// ```dart
/// final downloader = ChunkedDownloader();
///
/// // 下载并获取分块数据
/// final result = await downloader.downloadChunks(
///   url: 'https://example.com/large-file.zip',
///   onProgress: (progress) => print('${progress.progressPercent}%'),
/// );
///
/// // 下载并合并数据
/// final result = await downloader.downloadAndMerge(
///   url: 'https://example.com/image.jpg',
/// );
///
/// // 下载并保存到文件
/// final result = await downloader.downloadToFile(
///   url: 'https://example.com/video.mp4',
///   savePath: '/path/to/save/video.mp4',
/// );
/// ```
class ChunkedDownloader {
  ChunkedDownloader({
    Dio? dio,
    this.config = ChunkedDownloadConfig.defaultConfig,
  }) : _dio = dio ?? Dio();

  final Dio _dio;
  final ChunkedDownloadConfig config;

  // 下载状态
  bool _isCancelled = false;
  final Map<int, DownloadChunk> _completedChunks = {};
  int _downloadedBytes = 0;
  DateTime? _startTime;

  /// 取消下载
  void cancel() {
    _isCancelled = true;
  }

  /// 重置状态
  void _reset() {
    _isCancelled = false;
    _completedChunks.clear();
    _downloadedBytes = 0;
    _startTime = null;
  }

  // ==================== 下载方法 ====================

  /// 分段下载，返回分块数据
  ///
  /// [url] 下载地址
  /// [headers] 自定义请求头
  /// [onProgress] 进度回调
  /// [onChunkComplete] 单块完成回调
  Future<DownloadResult> downloadChunks({
    required String url,
    Map<String, dynamic>? headers,
    void Function(DownloadProgress)? onProgress,
    void Function(DownloadChunk)? onChunkComplete,
  }) async {
    _reset();
    _startTime = DateTime.now();

    try {
      // 1. 获取文件信息
      final fileInfo = await _getFileInfo(url, headers);
      if (fileInfo == null) {
        return DownloadResult.failure('无法获取文件信息');
      }

      final totalSize = fileInfo.contentLength;
      final supportsRange = fileInfo.supportsRange;

      NetworkLogger.instance.log(
        '开始分段下载: $url\n'
        '文件大小: ${_formatBytes(totalSize)}\n'
        '支持断点: $supportsRange',
      );

      // 2. 计算分块
      final chunks = _calculateChunks(totalSize, supportsRange);
      final totalChunks = chunks.length;

      // 3. 并发下载
      final completer = Completer<DownloadResult>();
      int completedCount = 0;

      // 使用信号量控制并发
      final semaphore = _Semaphore(config.maxConcurrent);

      for (final chunkInfo in chunks) {
        if (_isCancelled) break;

        semaphore.acquire().then((_) async {
          if (_isCancelled) {
            semaphore.release();
            return;
          }

          try {
            final chunk = await _downloadChunk(
              url: url,
              index: chunkInfo.index,
              start: chunkInfo.start,
              end: chunkInfo.end,
              headers: headers,
            );

            if (chunk != null) {
              _completedChunks[chunk.index] = chunk;
              _downloadedBytes += chunk.size;
              completedCount++;

              onChunkComplete?.call(chunk);

              // 计算速度
              final elapsed = DateTime.now().difference(_startTime!);
              final speed = elapsed.inMilliseconds > 0
                  ? _downloadedBytes / elapsed.inMilliseconds * 1000
                  : 0.0;

              onProgress?.call(DownloadProgress(
                totalBytes: totalSize,
                downloadedBytes: _downloadedBytes,
                completedChunks: completedCount,
                totalChunks: totalChunks,
                speed: speed,
              ));

              if (completedCount == totalChunks && !completer.isCompleted) {
                // 按顺序排列块
                final sortedChunks = _completedChunks.values.toList()
                  ..sort((a, b) => a.index.compareTo(b.index));
                completer.complete(DownloadResult.chunks(sortedChunks));
              }
            }
          } catch (e) {
            if (!completer.isCompleted) {
              completer.complete(DownloadResult.failure(e.toString()));
            }
          } finally {
            semaphore.release();
          }
        });
      }

      // 等待所有下载完成或失败
      return await completer.future.timeout(
        config.timeout,
        onTimeout: () => DownloadResult.failure('下载超时'),
      );
    } catch (e) {
      return DownloadResult.failure(e.toString());
    }
  }

  /// 分段下载并合并数据
  Future<DownloadResult> downloadAndMerge({
    required String url,
    Map<String, dynamic>? headers,
    void Function(DownloadProgress)? onProgress,
  }) async {
    final chunksResult = await downloadChunks(
      url: url,
      headers: headers,
      onProgress: onProgress,
    );

    if (!chunksResult.success || chunksResult.chunks == null) {
      return chunksResult;
    }

    // 合并数据
    final mergedData = mergeChunks(chunksResult.chunks!);
    return DownloadResult.merged(mergedData);
  }

  /// 分段下载并保存到文件
  Future<DownloadResult> downloadToFile({
    required String url,
    required String savePath,
    Map<String, dynamic>? headers,
    void Function(DownloadProgress)? onProgress,
  }) async {
    final mergedResult = await downloadAndMerge(
      url: url,
      headers: headers,
      onProgress: onProgress,
    );

    if (!mergedResult.success || mergedResult.mergedData == null) {
      return mergedResult;
    }

    try {
      // 确保目录存在
      final file = File(savePath);
      await file.parent.create(recursive: true);

      // 写入文件
      await file.writeAsBytes(mergedResult.mergedData!);

      return DownloadResult.file(savePath);
    } catch (e) {
      return DownloadResult.failure('保存文件失败: $e');
    }
  }

  // ==================== 工具方法 ====================

  /// 合并分块数据
  static Uint8List mergeChunks(List<DownloadChunk> chunks) {
    // 按索引排序
    final sortedChunks = chunks.toList()
      ..sort((a, b) => a.index.compareTo(b.index));

    // 计算总大小
    final totalSize = sortedChunks.fold<int>(
      0,
      (sum, chunk) => sum + chunk.size,
    );

    // 合并数据
    final merged = Uint8List(totalSize);
    int offset = 0;

    for (final chunk in sortedChunks) {
      merged.setRange(offset, offset + chunk.size, chunk.data);
      offset += chunk.size;
    }

    return merged;
  }

  /// 将分块数据写入文件
  static Future<File> saveChunksToFile(
    List<DownloadChunk> chunks,
    String filePath,
  ) async {
    final merged = mergeChunks(chunks);
    final file = File(filePath);
    await file.parent.create(recursive: true);
    await file.writeAsBytes(merged);
    return file;
  }

  // ==================== 私有方法 ====================

  /// 获取文件信息
  Future<_FileInfo?> _getFileInfo(
    String url,
    Map<String, dynamic>? headers,
  ) async {
    try {
      final response = await _dio.head(
        url,
        options: Options(headers: headers),
      );

      final contentLength = int.tryParse(
            response.headers.value(HttpHeaders.contentLengthHeader) ?? '',
          ) ??
          0;

      final acceptRanges = response.headers.value(HttpHeaders.acceptRangesHeader);
      final supportsRange = acceptRanges == 'bytes';

      return _FileInfo(
        contentLength: contentLength,
        supportsRange: supportsRange,
      );
    } catch (e) {
      // 尝试 GET 请求获取信息
      try {
        final response = await _dio.get(
          url,
          options: Options(
            headers: {...?headers, 'Range': 'bytes=0-0'},
            responseType: ResponseType.bytes,
          ),
        );

        final contentRange = response.headers.value('content-range');
        if (contentRange != null) {
          // 格式: bytes 0-0/total
          final match = RegExp(r'bytes \d+-\d+/(\d+)').firstMatch(contentRange);
          if (match != null) {
            return _FileInfo(
              contentLength: int.parse(match.group(1)!),
              supportsRange: true,
            );
          }
        }
      } catch (_) {}

      return null;
    }
  }

  /// 计算分块
  List<_ChunkInfo> _calculateChunks(int totalSize, bool supportsRange) {
    if (!supportsRange || totalSize <= config.chunkSize) {
      // 不支持分段或文件较小，单块下载
      return [_ChunkInfo(index: 0, start: 0, end: totalSize - 1)];
    }

    final chunks = <_ChunkInfo>[];
    int start = 0;
    int index = 0;

    while (start < totalSize) {
      final end = (start + config.chunkSize - 1).clamp(0, totalSize - 1);
      chunks.add(_ChunkInfo(index: index, start: start, end: end));
      start = end + 1;
      index++;
    }

    return chunks;
  }

  /// 下载单个块
  Future<DownloadChunk?> _downloadChunk({
    required String url,
    required int index,
    required int start,
    required int end,
    Map<String, dynamic>? headers,
    int retryCount = 0,
  }) async {
    try {
      final response = await _dio.get<List<int>>(
        url,
        options: Options(
          headers: {
            ...?headers,
            'Range': 'bytes=$start-$end',
          },
          responseType: ResponseType.bytes,
          receiveTimeout: config.timeout,
        ),
      );

      if (response.data != null) {
        return DownloadChunk(
          index: index,
          start: start,
          end: end,
          data: Uint8List.fromList(response.data!),
        );
      }
    } catch (e) {
      if (retryCount < config.retryCount) {
        await Future.delayed(config.retryDelay);
        return _downloadChunk(
          url: url,
          index: index,
          start: start,
          end: end,
          headers: headers,
          retryCount: retryCount + 1,
        );
      }
      rethrow;
    }
    return null;
  }

  /// 格式化字节大小
  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / 1024 / 1024).toStringAsFixed(1)} MB';
    }
    return '${(bytes / 1024 / 1024 / 1024).toStringAsFixed(1)} GB';
  }
}

/// 文件信息
class _FileInfo {
  const _FileInfo({
    required this.contentLength,
    required this.supportsRange,
  });

  final int contentLength;
  final bool supportsRange;
}

/// 块信息
class _ChunkInfo {
  const _ChunkInfo({
    required this.index,
    required this.start,
    required this.end,
  });

  final int index;
  final int start;
  final int end;
}

/// 简单信号量实现
class _Semaphore {
  _Semaphore(this._maxCount);

  final int _maxCount;
  int _currentCount = 0;
  final _waitQueue = <Completer<void>>[];

  Future<void> acquire() async {
    if (_currentCount < _maxCount) {
      _currentCount++;
      return;
    }

    final completer = Completer<void>();
    _waitQueue.add(completer);
    await completer.future;
  }

  void release() {
    if (_waitQueue.isNotEmpty) {
      final completer = _waitQueue.removeAt(0);
      completer.complete();
    } else {
      _currentCount--;
    }
  }
}
