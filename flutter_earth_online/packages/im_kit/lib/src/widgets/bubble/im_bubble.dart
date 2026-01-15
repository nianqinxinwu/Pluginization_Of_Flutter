import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/message/im_message.dart';
import '../../models/bubble/bubble_config.dart';
import '../common/message_status.dart';

/// IM 聊天气泡组件
/// 使用 Factory Constructor 模式实现多形态
class IMBubble extends StatelessWidget {
  /// 消息数据
  final IMMessage message;

  /// 气泡配置
  final BubbleConfig? config;

  /// 气泡主题
  final BubbleTheme? theme;

  /// 点击回调
  final VoidCallback? onTap;

  /// 长按回调
  final VoidCallback? onLongPress;

  /// 头像点击回调
  final VoidCallback? onAvatarTap;

  /// 重发回调
  final VoidCallback? onResend;

  /// 自定义内容构建器
  final Widget Function(BuildContext context, IMMessage message)?
      contentBuilder;

  /// 是否显示头像
  final bool showAvatar;

  /// 是否显示昵称
  final bool showNickname;

  /// 是否显示时间
  final bool showTime;

  /// 是否显示消息状态
  final bool showStatus;

  /// 头像组件
  final Widget? avatar;

  const IMBubble({
    super.key,
    required this.message,
    this.config,
    this.theme,
    this.onTap,
    this.onLongPress,
    this.onAvatarTap,
    this.onResend,
    this.contentBuilder,
    this.showAvatar = true,
    this.showNickname = false,
    this.showTime = false,
    this.showStatus = true,
    this.avatar,
  });

  /// 文本消息气泡
  factory IMBubble.text({
    Key? key,
    required TextMessage message,
    BubbleConfig? config,
    BubbleTheme? theme,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onAvatarTap,
    VoidCallback? onResend,
    bool showAvatar = true,
    bool showNickname = false,
    bool showTime = false,
    bool showStatus = true,
    Widget? avatar,
    // 文本特有配置
    bool enableCopy = true,
    bool enableLink = true,
    TextStyle? textStyle,
    int? maxLines,
  }) {
    return _TextBubble(
      key: key,
      message: message,
      config: config,
      theme: theme,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      avatar: avatar,
      enableCopy: enableCopy,
      enableLink: enableLink,
      textStyle: textStyle,
      maxLines: maxLines,
    );
  }

  /// 图片消息气泡
  factory IMBubble.image({
    Key? key,
    required ImageMessage message,
    BubbleConfig? config,
    BubbleTheme? theme,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onAvatarTap,
    VoidCallback? onResend,
    bool showAvatar = true,
    bool showNickname = false,
    bool showTime = false,
    bool showStatus = true,
    Widget? avatar,
    // 图片特有配置
    double? maxWidth,
    double? maxHeight,
    BoxFit fit = BoxFit.cover,
    Widget? placeholder,
    Widget? errorWidget,
    double borderRadius = 8.0,
  }) {
    return _ImageBubble(
      key: key,
      message: message,
      config: config,
      theme: theme,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      avatar: avatar,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      fit: fit,
      placeholder: placeholder,
      errorWidget: errorWidget,
      borderRadius: borderRadius,
    );
  }

  /// 语音消息气泡
  factory IMBubble.voice({
    Key? key,
    required VoiceMessage message,
    BubbleConfig? config,
    BubbleTheme? theme,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onAvatarTap,
    VoidCallback? onResend,
    bool showAvatar = true,
    bool showNickname = false,
    bool showTime = false,
    bool showStatus = true,
    Widget? avatar,
    // 语音特有配置
    bool isPlaying = false,
    ValueChanged<bool>? onPlayStateChanged,
    double minWidth = 80,
    double maxWidth = 200,
  }) {
    return _VoiceBubble(
      key: key,
      message: message,
      config: config,
      theme: theme,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      avatar: avatar,
      isPlaying: isPlaying,
      onPlayStateChanged: onPlayStateChanged,
      minWidth: minWidth,
      maxWidth: maxWidth,
    );
  }

