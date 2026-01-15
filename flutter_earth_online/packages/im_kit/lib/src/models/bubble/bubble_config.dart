import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bubble_config.freezed.dart';

/// 气泡背景类型
enum BubbleBackgroundType {
  /// 纯色
  solid,

  /// 渐变
  gradient,

  /// 图片
  image,
}

/// 气泡箭头位置
enum BubbleArrowPosition {
  /// 左侧
  left,

  /// 右侧
  right,

  /// 无箭头
  none,
}

/// 气泡配置
@Freezed(toJson: false, fromJson: false)
class BubbleConfig with _$BubbleConfig {
  const BubbleConfig._();

  const factory BubbleConfig({
    // 背景配置
    @Default(BubbleBackgroundType.solid) BubbleBackgroundType backgroundType,
    Color? backgroundColor,
    List<Color>? gradientColors,
    @Default(Alignment.topLeft) Alignment gradientBegin,
    @Default(Alignment.bottomRight) Alignment gradientEnd,
    String? backgroundImage,

    // 形状配置
    @Default(12.0) double borderRadius,
    @Default(6.0) double arrowSize,
    @Default(true) bool showArrow,
    @Default(BubbleArrowPosition.left) BubbleArrowPosition arrowPosition,

    // 内边距
    @Default(EdgeInsets.symmetric(horizontal: 12, vertical: 10))
    EdgeInsets contentPadding,

    // 文字样式
    TextStyle? textStyle,

    // 边框
    Color? borderColor,
    @Default(0.0) double borderWidth,

    // 阴影
    @Default(false) bool showShadow,
    BoxShadow? shadow,

    // 最大宽度比例 (相对于屏幕宽度)
    @Default(0.7) double maxWidthRatio,

    // 最小宽度
    @Default(60.0) double minWidth,
  }) = _BubbleConfig;

  /// 发送方默认配置 (绿色气泡)
  factory BubbleConfig.sender({
    Color? backgroundColor,
    TextStyle? textStyle,
    double borderRadius = 12.0,
    EdgeInsets contentPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  }) {
    return BubbleConfig(
      backgroundColor: backgroundColor ?? const Color(0xFF95EC69),
      textStyle: textStyle ??
          const TextStyle(
            color: Color(0xFF1D1D1D),
            fontSize: 16,
            height: 1.4,
          ),
      borderRadius: borderRadius,
      contentPadding: contentPadding,
      arrowPosition: BubbleArrowPosition.right,
    );
  }

  /// 接收方默认配置 (白色气泡)
  factory BubbleConfig.receiver({
    Color? backgroundColor,
    TextStyle? textStyle,
    double borderRadius = 12.0,
    EdgeInsets contentPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  }) {
    return BubbleConfig(
      backgroundColor: backgroundColor ?? Colors.white,
      textStyle: textStyle ??
          const TextStyle(
            color: Color(0xFF1D1D1D),
            fontSize: 16,
            height: 1.4,
          ),
      borderRadius: borderRadius,
      contentPadding: contentPadding,
      arrowPosition: BubbleArrowPosition.left,
    );
  }

  /// 渐变背景配置
  factory BubbleConfig.gradient({
    required List<Color> colors,
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
    TextStyle? textStyle,
    BubbleArrowPosition arrowPosition = BubbleArrowPosition.right,
  }) {
    return BubbleConfig(
      backgroundType: BubbleBackgroundType.gradient,
      gradientColors: colors,
      gradientBegin: begin,
      gradientEnd: end,
      textStyle: textStyle ??
          const TextStyle(
            color: Colors.white,
            fontSize: 16,
            height: 1.4,
          ),
      arrowPosition: arrowPosition,
    );
  }

  /// 图片背景配置
  factory BubbleConfig.image({
    required String imagePath,
    TextStyle? textStyle,
    BubbleArrowPosition arrowPosition = BubbleArrowPosition.right,
  }) {
    return BubbleConfig(
      backgroundType: BubbleBackgroundType.image,
      backgroundImage: imagePath,
      textStyle: textStyle,
      arrowPosition: arrowPosition,
    );
  }

