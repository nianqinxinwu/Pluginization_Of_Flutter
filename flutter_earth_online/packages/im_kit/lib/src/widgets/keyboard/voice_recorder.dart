import 'dart:async';
import 'package:flutter/material.dart';

/// 语音录制按钮
class VoiceRecorderButton extends StatefulWidget {
  /// 录制完成回调
  final void Function(String path, int duration) onRecorded;

  /// 最大录音时长 (秒)
  final int maxDuration;

  /// 正常状态文字
  final String normalText;

  /// 录音中文字
  final String recordingText;

  /// 取消录音文字
  final String cancelText;

  const VoiceRecorderButton({
    super.key,
    required this.onRecorded,
    this.maxDuration = 60,
    this.normalText = '按住 说话',
    this.recordingText = '松开 发送',
    this.cancelText = '松开 取消',
  });

  @override
  State<VoiceRecorderButton> createState() => _VoiceRecorderButtonState();
}

class _VoiceRecorderButtonState extends State<VoiceRecorderButton> {
  bool _isRecording = false;
  bool _isCancelling = false;
  int _duration = 0;
  Timer? _timer;
  Offset _startPosition = Offset.zero;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startRecording(Offset position) {
    setState(() {
      _isRecording = true;
      _isCancelling = false;
      _duration = 0;
      _startPosition = position;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _duration++;
      });

      if (_duration >= widget.maxDuration) {
        _stopRecording();
      }
    });

    // TODO: 实际录音逻辑
  }

  void _updatePosition(Offset position) {
    final dy = position.dy - _startPosition.dy;
    setState(() {
      _isCancelling = dy < -50;
    });
  }

  void _stopRecording() {
    _timer?.cancel();
    _timer = null;

    if (_isRecording) {
      if (!_isCancelling && _duration > 0) {
        // TODO: 获取实际录音文件路径
        widget.onRecorded('temp_voice_path.aac', _duration);
      }

      setState(() {
        _isRecording = false;
        _isCancelling = false;
        _duration = 0;
      });
    }
  }

  void _cancelRecording() {
    _timer?.cancel();
    _timer = null;

    setState(() {
      _isRecording = false;
      _isCancelling = false;
      _duration = 0;
    });

    // TODO: 取消录音逻辑
  }

  String get _buttonText {
    if (_isRecording) {
      return _isCancelling ? widget.cancelText : widget.recordingText;
    }
    return widget.normalText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 录音状态提示
        if (_isRecording)
          _VoiceRecordingIndicator(
            duration: _duration,
            isCancelling: _isCancelling,
          ),

        // 按住说话按钮
        GestureDetector(
          onLongPressStart: (details) =>
              _startRecording(details.globalPosition),
          onLongPressMoveUpdate: (details) =>
              _updatePosition(details.globalPosition),
          onLongPressEnd: (_) => _stopRecording(),
          onLongPressCancel: _cancelRecording,
          child: Container(
            height: 36,
            decoration: BoxDecoration(
              color: _isRecording
                  ? (_isCancelling
                      ? const Color(0xFFFF4D4F)
                      : const Color(0xFFC9C9C9))
                  : Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Text(
              _buttonText,
              style: TextStyle(
                fontSize: 14,
                color: _isRecording && _isCancelling
                    ? Colors.white
                    : const Color(0xFF333333),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// 录音状态指示器
class _VoiceRecordingIndicator extends StatelessWidget {
  final int duration;
  final bool isCancelling;

  const _VoiceRecordingIndicator({
    required this.duration,
    required this.isCancelling,
  });

  String get _formattedDuration {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isCancelling
            ? Colors.red.withValues(alpha: 0.1)
            : Colors.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isCancelling ? Icons.close : Icons.mic,
            size: 20,
            color: isCancelling ? Colors.red : Colors.green,
          ),
          const SizedBox(width: 8),
          Text(
            isCancelling ? '松开取消' : _formattedDuration,
            style: TextStyle(
              fontSize: 14,
              color: isCancelling ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

/// 语音播放器组件
class VoicePlayer extends StatefulWidget {
  /// 语音文件路径或URL
  final String source;

  /// 语音时长 (秒)
  final int duration;

  /// 是否显示时长
  final bool showDuration;

  /// 播放状态变化回调
  final ValueChanged<bool>? onPlayStateChanged;

  /// 播放完成回调
  final VoidCallback? onPlayComplete;

  const VoicePlayer({
    super.key,
    required this.source,
    required this.duration,
    this.showDuration = true,
    this.onPlayStateChanged,
    this.onPlayComplete,
  });

  @override
  State<VoicePlayer> createState() => _VoicePlayerState();
}

class _VoicePlayerState extends State<VoicePlayer>
    with SingleTickerProviderStateMixin {
  bool _isPlaying = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _togglePlay() {
    setState(() {
      _isPlaying = !_isPlaying;
    });

    if (_isPlaying) {
      _animationController.repeat();
      // TODO: 实际播放逻辑
    } else {
      _animationController.stop();
      // TODO: 停止播放逻辑
    }

    widget.onPlayStateChanged?.call(_isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlay,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Icon(
                _isPlaying ? Icons.volume_up : Icons.volume_down,
                size: 20,
                color: const Color(0xFF333333),
              );
            },
          ),
          if (widget.showDuration) ...[
            const SizedBox(width: 8),
            Text(
              '${widget.duration}″',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF333333),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