  /// 视频消息气泡
  factory IMBubble.video({
    Key? key,
    required VideoMessage message,
    BubbleConfig? config,
    BubbleTheme? theme,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onAvatarTap,
    VoidCallback? onResend,
    bool showAvatar = true,
    bool showNickname = false,
    bool showTime = false,
    bool showStatus = true,
    Widget? avatar,
    // 视频特有配置
    double? maxWidth,
    double? maxHeight,
    Widget? playIcon,
    double borderRadius = 8.0,
  }) {
    return _VideoBubble(
      key: key,
      message: message,
      config: config,
      theme: theme,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      avatar: avatar,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      playIcon: playIcon,
      borderRadius: borderRadius,
    );
  }

  /// 文件消息气泡
  factory IMBubble.file({
    Key? key,
    required FileMessage message,
    BubbleConfig? config,
    BubbleTheme? theme,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onAvatarTap,
    VoidCallback? onResend,
    bool showAvatar = true,
    bool showNickname = false,
    bool showTime = false,
    bool showStatus = true,
    Widget? avatar,
    // 文件特有配置
    VoidCallback? onDownload,
    Widget Function(String extension)? iconBuilder,
  }) {
    return _FileBubble(
      key: key,
      message: message,
      config: config,
      theme: theme,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      avatar: avatar,
      onDownload: onDownload,
      iconBuilder: iconBuilder,
    );
  }

  /// 位置消息气泡
  factory IMBubble.location({
    Key? key,
    required LocationMessage message,
    BubbleConfig? config,
    BubbleTheme? theme,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onAvatarTap,
    VoidCallback? onResend,
    bool showAvatar = true,
    bool showNickname = false,
    bool showTime = false,
    bool showStatus = true,
    Widget? avatar,
  }) {
    return _LocationBubble(
      key: key,
      message: message,
      config: config,
      theme: theme,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      avatar: avatar,
    );
  }

  /// 名片消息气泡
  factory IMBubble.card({
    Key? key,
    required CardMessage message,
    BubbleConfig? config,
    BubbleTheme? theme,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onAvatarTap,
    VoidCallback? onResend,
    bool showAvatar = true,
    bool showNickname = false,
    bool showTime = false,
    bool showStatus = true,
    Widget? avatar,
  }) {
    return _CardBubble(
      key: key,
      message: message,
      config: config,
      theme: theme,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      avatar: avatar,
    );
  }

  /// 红包消息气泡
  factory IMBubble.redPacket({
    Key? key,
    required RedPacketMessage message,
    BubbleConfig? config,
    BubbleTheme? theme,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onAvatarTap,
    VoidCallback? onResend,
    bool showAvatar = true,
    bool showNickname = false,
    bool showTime = false,
    bool showStatus = true,
    Widget? avatar,
  }) {
    return _RedPacketBubble(
      key: key,
      message: message,
      config: config,
      theme: theme,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      avatar: avatar,
    );
  }

  /// 转账消息气泡
  factory IMBubble.transfer({
    Key? key,
    required TransferMessage message,
    BubbleConfig? config,
    BubbleTheme? theme,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onAvatarTap,
    VoidCallback? onResend,
    bool showAvatar = true,
    bool showNickname = false,
    bool showTime = false,
    bool showStatus = true,
    Widget? avatar,
  }) {
    return _TransferBubble(
      key: key,
      message: message,
      config: config,
      theme: theme,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      avatar: avatar,
    );
  }

  /// 合并转发消息气泡
  factory IMBubble.forward({
    Key? key,
    required ForwardMessage message,
    BubbleConfig? config,
    BubbleTheme? theme,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onAvatarTap,
    VoidCallback? onResend,
    bool showAvatar = true,
    bool showNickname = false,
    bool showTime = false,
    bool showStatus = true,
    Widget? avatar,
  }) {
    return _ForwardBubble(
      key: key,
      message: message,
      config: config,
      theme: theme,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      avatar: avatar,
    );
  }

