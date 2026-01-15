// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bubble_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BubbleConfig {
  // 背景配置
  BubbleBackgroundType get backgroundType => throw _privateConstructorUsedError;
  Color? get backgroundColor => throw _privateConstructorUsedError;
  List<Color>? get gradientColors => throw _privateConstructorUsedError;
  Alignment get gradientBegin => throw _privateConstructorUsedError;
  Alignment get gradientEnd => throw _privateConstructorUsedError;
  String? get backgroundImage => throw _privateConstructorUsedError; // 形状配置
  double get borderRadius => throw _privateConstructorUsedError;
  double get arrowSize => throw _privateConstructorUsedError;
  bool get showArrow => throw _privateConstructorUsedError;
  BubbleArrowPosition get arrowPosition =>
      throw _privateConstructorUsedError; // 内边距
  EdgeInsets get contentPadding => throw _privateConstructorUsedError; // 文字样式
  TextStyle? get textStyle => throw _privateConstructorUsedError; // 边框
  Color? get borderColor => throw _privateConstructorUsedError;
  double get borderWidth => throw _privateConstructorUsedError; // 阴影
  bool get showShadow => throw _privateConstructorUsedError;
  BoxShadow? get shadow =>
      throw _privateConstructorUsedError; // 最大宽度比例 (相对于屏幕宽度)
  double get maxWidthRatio => throw _privateConstructorUsedError; // 最小宽度
  double get minWidth => throw _privateConstructorUsedError;

  /// Create a copy of BubbleConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BubbleConfigCopyWith<BubbleConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BubbleConfigCopyWith<$Res> {
  factory $BubbleConfigCopyWith(
    BubbleConfig value,
    $Res Function(BubbleConfig) then,
  ) = _$BubbleConfigCopyWithImpl<$Res, BubbleConfig>;
  @useResult
  $Res call({
    BubbleBackgroundType backgroundType,
    Color? backgroundColor,
    List<Color>? gradientColors,
    Alignment gradientBegin,
    Alignment gradientEnd,
    String? backgroundImage,
    double borderRadius,
    double arrowSize,
    bool showArrow,
    BubbleArrowPosition arrowPosition,
    EdgeInsets contentPadding,
    TextStyle? textStyle,
    Color? borderColor,
    double borderWidth,
    bool showShadow,
    BoxShadow? shadow,
    double maxWidthRatio,
    double minWidth,
  });
}

