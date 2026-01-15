import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/message/im_message.dart';
import '../models/keyboard/input_state.dart';

part 'message_list_provider.g.dart';

/// 消息列表管理
@riverpod
class MessageListNotifier extends _$MessageListNotifier {
  @override
  List<IMMessage> build(String conversationId) {
    return [];
  }

  /// 设置消息列表
  void setMessages(List<IMMessage> messages) {
    state = messages;
  }

  /// 添加新消息 (添加到开头，最新消息在前)
  void addMessage(IMMessage message) {
    state = [message, ...state];
  }

  /// 批量添加消息 (历史消息，添加到末尾)
  void addHistoryMessages(List<IMMessage> messages) {
    state = [...state, ...messages];
  }

  /// 更新消息
  void updateMessage(IMMessage message) {
    final index = state.indexWhere((m) => m.id == message.id);
    if (index != -1) {
      final messages = [...state];
      messages[index] = message;
      state = messages;
    }
  }

  /// 更新消息状态
  void updateMessageStatus(String messageId, MessageStatus status) {
    final index = state.indexWhere((m) => m.id == messageId);
    if (index != -1) {
      final messages = [...state];
      messages[index] = _updateStatus(messages[index], status);
      state = messages;
    }
  }

  IMMessage _updateStatus(IMMessage message, MessageStatus status) {
    return message.map(
      text: (m) => m.copyWith(status: status),
      image: (m) => m.copyWith(status: status),
      voice: (m) => m.copyWith(status: status),
      video: (m) => m.copyWith(status: status),
      file: (m) => m.copyWith(status: status),
      location: (m) => m.copyWith(status: status),
      card: (m) => m.copyWith(status: status),
      redPacket: (m) => m.copyWith(status: status),
      transfer: (m) => m.copyWith(status: status),
      forward: (m) => m.copyWith(status: status),
      custom: (m) => m.copyWith(status: status),
    );
  }

  /// 删除消息
  void removeMessage(String messageId) {
    state = state.where((m) => m.id != messageId).toList();
  }

  /// 批量删除消息
  void removeMessages(List<String> messageIds) {
    state = state.where((m) => !messageIds.contains(m.id)).toList();
  }

  /// 清空消息
  void clear() {
    state = [];
  }

  /// 撤回消息 (将消息标记为撤回状态)
  void recallMessage(String messageId) {
    // 可以根据需要实现撤回逻辑
    removeMessage(messageId);
  }
}

/// 消息列表状态管理
@riverpod
class MessageListStateNotifier extends _$MessageListStateNotifier {
  @override
  MessageListState build(String conversationId) {
    return const MessageListState();
  }

  /// 设置加载状态
  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  /// 设置加载更多状态
  void setLoadingMore(bool loading) {
    state = state.copyWith(isLoadingMore: loading);
  }

  /// 设置是否有更多数据
  void setHasMore(bool hasMore) {
    state = state.copyWith(hasMore: hasMore);
  }

  /// 设置错误
  void setError(String? error) {
    state = state.copyWith(
      error: error,
      isLoading: false,
      isLoadingMore: false,
    );
  }

  /// 设置是否在底部
  void setAtBottom(bool atBottom) {
    state = state.copyWith(isAtBottom: atBottom);
  }

  /// 增加新消息数量
  void incrementNewMessageCount() {
    state = state.copyWith(newMessageCount: state.newMessageCount + 1);
  }

  /// 清除新消息数量
  void clearNewMessageCount() {
    state = state.copyWith(newMessageCount: 0);
  }

  /// 重置状态
  void reset() {
    state = const MessageListState();
  }
}