  /// 自定义消息气泡
  factory IMBubble.custom({
    Key? key,
    required CustomMessage message,
    required Widget Function(BuildContext context, CustomMessage message)
        builder,
    BubbleConfig? config,
    BubbleTheme? theme,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onAvatarTap,
    VoidCallback? onResend,
    bool showAvatar = true,
    bool showNickname = false,
    bool showTime = false,
    bool showStatus = true,
    Widget? avatar,
  }) {
    return _CustomBubble(
      key: key,
      message: message,
      builder: builder,
      config: config,
      theme: theme,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      avatar: avatar,
    );
  }

  /// 根据消息类型自动选择气泡
  factory IMBubble.auto({
    Key? key,
    required IMMessage message,
    BubbleConfig? config,
    BubbleTheme? theme,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onAvatarTap,
    VoidCallback? onResend,
    bool showAvatar = true,
    bool showNickname = false,
    bool showTime = false,
    bool showStatus = true,
    Widget? avatar,
    // 自定义消息构建器
    Widget Function(BuildContext context, CustomMessage message)?
        customBuilder,
  }) {
    return message.map(
      text: (m) => IMBubble.text(
        key: key,
        message: m,
        config: config,
        theme: theme,
        onTap: onTap,
        onLongPress: onLongPress,
        onAvatarTap: onAvatarTap,
        onResend: onResend,
        showAvatar: showAvatar,
        showNickname: showNickname,
        showTime: showTime,
        showStatus: showStatus,
        avatar: avatar,
      ),
      image: (m) => IMBubble.image(
        key: key,
        message: m,
        config: config,
        theme: theme,
        onTap: onTap,
        onLongPress: onLongPress,
        onAvatarTap: onAvatarTap,
        onResend: onResend,
        showAvatar: showAvatar,
        showNickname: showNickname,
        showTime: showTime,
        showStatus: showStatus,
        avatar: avatar,
      ),
      voice: (m) => IMBubble.voice(
        key: key,
        message: m,
        config: config,
        theme: theme,
        onTap: onTap,
        onLongPress: onLongPress,
        onAvatarTap: onAvatarTap,
        onResend: onResend,
        showAvatar: showAvatar,
        showNickname: showNickname,
        showTime: showTime,
        showStatus: showStatus,
        avatar: avatar,
      ),
      video: (m) => IMBubble.video(
        key: key,
        message: m,
        config: config,
        theme: theme,
        onTap: onTap,
        onLongPress: onLongPress,
        onAvatarTap: onAvatarTap,
        onResend: onResend,
        showAvatar: showAvatar,
        showNickname: showNickname,
        showTime: showTime,
        showStatus: showStatus,
        avatar: avatar,
      ),
      file: (m) => IMBubble.file(
        key: key,
        message: m,
        config: config,
        theme: theme,
        onTap: onTap,
        onLongPress: onLongPress,
        onAvatarTap: onAvatarTap,
        onResend: onResend,
        showAvatar: showAvatar,
        showNickname: showNickname,
        showTime: showTime,
        showStatus: showStatus,
        avatar: avatar,
      ),
      location: (m) => IMBubble.location(
        key: key,
        message: m,
        config: config,
        theme: theme,
        onTap: onTap,
        onLongPress: onLongPress,
        onAvatarTap: onAvatarTap,
        onResend: onResend,
        showAvatar: showAvatar,
        showNickname: showNickname,
        showTime: showTime,
        showStatus: showStatus,
        avatar: avatar,
      ),
      card: (m) => IMBubble.card(
        key: key,
        message: m,
        config: config,
        theme: theme,
        onTap: onTap,
        onLongPress: onLongPress,
        onAvatarTap: onAvatarTap,
        onResend: onResend,
        showAvatar: showAvatar,
        showNickname: showNickname,
        showTime: showTime,
        showStatus: showStatus,
        avatar: avatar,
      ),
      redPacket: (m) => IMBubble.redPacket(
        key: key,
        message: m,
        config: config,
        theme: theme,
        onTap: onTap,
        onLongPress: onLongPress,
        onAvatarTap: onAvatarTap,
        onResend: onResend,
        showAvatar: showAvatar,
        showNickname: showNickname,
        showTime: showTime,
        showStatus: showStatus,
        avatar: avatar,
      ),
      transfer: (m) => IMBubble.transfer(
        key: key,
        message: m,
        config: config,
        theme: theme,
        onTap: onTap,
        onLongPress: onLongPress,
        onAvatarTap: onAvatarTap,
        onResend: onResend,
        showAvatar: showAvatar,
        showNickname: showNickname,
        showTime: showTime,
        showStatus: showStatus,
        avatar: avatar,
      ),
      forward: (m) => IMBubble.forward(
        key: key,
        message: m,
        config: config,
        theme: theme,
        onTap: onTap,
        onLongPress: onLongPress,
        onAvatarTap: onAvatarTap,
        onResend: onResend,
        showAvatar: showAvatar,
        showNickname: showNickname,
        showTime: showTime,
        showStatus: showStatus,
        avatar: avatar,
      ),
      custom: (m) => IMBubble.custom(
        key: key,
        message: m,
        builder:
            customBuilder ?? (_, msg) => Text('Custom: ${msg.customType}'),
        config: config,
        theme: theme,
        onTap: onTap,
        onLongPress: onLongPress,
        onAvatarTap: onAvatarTap,
        onResend: onResend,
        showAvatar: showAvatar,
        showNickname: showNickname,
        showTime: showTime,
        showStatus: showStatus,
        avatar: avatar,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _BaseBubbleLayout(
      message: message,
      config: config,
      theme: theme,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      avatar: avatar,
      child: contentBuilder?.call(context, message) ??
          const Text('Unsupported message type'),
    );
  }
}

/// 基础气泡布局组件
class _BaseBubbleLayout extends StatelessWidget {
  final IMMessage message;
  final BubbleConfig? config;
  final BubbleTheme? theme;
  final bool showAvatar;
  final bool showNickname;
  final bool showTime;
  final bool showStatus;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onResend;
  final Widget? avatar;
  final Widget child;

  const _BaseBubbleLayout({
    required this.message,
    required this.child,
    this.config,
    this.theme,
    this.showAvatar = true,
    this.showNickname = false,
    this.showTime = false,
    this.showStatus = true,
    this.onTap,
    this.onLongPress,
    this.onAvatarTap,
    this.onResend,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleTheme = theme ?? BubbleTheme.defaultTheme();
    final bubbleConfig = config ?? bubbleTheme.getConfigForDirection(message.isSelf);
    final isSelf = message.isSelf;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 左侧头像 (接收方)
          if (!isSelf && showAvatar) ...[
            _buildAvatar(bubbleTheme),
            SizedBox(width: bubbleTheme.avatarSpacing),
          ],

          // 消息内容区域
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isSelf ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                // 昵称
                if (showNickname && !isSelf)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4, left: 4),
                    child: Text(
                      message.senderName,
                      style: bubbleTheme.nicknameStyle ??
                          const TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 12,
                          ),
                    ),
                  ),

                // 气泡内容
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // 消息状态 (发送方，左侧)
                    if (isSelf && showStatus) ...[
                      MessageStatusWidget(
                        status: message.status,
                        onResend: onResend,
                        iconSize: bubbleTheme.statusIconSize,
                        iconColor: bubbleTheme.statusIconColor,
                      ),
                      const SizedBox(width: 4),
                    ],

                    // 气泡
                    Flexible(
                      child: GestureDetector(
                        onTap: onTap,
                        onLongPress: onLongPress,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width *
                                bubbleConfig.maxWidthRatio,
                            minWidth: bubbleConfig.minWidth,
                          ),
                          decoration: bubbleConfig.getDecoration(),
                          padding: bubbleConfig.contentPadding,
                          child: child,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 右侧头像 (发送方)
          if (isSelf && showAvatar) ...[
            SizedBox(width: bubbleTheme.avatarSpacing),
            _buildAvatar(bubbleTheme),
          ],
        ],
      ),
    );
  }

  Widget _buildAvatar(BubbleTheme bubbleTheme) {
    final avatarWidget = avatar ??
        Container(
          width: bubbleTheme.avatarSize,
          height: bubbleTheme.avatarSize,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius:
                BorderRadius.circular(bubbleTheme.avatarBorderRadius),
          ),
          child: message.senderAvatar != null
              ? ClipRRect(
                  borderRadius:
                      BorderRadius.circular(bubbleTheme.avatarBorderRadius),
                  child: Image.network(
                    message.senderAvatar!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.person,
                      size: bubbleTheme.avatarSize * 0.6,
                      color: Colors.grey[600],
                    ),
                  ),
                )
              : Icon(
                  Icons.person,
                  size: bubbleTheme.avatarSize * 0.6,
                  color: Colors.grey[600],
                ),
        );

    return GestureDetector(
      onTap: onAvatarTap,
      child: avatarWidget,
    );
  }
}

