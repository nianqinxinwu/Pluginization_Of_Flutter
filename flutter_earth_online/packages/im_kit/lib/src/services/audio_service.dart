/// 音频服务接口
/// 实际项目中需要实现此接口来处理录音和播放
abstract class AudioService {
  /// 请求录音权限
  Future<bool> requestPermission();

  /// 开始录音
  Future<void> startRecording();

  /// 停止录音
  Future<String?> stopRecording();

  /// 取消录音
  Future<void> cancelRecording();

  /// 获取当前分贝
  Future<double> getDecibel();

  /// 播放音频
  Future<void> play(String path);

  /// 暂停播放
  Future<void> pause();

  /// 停止播放
  Future<void> stop();

  /// 是否正在播放
  bool get isPlaying;

  /// 当前播放位置 (毫秒)
  int get currentPosition;

  /// 音频总时长 (毫秒)
  int get duration;

  /// 释放资源
  void dispose();
}

/// 默认音频服务实现 (占位)
/// 实际项目中应替换为真实实现
class DefaultAudioService implements AudioService {
  bool _isPlaying = false;
  int _currentPosition = 0;
  int _duration = 0;

  @override
  Future<bool> requestPermission() async {
    // TODO: 实现权限请求
    return true;
  }

  @override
  Future<void> startRecording() async {
    // TODO: 实现录音开始
  }

  @override
  Future<String?> stopRecording() async {
    // TODO: 实现录音停止
    return null;
  }

  @override
  Future<void> cancelRecording() async {
    // TODO: 实现录音取消
  }

  @override
  Future<double> getDecibel() async {
    // TODO: 实现分贝获取
    return 0;
  }

  @override
  Future<void> play(String path) async {
    // TODO: 实现播放
    _isPlaying = true;
  }

  @override
  Future<void> pause() async {
    // TODO: 实现暂停
    _isPlaying = false;
  }

  @override
  Future<void> stop() async {
    // TODO: 实现停止
    _isPlaying = false;
    _currentPosition = 0;
  }

  @override
  bool get isPlaying => _isPlaying;

  @override
  int get currentPosition => _currentPosition;

  @override
  int get duration => _duration;

  @override
  void dispose() {
    // TODO: 释放资源
  }
}