/// @nodoc
class _$BubbleConfigCopyWithImpl<$Res, $Val extends BubbleConfig>
    implements $BubbleConfigCopyWith<$Res> {
  _$BubbleConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BubbleConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundType = null,
    Object? backgroundColor = freezed,
    Object? gradientColors = freezed,
    Object? gradientBegin = null,
    Object? gradientEnd = null,
    Object? backgroundImage = freezed,
    Object? borderRadius = null,
    Object? arrowSize = null,
    Object? showArrow = null,
    Object? arrowPosition = null,
    Object? contentPadding = null,
    Object? textStyle = freezed,
    Object? borderColor = freezed,
    Object? borderWidth = null,
    Object? showShadow = null,
    Object? shadow = freezed,
    Object? maxWidthRatio = null,
    Object? minWidth = null,
  }) {
    return _then(
      _value.copyWith(
            backgroundType: null == backgroundType
                ? _value.backgroundType
                : backgroundType // ignore: cast_nullable_to_non_nullable
                      as BubbleBackgroundType,
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            gradientColors: freezed == gradientColors
                ? _value.gradientColors
                : gradientColors // ignore: cast_nullable_to_non_nullable
                      as List<Color>?,
            gradientBegin: null == gradientBegin
                ? _value.gradientBegin
                : gradientBegin // ignore: cast_nullable_to_non_nullable
                      as Alignment,
            gradientEnd: null == gradientEnd
                ? _value.gradientEnd
                : gradientEnd // ignore: cast_nullable_to_non_nullable
                      as Alignment,
            backgroundImage: freezed == backgroundImage
                ? _value.backgroundImage
                : backgroundImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            borderRadius: null == borderRadius
                ? _value.borderRadius
                : borderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            arrowSize: null == arrowSize
                ? _value.arrowSize
                : arrowSize // ignore: cast_nullable_to_non_nullable
                      as double,
            showArrow: null == showArrow
                ? _value.showArrow
                : showArrow // ignore: cast_nullable_to_non_nullable
                      as bool,
            arrowPosition: null == arrowPosition
                ? _value.arrowPosition
                : arrowPosition // ignore: cast_nullable_to_non_nullable
                      as BubbleArrowPosition,
            contentPadding: null == contentPadding
                ? _value.contentPadding
                : contentPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            textStyle: freezed == textStyle
                ? _value.textStyle
                : textStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderWidth: null == borderWidth
                ? _value.borderWidth
                : borderWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            showShadow: null == showShadow
                ? _value.showShadow
                : showShadow // ignore: cast_nullable_to_non_nullable
                      as bool,
            shadow: freezed == shadow
                ? _value.shadow
                : shadow // ignore: cast_nullable_to_non_nullable
                      as BoxShadow?,
            maxWidthRatio: null == maxWidthRatio
                ? _value.maxWidthRatio
                : maxWidthRatio // ignore: cast_nullable_to_non_nullable
                      as double,
            minWidth: null == minWidth
                ? _value.minWidth
                : minWidth // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BubbleConfigImplCopyWith<$Res>
    implements $BubbleConfigCopyWith<$Res> {
  factory _$$BubbleConfigImplCopyWith(
    _$BubbleConfigImpl value,
    $Res Function(_$BubbleConfigImpl) then,
  ) = __$$BubbleConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BubbleBackgroundType backgroundType,
    Color? backgroundColor,
    List<Color>? gradientColors,
    Alignment gradientBegin,
    Alignment gradientEnd,
    String? backgroundImage,
    double borderRadius,
    double arrowSize,
    bool showArrow,
    BubbleArrowPosition arrowPosition,
    EdgeInsets contentPadding,
    TextStyle? textStyle,
    Color? borderColor,
    double borderWidth,
    bool showShadow,
    BoxShadow? shadow,
    double maxWidthRatio,
    double minWidth,
  });
}

/// @nodoc
class __$$BubbleConfigImplCopyWithImpl<$Res>
    extends _$BubbleConfigCopyWithImpl<$Res, _$BubbleConfigImpl>
    implements _$$BubbleConfigImplCopyWith<$Res> {
  __$$BubbleConfigImplCopyWithImpl(
    _$BubbleConfigImpl _value,
    $Res Function(_$BubbleConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BubbleConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundType = null,
    Object? backgroundColor = freezed,
    Object? gradientColors = freezed,
    Object? gradientBegin = null,
    Object? gradientEnd = null,
    Object? backgroundImage = freezed,
    Object? borderRadius = null,
    Object? arrowSize = null,
    Object? showArrow = null,
    Object? arrowPosition = null,
    Object? contentPadding = null,
    Object? textStyle = freezed,
    Object? borderColor = freezed,
    Object? borderWidth = null,
    Object? showShadow = null,
    Object? shadow = freezed,
    Object? maxWidthRatio = null,
    Object? minWidth = null,
  }) {
    return _then(
      _$BubbleConfigImpl(
        backgroundType: null == backgroundType
            ? _value.backgroundType
            : backgroundType // ignore: cast_nullable_to_non_nullable
                  as BubbleBackgroundType,
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        gradientColors: freezed == gradientColors
            ? _value._gradientColors
            : gradientColors // ignore: cast_nullable_to_non_nullable
                  as List<Color>?,
        gradientBegin: null == gradientBegin
            ? _value.gradientBegin
            : gradientBegin // ignore: cast_nullable_to_non_nullable
                  as Alignment,
        gradientEnd: null == gradientEnd
            ? _value.gradientEnd
            : gradientEnd // ignore: cast_nullable_to_non_nullable
                  as Alignment,
        backgroundImage: freezed == backgroundImage
            ? _value.backgroundImage
            : backgroundImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        borderRadius: null == borderRadius
            ? _value.borderRadius
            : borderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        arrowSize: null == arrowSize
            ? _value.arrowSize
            : arrowSize // ignore: cast_nullable_to_non_nullable
                  as double,
        showArrow: null == showArrow
            ? _value.showArrow
            : showArrow // ignore: cast_nullable_to_non_nullable
                  as bool,
        arrowPosition: null == arrowPosition
            ? _value.arrowPosition
            : arrowPosition // ignore: cast_nullable_to_non_nullable
                  as BubbleArrowPosition,
        contentPadding: null == contentPadding
            ? _value.contentPadding
            : contentPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        textStyle: freezed == textStyle
            ? _value.textStyle
            : textStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderWidth: null == borderWidth
            ? _value.borderWidth
            : borderWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        showShadow: null == showShadow
            ? _value.showShadow
            : showShadow // ignore: cast_nullable_to_non_nullable
                  as bool,
        shadow: freezed == shadow
            ? _value.shadow
            : shadow // ignore: cast_nullable_to_non_nullable
                  as BoxShadow?,
        maxWidthRatio: null == maxWidthRatio
            ? _value.maxWidthRatio
            : maxWidthRatio // ignore: cast_nullable_to_non_nullable
                  as double,
        minWidth: null == minWidth
            ? _value.minWidth
            : minWidth // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$BubbleConfigImpl extends _BubbleConfig {
  const _$BubbleConfigImpl({
    this.backgroundType = BubbleBackgroundType.solid,
    this.backgroundColor,
    final List<Color>? gradientColors,
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
    this.backgroundImage,
    this.borderRadius = 12.0,
    this.arrowSize = 6.0,
    this.showArrow = true,
    this.arrowPosition = BubbleArrowPosition.left,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 10,
    ),
    this.textStyle,
    this.borderColor,
    this.borderWidth = 0.0,
    this.showShadow = false,
    this.shadow,
    this.maxWidthRatio = 0.7,
    this.minWidth = 60.0,
  }) : _gradientColors = gradientColors,
       super._();

  // 背景配置
  @override
  @JsonKey()
  final BubbleBackgroundType backgroundType;
  @override
  final Color? backgroundColor;
  final List<Color>? _gradientColors;
  @override
  List<Color>? get gradientColors {
    final value = _gradientColors;
    if (value == null) return null;
    if (_gradientColors is EqualUnmodifiableListView) return _gradientColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final Alignment gradientBegin;
  @override
  @JsonKey()
  final Alignment gradientEnd;
  @override
  final String? backgroundImage;
  // 形状配置
  @override
  @JsonKey()
  final double borderRadius;
  @override
  @JsonKey()
  final double arrowSize;
  @override
  @JsonKey()
  final bool showArrow;
  @override
  @JsonKey()
  final BubbleArrowPosition arrowPosition;
  // 内边距
  @override
  @JsonKey()
  final EdgeInsets contentPadding;
  // 文字样式
  @override
  final TextStyle? textStyle;
  // 边框
  @override
  final Color? borderColor;
  @override
  @JsonKey()
  final double borderWidth;
  // 阴影
  @override
  @JsonKey()
  final bool showShadow;
  @override
  final BoxShadow? shadow;
  // 最大宽度比例 (相对于屏幕宽度)
  @override
  @JsonKey()
  final double maxWidthRatio;
  // 最小宽度
  @override
  @JsonKey()
  final double minWidth;

  @override
  String toString() {
    return 'BubbleConfig(backgroundType: $backgroundType, backgroundColor: $backgroundColor, gradientColors: $gradientColors, gradientBegin: $gradientBegin, gradientEnd: $gradientEnd, backgroundImage: $backgroundImage, borderRadius: $borderRadius, arrowSize: $arrowSize, showArrow: $showArrow, arrowPosition: $arrowPosition, contentPadding: $contentPadding, textStyle: $textStyle, borderColor: $borderColor, borderWidth: $borderWidth, showShadow: $showShadow, shadow: $shadow, maxWidthRatio: $maxWidthRatio, minWidth: $minWidth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BubbleConfigImpl &&
            (identical(other.backgroundType, backgroundType) ||
                other.backgroundType == backgroundType) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            const DeepCollectionEquality().equals(
              other._gradientColors,
              _gradientColors,
            ) &&
            (identical(other.gradientBegin, gradientBegin) ||
                other.gradientBegin == gradientBegin) &&
            (identical(other.gradientEnd, gradientEnd) ||
                other.gradientEnd == gradientEnd) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.arrowSize, arrowSize) ||
                other.arrowSize == arrowSize) &&
            (identical(other.showArrow, showArrow) ||
                other.showArrow == showArrow) &&
            (identical(other.arrowPosition, arrowPosition) ||
                other.arrowPosition == arrowPosition) &&
            (identical(other.contentPadding, contentPadding) ||
                other.contentPadding == contentPadding) &&
            (identical(other.textStyle, textStyle) ||
                other.textStyle == textStyle) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.borderWidth, borderWidth) ||
                other.borderWidth == borderWidth) &&
            (identical(other.showShadow, showShadow) ||
                other.showShadow == showShadow) &&
            (identical(other.shadow, shadow) || other.shadow == shadow) &&
            (identical(other.maxWidthRatio, maxWidthRatio) ||
                other.maxWidthRatio == maxWidthRatio) &&
            (identical(other.minWidth, minWidth) ||
                other.minWidth == minWidth));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backgroundType,
    backgroundColor,
    const DeepCollectionEquality().hash(_gradientColors),
    gradientBegin,
    gradientEnd,
    backgroundImage,
    borderRadius,
    arrowSize,
    showArrow,
    arrowPosition,
    contentPadding,
    textStyle,
    borderColor,
    borderWidth,
    showShadow,
    shadow,
    maxWidthRatio,
    minWidth,
  );

  /// Create a copy of BubbleConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BubbleConfigImplCopyWith<_$BubbleConfigImpl> get copyWith =>
      __$$BubbleConfigImplCopyWithImpl<_$BubbleConfigImpl>(this, _$identity);
}