// ============== 各类型气泡实现 ==============

/// 文本气泡
class _TextBubble extends IMBubble {
  final bool enableCopy;
  final bool enableLink;
  final TextStyle? textStyle;
  final int? maxLines;

  const _TextBubble({
    super.key,
    required TextMessage super.message,
    super.config,
    super.theme,
    super.onTap,
    super.onLongPress,
    super.onAvatarTap,
    super.onResend,
    super.showAvatar,
    super.showNickname,
    super.showTime,
    super.showStatus,
    super.avatar,
    this.enableCopy = true,
    this.enableLink = true,
    this.textStyle,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final textMsg = message as TextMessage;
    final bubbleTheme = theme ?? BubbleTheme.defaultTheme();
    final bubbleConfig =
        config ?? bubbleTheme.getConfigForDirection(message.isSelf);

    return _BaseBubbleLayout(
      message: message,
      config: config,
      theme: theme,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      onTap: onTap,
      onLongPress: enableCopy
          ? () {
              Clipboard.setData(ClipboardData(text: textMsg.content));
              onLongPress?.call();
            }
          : onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      avatar: avatar,
      child: Text(
        textMsg.content,
        style: textStyle ?? bubbleConfig.textStyle,
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
      ),
    );
  }
}

/// 图片气泡
class _ImageBubble extends IMBubble {
  final double? maxWidth;
  final double? maxHeight;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double borderRadius;

