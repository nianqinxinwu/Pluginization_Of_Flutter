import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_state.freezed.dart';

/// 输入面板类型
enum InputPanelType {
  /// 无面板 (键盘)
  none,

  /// 表情面板
  emoji,

  /// 更多功能面板
  more,

  /// 语音录制模式
  voice,
}

/// 录音状态
enum RecordingState {
  /// 空闲
  idle,

  /// 录制中
  recording,

  /// 准备取消 (上滑)
  cancelPending,

  /// 已取消
  cancelled,

  /// 录制完成
  completed,
}

/// 输入状态模型
@Freezed(toJson: false, fromJson: false)
class InputState with _$InputState {
  const InputState._();

  const factory InputState({
    // 文本内容
    @Default('') String text,
    // 当前面板类型
    @Default(InputPanelType.none) InputPanelType panelType,
    // 键盘是否显示
    @Default(false) bool isKeyboardVisible,
    // 键盘高度
    @Default(0.0) double keyboardHeight,
    // 面板高度 (表情/更多面板)
    @Default(260.0) double panelHeight,
    // 录音状态
    @Default(RecordingState.idle) RecordingState recordingState,
    // 录音时长 (秒)
    @Default(0) int recordingDuration,
    // 录音分贝
    @Default(0.0) double recordingDecibel,
    // 草稿
    String? draft,
    // @提及的用户列表
    @Default([]) List<String> mentionedUsers,
    // 回复的消息ID
    String? replyMessageId,
    // 回复的消息内容预览
    String? replyMessagePreview,
    // 是否正在编辑消息
    @Default(false) bool isEditing,
    // 正在编辑的消息ID
    String? editingMessageId,
  }) = _InputState;

  /// 是否显示面板 (表情或更多)
  bool get isPanelVisible =>
      panelType == InputPanelType.emoji || panelType == InputPanelType.more;

  /// 是否处于语音模式
  bool get isVoiceMode => panelType == InputPanelType.voice;

  /// 是否正在录音
  bool get isRecording => recordingState == RecordingState.recording;

  /// 是否准备取消录音
  bool get isCancelPending => recordingState == RecordingState.cancelPending;

  /// 当前底部区域高度
  double get bottomAreaHeight {
    if (isKeyboardVisible) return keyboardHeight;
    if (isPanelVisible) return panelHeight;
    return 0;
  }

  /// 是否有输入内容
  bool get hasContent => text.trim().isNotEmpty;

  /// 是否正在回复消息
  bool get isReplying => replyMessageId != null;

  /// 格式化录音时长
  String get formattedRecordingDuration {
    final minutes = recordingDuration ~/ 60;
    final seconds = recordingDuration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

/// 消息列表状态
@Freezed(toJson: false, fromJson: false)
class MessageListState with _$MessageListState {
  const MessageListState._();

  const factory MessageListState({
    // 是否正在加载
    @Default(false) bool isLoading,
    // 是否正在加载更多
    @Default(false) bool isLoadingMore,
    // 是否有更多数据
    @Default(true) bool hasMore,
    // 错误信息
    String? error,
    // 是否滚动到底部
    @Default(true) bool isAtBottom,
    // 新消息数量 (未读)
    @Default(0) int newMessageCount,
  }) = _MessageListState;

  /// 是否显示新消息提示
  bool get showNewMessageHint => !isAtBottom && newMessageCount > 0;
}
