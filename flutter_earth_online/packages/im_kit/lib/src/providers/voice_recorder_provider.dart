import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_recorder_provider.g.dart';

/// 录音状态
class VoiceRecorderState {
  final bool isRecording;
  final int duration; // 秒
  final double decibel; // 分贝
  final String? filePath;
  final String? error;

  const VoiceRecorderState({
    this.isRecording = false,
    this.duration = 0,
    this.decibel = 0,
    this.filePath,
    this.error,
  });

  VoiceRecorderState copyWith({
    bool? isRecording,
    int? duration,
    double? decibel,
    String? filePath,
    String? error,
  }) {
    return VoiceRecorderState(
      isRecording: isRecording ?? this.isRecording,
      duration: duration ?? this.duration,
      decibel: decibel ?? this.decibel,
      filePath: filePath ?? this.filePath,
      error: error,
    );
  }

  /// 格式化录音时长
  String get formattedDuration {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

/// 语音录制管理
@riverpod
class VoiceRecorderNotifier extends _$VoiceRecorderNotifier {
  Timer? _timer;

  @override
  VoiceRecorderState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return const VoiceRecorderState();
  }

  /// 开始录音
  Future<void> startRecording() async {
    try {
      // TODO: 实际录音逻辑
      // final hasPermission = await _audioService.requestPermission();
      // if (!hasPermission) {
      //   state = state.copyWith(error: '没有录音权限');
      //   return;
      // }
      // await _audioService.startRecording();

      state = state.copyWith(
        isRecording: true,
        duration: 0,
        error: null,
      );

      // 开始计时
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (state.isRecording) {
          state = state.copyWith(duration: state.duration + 1);
        }
      });
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// 停止录音
  Future<String?> stopRecording() async {
    _timer?.cancel();
    _timer = null;

    if (!state.isRecording) return null;

    try {
      // TODO: 实际停止录音逻辑
      // final path = await _audioService.stopRecording();

      const path = 'temp_voice.aac'; // 临时路径

      state = state.copyWith(
        isRecording: false,
        filePath: path,
        decibel: 0,
      );
      return path;
    } catch (e) {
      state = state.copyWith(
        isRecording: false,
        error: e.toString(),
        decibel: 0,
      );
      return null;
    }
  }

  /// 取消录音
  Future<void> cancelRecording() async {
    _timer?.cancel();
    _timer = null;

    if (!state.isRecording) return;

    try {
      // TODO: 实际取消录音逻辑
      // await _audioService.cancelRecording();
    } finally {
      state = const VoiceRecorderState();
    }
  }

  /// 更新分贝
  void updateDecibel(double decibel) {
    if (state.isRecording) {
      state = state.copyWith(decibel: decibel);
    }
  }

  /// 重置状态
  void reset() {
    _timer?.cancel();
    _timer = null;
    state = const VoiceRecorderState();
  }
}