  const _ImageBubble({
    super.key,
    required ImageMessage super.message,
    super.config,
    super.theme,
    super.onTap,
    super.onLongPress,
    super.onAvatarTap,
    super.onResend,
    super.showAvatar,
    super.showNickname,
    super.showTime,
    super.showStatus,
    super.avatar,
    this.maxWidth,
    this.maxHeight,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final imageMsg = message as ImageMessage;
    final screenWidth = MediaQuery.of(context).size.width;
    final imgMaxWidth = maxWidth ?? screenWidth * 0.5;
    final imgMaxHeight = maxHeight ?? 200.0;

    return _BaseBubbleLayout(
      message: message,
      config: BubbleConfig.transparent(
        arrowPosition: message.isSelf
            ? BubbleArrowPosition.right
            : BubbleArrowPosition.left,
      ),
      theme: theme,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      avatar: avatar,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: imgMaxWidth,
            maxHeight: imgMaxHeight,
          ),
          child: Image.network(
            imageMsg.thumbnailUrl ?? imageMsg.url,
            fit: fit,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return placeholder ??
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
            },
            errorBuilder: (_, __, ___) =>
                errorWidget ??
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
          ),
        ),
      ),
    );
  }
}

/// 语音气泡
class _VoiceBubble extends IMBubble {
  final bool isPlaying;
  final ValueChanged<bool>? onPlayStateChanged;
  final double minWidth;
  final double maxWidth;