abstract class _BubbleConfig extends BubbleConfig {
  const factory _BubbleConfig({
    final BubbleBackgroundType backgroundType,
    final Color? backgroundColor,
    final List<Color>? gradientColors,
    final Alignment gradientBegin,
    final Alignment gradientEnd,
    final String? backgroundImage,
    final double borderRadius,
    final double arrowSize,
    final bool showArrow,
    final BubbleArrowPosition arrowPosition,
    final EdgeInsets contentPadding,
    final TextStyle? textStyle,
    final Color? borderColor,
    final double borderWidth,
    final bool showShadow,
    final BoxShadow? shadow,
    final double maxWidthRatio,
    final double minWidth,
  }) = _$BubbleConfigImpl;
  const _BubbleConfig._() : super._();

  // 背景配置
  @override
  BubbleBackgroundType get backgroundType;
  @override
  Color? get backgroundColor;
  @override
  List<Color>? get gradientColors;
  @override
  Alignment get gradientBegin;
  @override
  Alignment get gradientEnd;
  @override
  String? get backgroundImage; // 形状配置
  @override
  double get borderRadius;
  @override
  double get arrowSize;
  @override
  bool get showArrow;
  @override
  BubbleArrowPosition get arrowPosition; // 内边距
  @override
  EdgeInsets get contentPadding; // 文字样式
  @override
  TextStyle? get textStyle; // 边框
  @override
  Color? get borderColor;
  @override
  double get borderWidth; // 阴影
  @override
  bool get showShadow;
  @override
  BoxShadow? get shadow; // 最大宽度比例 (相对于屏幕宽度)
  @override
  double get maxWidthRatio; // 最小宽度
  @override
  double get minWidth;

