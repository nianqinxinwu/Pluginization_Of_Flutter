import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/keyboard/input_state.dart';

part 'input_provider.g.dart';

/// 输入状态管理
@riverpod
class InputNotifier extends _$InputNotifier {
  @override
  InputState build(String conversationId) {
    return const InputState();
  }

  /// 更新文本内容
  void updateText(String text) {
    state = state.copyWith(text: text);
  }

  /// 切换面板类型
  void switchPanel(InputPanelType panelType) {
    state = state.copyWith(panelType: panelType);
  }

  /// 显示表情面板
  void showEmojiPanel() {
    state = state.copyWith(
      panelType: InputPanelType.emoji,
      isKeyboardVisible: false,
    );
  }

  /// 显示更多面板
  void showMorePanel() {
    state = state.copyWith(
      panelType: InputPanelType.more,
      isKeyboardVisible: false,
    );
  }

  /// 切换到语音模式
  void switchToVoice() {
    state = state.copyWith(
      panelType: InputPanelType.voice,
      isKeyboardVisible: false,
    );
  }

  /// 切换到文字模式
  void switchToText() {
    state = state.copyWith(panelType: InputPanelType.none);
  }

  /// 更新键盘可见性
  void updateKeyboardVisibility(bool visible) {
    state = state.copyWith(
      isKeyboardVisible: visible,
      panelType: visible ? InputPanelType.none : state.panelType,
    );
  }

  /// 更新键盘高度
  void updateKeyboardHeight(double height) {
    state = state.copyWith(keyboardHeight: height);
    // 同步更新面板高度
    if (height > 0 && height != state.panelHeight) {
      state = state.copyWith(panelHeight: height);
    }
  }

  /// 开始录音
  void startRecording() {
    state = state.copyWith(
      recordingState: RecordingState.recording,
      recordingDuration: 0,
    );
  }

  /// 更新录音时长
  void updateRecordingDuration(int duration) {
    state = state.copyWith(recordingDuration: duration);
  }

  /// 更新录音分贝
  void updateRecordingDecibel(double decibel) {
    state = state.copyWith(recordingDecibel: decibel);
  }

  /// 准备取消录音
  void prepareCancel() {
    state = state.copyWith(recordingState: RecordingState.cancelPending);
  }

  /// 取消录音
  void cancelRecording() {
    state = state.copyWith(
      recordingState: RecordingState.cancelled,
      recordingDuration: 0,
      recordingDecibel: 0,
    );
    // 重置状态
    Future.delayed(const Duration(milliseconds: 300), () {
      state = state.copyWith(recordingState: RecordingState.idle);
    });
  }

  /// 完成录音
  void completeRecording() {
    state = state.copyWith(recordingState: RecordingState.completed);
    // 重置状态
    Future.delayed(const Duration(milliseconds: 300), () {
      state = state.copyWith(
        recordingState: RecordingState.idle,
        recordingDuration: 0,
        recordingDecibel: 0,
      );
    });
  }

  /// 设置草稿
  void setDraft(String? draft) {
    state = state.copyWith(draft: draft);
  }

  /// 添加@用户
  void addMention(String userId) {
    final mentions = [...state.mentionedUsers, userId];
    state = state.copyWith(mentionedUsers: mentions);
  }

  /// 移除@用户
  void removeMention(String userId) {
    final mentions = state.mentionedUsers.where((id) => id != userId).toList();
    state = state.copyWith(mentionedUsers: mentions);
  }

  /// 设置回复消息
  void setReplyMessage(String? messageId, String? preview) {
    state = state.copyWith(
      replyMessageId: messageId,
      replyMessagePreview: preview,
    );
  }

  /// 清除回复消息
  void clearReplyMessage() {
    state = state.copyWith(
      replyMessageId: null,
      replyMessagePreview: null,
    );
  }

  /// 开始编辑消息
  void startEditing(String messageId) {
    state = state.copyWith(
      isEditing: true,
      editingMessageId: messageId,
    );
  }

  /// 取消编辑消息
  void cancelEditing() {
    state = state.copyWith(
      isEditing: false,
      editingMessageId: null,
    );
  }

  /// 清空输入
  void clear() {
    state = state.copyWith(
      text: '',
      mentionedUsers: [],
      replyMessageId: null,
      replyMessagePreview: null,
      isEditing: false,
      editingMessageId: null,
    );
  }

  /// 隐藏所有面板
  void hidePanel() {
    state = state.copyWith(
      panelType: InputPanelType.none,
      isKeyboardVisible: false,
    );
  }
}