  const _VoiceBubble({
    super.key,
    required VoiceMessage super.message,
    super.config,
    super.theme,
    super.onTap,
    super.onLongPress,
    super.onAvatarTap,
    super.onResend,
    super.showAvatar,
    super.showNickname,
    super.showTime,
    super.showStatus,
    super.avatar,
    this.isPlaying = false,
    this.onPlayStateChanged,
    this.minWidth = 80,
    this.maxWidth = 200,
  });

  @override
  Widget build(BuildContext context) {
    final voiceMsg = message as VoiceMessage;
    final bubbleTheme = theme ?? BubbleTheme.defaultTheme();
    final bubbleConfig =
        config ?? bubbleTheme.getConfigForDirection(message.isSelf);

    // 根据时长计算宽度
    final duration = voiceMsg.duration;
    final width =
        minWidth + (maxWidth - minWidth) * (duration / 60).clamp(0.0, 1.0);

    return _BaseBubbleLayout(
      message: message,
      config: config,
      theme: theme,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      onTap: () {
        onPlayStateChanged?.call(!isPlaying);
        onTap?.call();
      },
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      avatar: avatar,
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!message.isSelf) ...[
              _VoiceWaveIcon(isPlaying: isPlaying, isLeft: true),
              const Spacer(),
            ],
            Text(
              '$duration″',
              style: bubbleConfig.textStyle,
            ),
            if (message.isSelf) ...[
              const Spacer(),
              _VoiceWaveIcon(isPlaying: isPlaying, isLeft: false),
            ],
          ],
        ),
      ),
    );
  }
}

/// 语音波形图标
class _VoiceWaveIcon extends StatelessWidget {
  final bool isPlaying;
  final bool isLeft;

  const _VoiceWaveIcon({
    required this.isPlaying,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: isLeft,
      child: Icon(
        isPlaying ? Icons.volume_up : Icons.volume_down,
        size: 20,
        color: const Color(0xFF1D1D1D),
      ),
    );
  }
}

/// 视频气泡
class _VideoBubble extends IMBubble {
  final double? maxWidth;
  final double? maxHeight;
  final Widget? playIcon;
  final double borderRadius;

  const _VideoBubble({
    super.key,
    required VideoMessage super.message,
    super.config,
    super.theme,
    super.onTap,
    super.onLongPress,
    super.onAvatarTap,
    super.onResend,
    super.showAvatar,
    super.showNickname,
    super.showTime,
    super.showStatus,
    super.avatar,
    this.maxWidth,
    this.maxHeight,
    this.playIcon,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final videoMsg = message as VideoMessage;
    final screenWidth = MediaQuery.of(context).size.width;
    final vidMaxWidth = maxWidth ?? screenWidth * 0.5;
    final vidMaxHeight = maxHeight ?? 200.0;

    return _BaseBubbleLayout(
      message: message,
      config: BubbleConfig.transparent(
        arrowPosition: message.isSelf
            ? BubbleArrowPosition.right
            : BubbleArrowPosition.left,
      ),
      theme: theme,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      avatar: avatar,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: vidMaxWidth,
                maxHeight: vidMaxHeight,
              ),
              child: videoMsg.thumbnailUrl != null
                  ? Image.network(
                      videoMsg.thumbnailUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 150,
                        height: 150,
                        color: Colors.grey[800],
                        child:
                            const Icon(Icons.videocam, color: Colors.white54),
                      ),
                    )
                  : Container(
                      width: 150,
                      height: 150,
                      color: Colors.grey[800],
                      child: const Icon(Icons.videocam, color: Colors.white54),
                    ),
            ),
          ),
          // 播放按钮
          playIcon ??
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 32,
                ),
              ),
          // 时长
          Positioned(
            right: 8,
            bottom: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                _formatDuration(videoMsg.duration),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}

/// 文件气泡
class _FileBubble extends IMBubble {
  final VoidCallback? onDownload;
  final Widget Function(String extension)? iconBuilder;