  /// Create a copy of BubbleConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BubbleConfigImplCopyWith<_$BubbleConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BubbleTheme {
  BubbleConfig get senderConfig => throw _privateConstructorUsedError;
  BubbleConfig get receiverConfig => throw _privateConstructorUsedError; // 消息间距
  double get messageSpacing => throw _privateConstructorUsedError; // 头像配置
  double get avatarSize => throw _privateConstructorUsedError;
  double get avatarSpacing => throw _privateConstructorUsedError;
  bool get showAvatar => throw _privateConstructorUsedError;
  double get avatarBorderRadius => throw _privateConstructorUsedError; // 昵称配置
  bool get showNickname => throw _privateConstructorUsedError;
  TextStyle? get nicknameStyle => throw _privateConstructorUsedError; // 时间配置
  TextStyle? get timeStyle => throw _privateConstructorUsedError;
  int get timeDividerIntervalMinutes =>
      throw _privateConstructorUsedError; // 消息状态配置
  bool get showMessageStatus => throw _privateConstructorUsedError;
  double get statusIconSize => throw _privateConstructorUsedError;
  Color? get statusIconColor => throw _privateConstructorUsedError;

  /// Create a copy of BubbleTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BubbleThemeCopyWith<BubbleTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BubbleThemeCopyWith<$Res> {
  factory $BubbleThemeCopyWith(
    BubbleTheme value,
    $Res Function(BubbleTheme) then,
  ) = _$BubbleThemeCopyWithImpl<$Res, BubbleTheme>;
  @useResult
  $Res call({
    BubbleConfig senderConfig,
    BubbleConfig receiverConfig,
    double messageSpacing,
    double avatarSize,
    double avatarSpacing,
    bool showAvatar,
    double avatarBorderRadius,
    bool showNickname,
    TextStyle? nicknameStyle,
    TextStyle? timeStyle,
    int timeDividerIntervalMinutes,
    bool showMessageStatus,
    double statusIconSize,
    Color? statusIconColor,
  });