  /// 无背景配置 (用于图片、视频等媒体消息)
  factory BubbleConfig.transparent({
    BubbleArrowPosition arrowPosition = BubbleArrowPosition.right,
  }) {
    return BubbleConfig(
      backgroundColor: Colors.transparent,
      showArrow: false,
      contentPadding: EdgeInsets.zero,
      arrowPosition: arrowPosition,
    );
  }

  /// 获取实际的背景装饰
  BoxDecoration? getDecoration() {
    switch (backgroundType) {
      case BubbleBackgroundType.solid:
        return BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: borderWidth > 0 && borderColor != null
              ? Border.all(color: borderColor!, width: borderWidth)
              : null,
          boxShadow: showShadow && shadow != null ? [shadow!] : null,
        );
      case BubbleBackgroundType.gradient:
        return BoxDecoration(
          gradient: gradientColors != null && gradientColors!.length >= 2
              ? LinearGradient(
                  colors: gradientColors!,
                  begin: gradientBegin,
                  end: gradientEnd,
                )
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: showShadow && shadow != null ? [shadow!] : null,
        );
      case BubbleBackgroundType.image:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: backgroundImage != null
              ? DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.cover,
                )
              : null,
        );
    }
  }
}

/// 气泡主题配置
@Freezed(toJson: false, fromJson: false)
class BubbleTheme with _$BubbleTheme {
  const BubbleTheme._();

  const factory BubbleTheme({
    required BubbleConfig senderConfig,
    required BubbleConfig receiverConfig,
    // 消息间距
    @Default(8.0) double messageSpacing,
    // 头像配置
    @Default(40.0) double avatarSize,
    @Default(8.0) double avatarSpacing,
    @Default(true) bool showAvatar,
    @Default(4.0) double avatarBorderRadius,
    // 昵称配置
    @Default(false) bool showNickname,
    TextStyle? nicknameStyle,
    // 时间配置
    TextStyle? timeStyle,
    @Default(5) int timeDividerIntervalMinutes,
    // 消息状态配置
    @Default(true) bool showMessageStatus,
    @Default(16.0) double statusIconSize,
    Color? statusIconColor,
  }) = _BubbleTheme;

  /// 默认主题
  factory BubbleTheme.defaultTheme() {
    return BubbleTheme(
      senderConfig: BubbleConfig.sender(),
      receiverConfig: BubbleConfig.receiver(),
      nicknameStyle: const TextStyle(
        color: Color(0xFF999999),
        fontSize: 12,
      ),
      timeStyle: const TextStyle(
        color: Color(0xFF999999),
        fontSize: 12,
      ),
    );
  }

  /// 微信风格主题
  factory BubbleTheme.wechat() {
    return BubbleTheme(
      senderConfig: BubbleConfig.sender(
        backgroundColor: const Color(0xFF95EC69),
      ),
      receiverConfig: BubbleConfig.receiver(
        backgroundColor: Colors.white,
      ),
      showNickname: false,
      nicknameStyle: const TextStyle(
        color: Color(0xFF999999),
        fontSize: 12,
      ),
      timeStyle: const TextStyle(
        color: Color(0xFFB2B2B2),
        fontSize: 12,
      ),
    );
  }

  /// 暗色主题
  factory BubbleTheme.dark() {
    return BubbleTheme(
      senderConfig: BubbleConfig.sender(
        backgroundColor: const Color(0xFF3B82F6),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          height: 1.4,
        ),
      ),
      receiverConfig: BubbleConfig.receiver(
        backgroundColor: const Color(0xFF2D2D2D),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          height: 1.4,
        ),
      ),
      nicknameStyle: const TextStyle(
        color: Color(0xFF888888),
        fontSize: 12,
      ),
      timeStyle: const TextStyle(
        color: Color(0xFF888888),
        fontSize: 12,
      ),
    );
  }

  /// 根据消息方向获取配置
  BubbleConfig getConfigForDirection(bool isSender) {
    return isSender ? senderConfig : receiverConfig;
  }
}