  const _FileBubble({
    super.key,
    required FileMessage super.message,
    super.config,
    super.theme,
    super.onTap,
    super.onLongPress,
    super.onAvatarTap,
    super.onResend,
    super.showAvatar,
    super.showNickname,
    super.showTime,
    super.showStatus,
    super.avatar,
    this.onDownload,
    this.iconBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final fileMsg = message as FileMessage;
    final bubbleTheme = theme ?? BubbleTheme.defaultTheme();
    final bubbleConfig =
        config ?? bubbleTheme.getConfigForDirection(message.isSelf);

    return _BaseBubbleLayout(
      message: message,
      config: config,
      theme: theme,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      onTap: onTap ?? onDownload,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      avatar: avatar,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconBuilder?.call(fileMsg.fileExtension ?? '') ??
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.insert_drive_file,
                  color: Colors.blue,
                  size: 28,
                ),
              ),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  fileMsg.fileName,
                  style: bubbleConfig.textStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  _formatFileSize(fileMsg.fileSize),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}

/// 位置气泡
class _LocationBubble extends IMBubble {
  const _LocationBubble({
    super.key,
    required LocationMessage super.message,
    super.config,
    super.theme,
    super.onTap,
    super.onLongPress,
    super.onAvatarTap,
    super.onResend,
    super.showAvatar,
    super.showNickname,
    super.showTime,
    super.showStatus,
    super.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final locationMsg = message as LocationMessage;

    return _BaseBubbleLayout(
      message: message,
      config: BubbleConfig.transparent(
        arrowPosition: message.isSelf
            ? BubbleArrowPosition.right
            : BubbleArrowPosition.left,
      ),
      theme: theme,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      avatar: avatar,
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 地图封面
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
              ),
              child: locationMsg.coverUrl != null
                  ? ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(8)),
                      child: Image.network(
                        locationMsg.coverUrl!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                  : const Center(
                      child: Icon(Icons.location_on,
                          size: 48, color: Colors.red),
                    ),
            ),
            // 地址信息
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (locationMsg.name != null)
                    Text(
                      locationMsg.name!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 2),
                  Text(
                    locationMsg.address,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 名片气泡
class _CardBubble extends IMBubble {
  const _CardBubble({
    super.key,
    required CardMessage super.message,
    super.config,
    super.theme,
    super.onTap,
    super.onLongPress,
    super.onAvatarTap,
    super.onResend,
    super.showAvatar,
    super.showNickname,
    super.showTime,
    super.showStatus,
    super.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final cardMsg = message as CardMessage;

    return _BaseBubbleLayout(
      message: message,
      config: BubbleConfig.transparent(
        arrowPosition: message.isSelf
            ? BubbleArrowPosition.right
            : BubbleArrowPosition.left,
      ),
      theme: theme,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      avatar: avatar,
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: cardMsg.userAvatar != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              cardMsg.userAvatar!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(Icons.person,
                            size: 32, color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardMsg.userName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (cardMsg.userSignature != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            cardMsg.userSignature!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(8)),
              ),
              child: Text(
                '个人名片',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 红包气泡
class _RedPacketBubble extends IMBubble {
  const _RedPacketBubble({
    super.key,
    required RedPacketMessage super.message,
    super.config,
    super.theme,
    super.onTap,
    super.onLongPress,
    super.onAvatarTap,
    super.onResend,
    super.showAvatar,
    super.showNickname,
    super.showTime,
    super.showStatus,
    super.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final redPacketMsg = message as RedPacketMessage;
    final isOpened = redPacketMsg.isOpened;
    final isExpired = redPacketMsg.isExpired;

    return _BaseBubbleLayout(
      message: message,
      config: BubbleConfig.transparent(
        arrowPosition: message.isSelf
            ? BubbleArrowPosition.right
            : BubbleArrowPosition.left,
      ),
      theme: theme,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      avatar: avatar,
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isOpened || isExpired
                ? [const Color(0xFFE8A070), const Color(0xFFD08050)]
                : [const Color(0xFFFA9D3B), const Color(0xFFE75A40)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      redPacketMsg.greeting,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.1),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(8)),
              ),
              child: Text(
                isExpired
                    ? '红包已过期'
                    : isOpened
                        ? '已领取'
                        : '红包',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 转账气泡
class _TransferBubble extends IMBubble {
  const _TransferBubble({
    super.key,
    required TransferMessage super.message,
    super.config,
    super.theme,
    super.onTap,
    super.onLongPress,
    super.onAvatarTap,
    super.onResend,
    super.showAvatar,
    super.showNickname,
    super.showTime,
    super.showStatus,
    super.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final transferMsg = message as TransferMessage;
    final isReceived = transferMsg.isReceived;
    final isExpired = transferMsg.isExpired;

    return _BaseBubbleLayout(
      message: message,
      config: BubbleConfig.transparent(
        arrowPosition: message.isSelf
            ? BubbleArrowPosition.right
            : BubbleArrowPosition.left,
      ),
      theme: theme,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      avatar: avatar,
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color:
              isReceived || isExpired ? Colors.grey[300] : const Color(0xFFFAA21E),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.monetization_on,
                    color: isReceived || isExpired
                        ? Colors.grey[600]
                        : Colors.white,
                    size: 40,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '¥${transferMsg.amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: isReceived || isExpired
                                ? Colors.grey[800]
                                : Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (transferMsg.remark != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            transferMsg.remark!,
                            style: TextStyle(
                              color: isReceived || isExpired
                                  ? Colors.grey[600]
                                  : Colors.white.withValues(alpha: 0.8),
                              fontSize: 13,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.1),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(8)),
              ),
              child: Text(
                isExpired
                    ? '转账已过期'
                    : isReceived
                        ? '已收款'
                        : '转账',
                style: TextStyle(
                  fontSize: 12,
                  color: isReceived || isExpired
                      ? Colors.grey[600]
                      : Colors.white.withValues(alpha: 0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 合并转发气泡
class _ForwardBubble extends IMBubble {
  const _ForwardBubble({
    super.key,
    required ForwardMessage super.message,
    super.config,
    super.theme,
    super.onTap,
    super.onLongPress,
    super.onAvatarTap,
    super.onResend,
    super.showAvatar,
    super.showNickname,
    super.showTime,
    super.showStatus,
    super.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final forwardMsg = message as ForwardMessage;
    final bubbleTheme = theme ?? BubbleTheme.defaultTheme();
    final bubbleConfig =
        config ?? bubbleTheme.getConfigForDirection(message.isSelf);

    return _BaseBubbleLayout(
      message: message,
      config: config,
      theme: theme,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      avatar: avatar,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 220),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              forwardMsg.title,
              style: bubbleConfig.textStyle?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0;
                      i < forwardMsg.abstractList.take(4).length;
                      i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: i < 3 ? 4 : 0),
                      child: Text(
                        forwardMsg.abstractList[i],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '聊天记录',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: Colors.grey[500],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 自定义消息气泡
class _CustomBubble extends IMBubble {
  final Widget Function(BuildContext context, CustomMessage message) builder;

  const _CustomBubble({
    super.key,
    required CustomMessage super.message,
    required this.builder,
    super.config,
    super.theme,
    super.onTap,
    super.onLongPress,
    super.onAvatarTap,
    super.onResend,
    super.showAvatar,
    super.showNickname,
    super.showTime,
    super.showStatus,
    super.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final customMsg = message as CustomMessage;

    return _BaseBubbleLayout(
      message: message,
      config: config,
      theme: theme,
      showAvatar: showAvatar,
      showNickname: showNickname,
      showTime: showTime,
      showStatus: showStatus,
      onTap: onTap,
      onLongPress: onLongPress,
      onAvatarTap: onAvatarTap,
      onResend: onResend,
      avatar: avatar,
      child: builder(context, customMsg),
    );
  }
}