  $BubbleConfigCopyWith<$Res> get senderConfig;
  $BubbleConfigCopyWith<$Res> get receiverConfig;
}

/// @nodoc
class _$BubbleThemeCopyWithImpl<$Res, $Val extends BubbleTheme>
    implements $BubbleThemeCopyWith<$Res> {
  _$BubbleThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BubbleTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderConfig = null,
    Object? receiverConfig = null,
    Object? messageSpacing = null,
    Object? avatarSize = null,
    Object? avatarSpacing = null,
    Object? showAvatar = null,
    Object? avatarBorderRadius = null,
    Object? showNickname = null,
    Object? nicknameStyle = freezed,
    Object? timeStyle = freezed,
    Object? timeDividerIntervalMinutes = null,
    Object? showMessageStatus = null,
    Object? statusIconSize = null,
    Object? statusIconColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            senderConfig: null == senderConfig
                ? _value.senderConfig
                : senderConfig // ignore: cast_nullable_to_non_nullable
                      as BubbleConfig,
            receiverConfig: null == receiverConfig
                ? _value.receiverConfig
                : receiverConfig // ignore: cast_nullable_to_non_nullable
                      as BubbleConfig,
            messageSpacing: null == messageSpacing
                ? _value.messageSpacing
                : messageSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            avatarSize: null == avatarSize
                ? _value.avatarSize
                : avatarSize // ignore: cast_nullable_to_non_nullable
                      as double,
            avatarSpacing: null == avatarSpacing
                ? _value.avatarSpacing
                : avatarSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            showAvatar: null == showAvatar
                ? _value.showAvatar
                : showAvatar // ignore: cast_nullable_to_non_nullable
                      as bool,
            avatarBorderRadius: null == avatarBorderRadius
                ? _value.avatarBorderRadius
                : avatarBorderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            showNickname: null == showNickname
                ? _value.showNickname
                : showNickname // ignore: cast_nullable_to_non_nullable
                      as bool,
            nicknameStyle: freezed == nicknameStyle
                ? _value.nicknameStyle
                : nicknameStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            timeStyle: freezed == timeStyle
                ? _value.timeStyle
                : timeStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            timeDividerIntervalMinutes: null == timeDividerIntervalMinutes
                ? _value.timeDividerIntervalMinutes
                : timeDividerIntervalMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            showMessageStatus: null == showMessageStatus
                ? _value.showMessageStatus
                : showMessageStatus // ignore: cast_nullable_to_non_nullable
                      as bool,
            statusIconSize: null == statusIconSize
                ? _value.statusIconSize
                : statusIconSize // ignore: cast_nullable_to_non_nullable
                      as double,
            statusIconColor: freezed == statusIconColor
                ? _value.statusIconColor
                : statusIconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }

  /// Create a copy of BubbleTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BubbleConfigCopyWith<$Res> get senderConfig {
    return $BubbleConfigCopyWith<$Res>(_value.senderConfig, (value) {
      return _then(_value.copyWith(senderConfig: value) as $Val);
    });
  }

  /// Create a copy of BubbleTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BubbleConfigCopyWith<$Res> get receiverConfig {
    return $BubbleConfigCopyWith<$Res>(_value.receiverConfig, (value) {
      return _then(_value.copyWith(receiverConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BubbleThemeImplCopyWith<$Res>
    implements $BubbleThemeCopyWith<$Res> {
  factory _$$BubbleThemeImplCopyWith(
    _$BubbleThemeImpl value,
    $Res Function(_$BubbleThemeImpl) then,
  ) = __$$BubbleThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BubbleConfig senderConfig,
    BubbleConfig receiverConfig,
    double messageSpacing,
    double avatarSize,
    double avatarSpacing,
    bool showAvatar,
    double avatarBorderRadius,
    bool showNickname,
    TextStyle? nicknameStyle,
    TextStyle? timeStyle,
    int timeDividerIntervalMinutes,
    bool showMessageStatus,
    double statusIconSize,
    Color? statusIconColor,
  });

  @override
  $BubbleConfigCopyWith<$Res> get senderConfig;
  @override
  $BubbleConfigCopyWith<$Res> get receiverConfig;
}

/// @nodoc
class __$$BubbleThemeImplCopyWithImpl<$Res>
    extends _$BubbleThemeCopyWithImpl<$Res, _$BubbleThemeImpl>
    implements _$$BubbleThemeImplCopyWith<$Res> {
  __$$BubbleThemeImplCopyWithImpl(
    _$BubbleThemeImpl _value,
    $Res Function(_$BubbleThemeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BubbleTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderConfig = null,
    Object? receiverConfig = null,
    Object? messageSpacing = null,
    Object? avatarSize = null,
    Object? avatarSpacing = null,
    Object? showAvatar = null,
    Object? avatarBorderRadius = null,
    Object? showNickname = null,
    Object? nicknameStyle = freezed,
    Object? timeStyle = freezed,
    Object? timeDividerIntervalMinutes = null,
    Object? showMessageStatus = null,
    Object? statusIconSize = null,
    Object? statusIconColor = freezed,
  }) {
    return _then(
      _$BubbleThemeImpl(
        senderConfig: null == senderConfig
            ? _value.senderConfig
            : senderConfig // ignore: cast_nullable_to_non_nullable
                  as BubbleConfig,
        receiverConfig: null == receiverConfig
            ? _value.receiverConfig
            : receiverConfig // ignore: cast_nullable_to_non_nullable
                  as BubbleConfig,
        messageSpacing: null == messageSpacing
            ? _value.messageSpacing
            : messageSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        avatarSize: null == avatarSize
            ? _value.avatarSize
            : avatarSize // ignore: cast_nullable_to_non_nullable
                  as double,
        avatarSpacing: null == avatarSpacing
            ? _value.avatarSpacing
            : avatarSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        showAvatar: null == showAvatar
            ? _value.showAvatar
            : showAvatar // ignore: cast_nullable_to_non_nullable
                  as bool,
        avatarBorderRadius: null == avatarBorderRadius
            ? _value.avatarBorderRadius
            : avatarBorderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        showNickname: null == showNickname
            ? _value.showNickname
            : showNickname // ignore: cast_nullable_to_non_nullable
                  as bool,
        nicknameStyle: freezed == nicknameStyle
            ? _value.nicknameStyle
            : nicknameStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        timeStyle: freezed == timeStyle
            ? _value.timeStyle
            : timeStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        timeDividerIntervalMinutes: null == timeDividerIntervalMinutes
            ? _value.timeDividerIntervalMinutes
            : timeDividerIntervalMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        showMessageStatus: null == showMessageStatus
            ? _value.showMessageStatus
            : showMessageStatus // ignore: cast_nullable_to_non_nullable
                  as bool,
        statusIconSize: null == statusIconSize
            ? _value.statusIconSize
            : statusIconSize // ignore: cast_nullable_to_non_nullable
                  as double,
        statusIconColor: freezed == statusIconColor
            ? _value.statusIconColor
            : statusIconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$BubbleThemeImpl extends _BubbleTheme {
  const _$BubbleThemeImpl({
    required this.senderConfig,
    required this.receiverConfig,
    this.messageSpacing = 8.0,
    this.avatarSize = 40.0,
    this.avatarSpacing = 8.0,
    this.showAvatar = true,
    this.avatarBorderRadius = 4.0,
    this.showNickname = false,
    this.nicknameStyle,
    this.timeStyle,
    this.timeDividerIntervalMinutes = 5,
    this.showMessageStatus = true,
    this.statusIconSize = 16.0,
    this.statusIconColor,
  }) : super._();

  @override
  final BubbleConfig senderConfig;
  @override
  final BubbleConfig receiverConfig;
  // 消息间距
  @override
  @JsonKey()
  final double messageSpacing;
  // 头像配置
  @override
  @JsonKey()
  final double avatarSize;
  @override
  @JsonKey()
  final double avatarSpacing;
  @override
  @JsonKey()
  final bool showAvatar;
  @override
  @JsonKey()
  final double avatarBorderRadius;
  // 昵称配置
  @override
  @JsonKey()
  final bool showNickname;
  @override
  final TextStyle? nicknameStyle;
  // 时间配置
  @override
  final TextStyle? timeStyle;
  @override
  @JsonKey()
  final int timeDividerIntervalMinutes;
  // 消息状态配置
  @override
  @JsonKey()
  final bool showMessageStatus;
  @override
  @JsonKey()
  final double statusIconSize;
  @override
  final Color? statusIconColor;

  @override
  String toString() {
    return 'BubbleTheme(senderConfig: $senderConfig, receiverConfig: $receiverConfig, messageSpacing: $messageSpacing, avatarSize: $avatarSize, avatarSpacing: $avatarSpacing, showAvatar: $showAvatar, avatarBorderRadius: $avatarBorderRadius, showNickname: $showNickname, nicknameStyle: $nicknameStyle, timeStyle: $timeStyle, timeDividerIntervalMinutes: $timeDividerIntervalMinutes, showMessageStatus: $showMessageStatus, statusIconSize: $statusIconSize, statusIconColor: $statusIconColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BubbleThemeImpl &&
            (identical(other.senderConfig, senderConfig) ||
                other.senderConfig == senderConfig) &&
            (identical(other.receiverConfig, receiverConfig) ||
                other.receiverConfig == receiverConfig) &&
            (identical(other.messageSpacing, messageSpacing) ||
                other.messageSpacing == messageSpacing) &&
            (identical(other.avatarSize, avatarSize) ||
                other.avatarSize == avatarSize) &&
            (identical(other.avatarSpacing, avatarSpacing) ||
                other.avatarSpacing == avatarSpacing) &&
            (identical(other.showAvatar, showAvatar) ||
                other.showAvatar == showAvatar) &&
            (identical(other.avatarBorderRadius, avatarBorderRadius) ||
                other.avatarBorderRadius == avatarBorderRadius) &&
            (identical(other.showNickname, showNickname) ||
                other.showNickname == showNickname) &&
            (identical(other.nicknameStyle, nicknameStyle) ||
                other.nicknameStyle == nicknameStyle) &&
            (identical(other.timeStyle, timeStyle) ||
                other.timeStyle == timeStyle) &&
            (identical(
                  other.timeDividerIntervalMinutes,
                  timeDividerIntervalMinutes,
                ) ||
                other.timeDividerIntervalMinutes ==
                    timeDividerIntervalMinutes) &&
            (identical(other.showMessageStatus, showMessageStatus) ||
                other.showMessageStatus == showMessageStatus) &&
            (identical(other.statusIconSize, statusIconSize) ||
                other.statusIconSize == statusIconSize) &&
            (identical(other.statusIconColor, statusIconColor) ||
                other.statusIconColor == statusIconColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    senderConfig,
    receiverConfig,
    messageSpacing,
    avatarSize,
    avatarSpacing,
    showAvatar,
    avatarBorderRadius,
    showNickname,
    nicknameStyle,
    timeStyle,
    timeDividerIntervalMinutes,
    showMessageStatus,
    statusIconSize,
    statusIconColor,
  );

  /// Create a copy of BubbleTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BubbleThemeImplCopyWith<_$BubbleThemeImpl> get copyWith =>
      __$$BubbleThemeImplCopyWithImpl<_$BubbleThemeImpl>(this, _$identity);
}

abstract class _BubbleTheme extends BubbleTheme {
  const factory _BubbleTheme({
    required final BubbleConfig senderConfig,
    required final BubbleConfig receiverConfig,
    final double messageSpacing,
    final double avatarSize,
    final double avatarSpacing,
    final bool showAvatar,
    final double avatarBorderRadius,
    final bool showNickname,
    final TextStyle? nicknameStyle,
    final TextStyle? timeStyle,
    final int timeDividerIntervalMinutes,
    final bool showMessageStatus,
    final double statusIconSize,
    final Color? statusIconColor,
  }) = _$BubbleThemeImpl;
  const _BubbleTheme._() : super._();

  @override
  BubbleConfig get senderConfig;
  @override
  BubbleConfig get receiverConfig; // 消息间距
  @override
  double get messageSpacing; // 头像配置
  @override
  double get avatarSize;
  @override
  double get avatarSpacing;
  @override
  bool get showAvatar;
  @override
  double get avatarBorderRadius; // 昵称配置
  @override
  bool get showNickname;
  @override
  TextStyle? get nicknameStyle; // 时间配置
  @override
  TextStyle? get timeStyle;
  @override
  int get timeDividerIntervalMinutes; // 消息状态配置
  @override
  bool get showMessageStatus;
  @override
  double get statusIconSize;
  @override
  Color? get statusIconColor;

  /// Create a copy of BubbleTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BubbleThemeImplCopyWith<_$BubbleThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
