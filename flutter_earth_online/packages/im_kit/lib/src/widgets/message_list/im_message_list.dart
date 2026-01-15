import 'package:flutter/material.dart';
import '../../models/message/im_message.dart';
import '../../models/bubble/bubble_config.dart';
import '../bubble/im_bubble.dart';
import '../../utils/time_formatter.dart';

/// IM 消息列表组件
class IMMessageList extends StatefulWidget {
  /// 消息列表
  final List<IMMessage> messages;

  /// 消息气泡构建器
  final Widget Function(BuildContext context, IMMessage message)? bubbleBuilder;

  /// 时间分隔构建器
  final Widget Function(DateTime time)? timeDividerBuilder;

  /// 消息点击回调
  final ValueChanged<IMMessage>? onMessageTap;

  /// 消息长按回调
  final ValueChanged<IMMessage>? onMessageLongPress;

  /// 头像点击回调
  final void Function(IMMessage message)? onAvatarTap;

  /// 重发消息回调
  final ValueChanged<IMMessage>? onResend;

  /// 加载更多回调
  final VoidCallback? onLoadMore;

  /// 是否正在加载更多
  final bool isLoadingMore;

  /// 是否还有更多数据
  final bool hasMore;

  /// 滚动控制器
  final ScrollController? scrollController;

  /// 气泡主题
  final BubbleTheme? bubbleTheme;

  /// 时间分隔间隔 (分钟)
  final int timeDividerInterval;

  /// 是否显示时间分隔
  final bool showTimeDivider;

  /// 是否倒序显示 (新消息在底部)
  final bool reverse;

  /// 列表内边距
  final EdgeInsets padding;

  /// 空状态组件
  final Widget? emptyWidget;

  /// 加载更多指示器
  final Widget? loadMoreIndicator;

  /// 自定义消息构建器 (用于处理自定义消息类型)
  final Widget Function(BuildContext context, CustomMessage message)?
      customMessageBuilder;

  /// 头像构建器
  final Widget Function(IMMessage message)? avatarBuilder;

  /// 是否显示头像
  final bool showAvatar;

  /// 是否显示昵称
  final bool showNickname;

  const IMMessageList({
    super.key,
    required this.messages,
    this.bubbleBuilder,
    this.timeDividerBuilder,
    this.onMessageTap,
    this.onMessageLongPress,
    this.onAvatarTap,
    this.onResend,
    this.onLoadMore,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.scrollController,
    this.bubbleTheme,
    this.timeDividerInterval = 5,
    this.showTimeDivider = true,
    this.reverse = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.emptyWidget,
    this.loadMoreIndicator,
    this.customMessageBuilder,
    this.avatarBuilder,
    this.showAvatar = true,
    this.showNickname = false,
  });

  @override
  State<IMMessageList> createState() => _IMMessageListState();
}

class _IMMessageListState extends State<IMMessageList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _onScroll() {
    if (!widget.hasMore || widget.isLoadingMore) return;

    // 判断是否滚动到顶部 (加载更多历史消息)
    if (widget.reverse) {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        widget.onLoadMore?.call();
      }
    } else {
      if (_scrollController.position.pixels <= 100) {
        widget.onLoadMore?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.messages.isEmpty) {
      return widget.emptyWidget ?? const _EmptyMessageList();
    }

    return ListView.builder(
      controller: _scrollController,
      padding: widget.padding,
      reverse: widget.reverse,
      itemCount: widget.messages.length + (widget.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        // 加载更多指示器
        if (widget.isLoadingMore && index == widget.messages.length) {
          return widget.loadMoreIndicator ?? const _LoadMoreIndicator();
        }

        final message = widget.messages[index];
        final previousMessage =
            index < widget.messages.length - 1 ? widget.messages[index + 1] : null;

        return Column(
          children: [
            // 时间分隔器
            if (widget.showTimeDivider &&
                _shouldShowTimeDivider(message, previousMessage))
              widget.timeDividerBuilder?.call(message.timestamp) ??
                  _TimeDivider(time: message.timestamp),

            // 消息气泡
            _buildMessageBubble(context, message),
          ],
        );
      },
    );
  }

  bool _shouldShowTimeDivider(IMMessage current, IMMessage? previous) {
    if (previous == null) return true;

    final diff = current.timestamp.difference(previous.timestamp).abs();
    return diff.inMinutes >= widget.timeDividerInterval;
  }

  Widget _buildMessageBubble(BuildContext context, IMMessage message) {
    if (widget.bubbleBuilder != null) {
      return widget.bubbleBuilder!(context, message);
    }

    return IMBubble.auto(
      message: message,
      theme: widget.bubbleTheme,
      showAvatar: widget.showAvatar,
      showNickname: widget.showNickname,
      avatar: widget.avatarBuilder?.call(message),
      onTap: () => widget.onMessageTap?.call(message),
      onLongPress: () => widget.onMessageLongPress?.call(message),
      onAvatarTap: () => widget.onAvatarTap?.call(message),
      onResend: message.isFailed ? () => widget.onResend?.call(message) : null,
      customBuilder: widget.customMessageBuilder,
    );
  }
}

/// 空消息列表
class _EmptyMessageList extends StatelessWidget {
  const _EmptyMessageList();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 64,
            color: Color(0xFFCCCCCC),
          ),
          SizedBox(height: 16),
          Text(
            '暂无消息',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF999999),
            ),
          ),
        ],
      ),
    );
  }
}

/// 加载更多指示器
class _LoadMoreIndicator extends StatelessWidget {
  const _LoadMoreIndicator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}

/// 时间分隔器
class _TimeDivider extends StatelessWidget {
  final DateTime time;

  const _TimeDivider({required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFE5E5E5),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            TimeFormatter.formatMessageTime(time),
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF999999),
            ),
          ),
        ),
      ),
    );
  }
}
