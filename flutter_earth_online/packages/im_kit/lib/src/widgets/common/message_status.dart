import 'package:flutter/material.dart';
import '../../models/message/im_message.dart';

/// 消息状态组件
class MessageStatusWidget extends StatelessWidget {
  /// 消息状态
  final MessageStatus status;

  /// 重发回调
  final VoidCallback? onResend;

  /// 图标大小
  final double iconSize;

  /// 图标颜色
  final Color? iconColor;

  const MessageStatusWidget({
    super.key,
    required this.status,
    this.onResend,
    this.iconSize = 16,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case MessageStatus.sending:
        return SizedBox(
          width: iconSize,
          height: iconSize,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            valueColor: AlwaysStoppedAnimation<Color>(
              iconColor ?? Colors.grey,
            ),
          ),
        );

      case MessageStatus.sent:
        return Icon(
          Icons.check,
          size: iconSize,
          color: iconColor ?? Colors.grey,
        );

      case MessageStatus.delivered:
        return Icon(
          Icons.done_all,
          size: iconSize,
          color: iconColor ?? Colors.grey,
        );

      case MessageStatus.read:
        return Icon(
          Icons.done_all,
          size: iconSize,
          color: iconColor ?? Colors.blue,
        );

      case MessageStatus.failed:
        return GestureDetector(
          onTap: onResend,
          child: Icon(
            Icons.error_outline,
            size: iconSize,
            color: Colors.red,
          ),
        );
    }
  }
}

/// 未读徽章
class UnreadBadge extends StatelessWidget {
  /// 未读数量
  final int count;

  /// 最大显示数量
  final int maxCount;

  /// 背景颜色
  final Color backgroundColor;

  /// 文字颜色
  final Color textColor;

  /// 字体大小
  final double fontSize;

  /// 最小尺寸
  final double minSize;

  const UnreadBadge({
    super.key,
    required this.count,
    this.maxCount = 99,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,
    this.fontSize = 10,
    this.minSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();

    final displayText = count > maxCount ? '$maxCount+' : '$count';

    return Container(
      constraints: BoxConstraints(
        minWidth: minSize,
        minHeight: minSize,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(minSize / 2),
      ),
      child: Center(
        child: Text(
          displayText,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/// 红点徽章
class DotBadge extends StatelessWidget {
  /// 是否显示
  final bool show;

  /// 颜色
  final Color color;

  /// 大小
  final double size;

  const DotBadge({
    super.key,
    this.show = true,
    this.color = Colors.red,
    this.size = 8,
  });

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

/// 带徽章的头像
class AvatarWithBadge extends StatelessWidget {
  /// 头像组件
  final Widget avatar;

  /// 徽章组件
  final Widget? badge;

  /// 徽章位置
  final AlignmentGeometry badgeAlignment;

  const AvatarWithBadge({
    super.key,
    required this.avatar,
    this.badge,
    this.badgeAlignment = Alignment.topRight,
  });

  @override
  Widget build(BuildContext context) {
    if (badge == null) return avatar;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        Positioned(
          top: -4,
          right: -4,
          child: badge!,
        ),
      ],
    );
  }
}
