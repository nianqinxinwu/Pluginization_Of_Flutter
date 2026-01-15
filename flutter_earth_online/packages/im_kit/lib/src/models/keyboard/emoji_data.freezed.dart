// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emoji_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EmojiCategory _$EmojiCategoryFromJson(Map<String, dynamic> json) {
  return _EmojiCategory.fromJson(json);
}

/// @nodoc
mixin _$EmojiCategory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  List<EmojiItem> get emojis => throw _privateConstructorUsedError;
  bool get isCustom => throw _privateConstructorUsedError;

  /// Serializes this EmojiCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmojiCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmojiCategoryCopyWith<EmojiCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmojiCategoryCopyWith<$Res> {
  factory $EmojiCategoryCopyWith(
    EmojiCategory value,
    $Res Function(EmojiCategory) then,
  ) = _$EmojiCategoryCopyWithImpl<$Res, EmojiCategory>;
  @useResult
  $Res call({
    String id,
    String name,
    String icon,
    List<EmojiItem> emojis,
    bool isCustom,
  });
}

/// @nodoc
class _$EmojiCategoryCopyWithImpl<$Res, $Val extends EmojiCategory>
    implements $EmojiCategoryCopyWith<$Res> {
  _$EmojiCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmojiCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? emojis = null,
    Object? isCustom = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String,
            emojis: null == emojis
                ? _value.emojis
                : emojis // ignore: cast_nullable_to_non_nullable
                      as List<EmojiItem>,
            isCustom: null == isCustom
                ? _value.isCustom
                : isCustom // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmojiCategoryImplCopyWith<$Res>
    implements $EmojiCategoryCopyWith<$Res> {
  factory _$$EmojiCategoryImplCopyWith(
    _$EmojiCategoryImpl value,
    $Res Function(_$EmojiCategoryImpl) then,
  ) = __$$EmojiCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String icon,
    List<EmojiItem> emojis,
    bool isCustom,
  });
}

/// @nodoc
class __$$EmojiCategoryImplCopyWithImpl<$Res>
    extends _$EmojiCategoryCopyWithImpl<$Res, _$EmojiCategoryImpl>
    implements _$$EmojiCategoryImplCopyWith<$Res> {
  __$$EmojiCategoryImplCopyWithImpl(
    _$EmojiCategoryImpl _value,
    $Res Function(_$EmojiCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmojiCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? emojis = null,
    Object? isCustom = null,
  }) {
    return _then(
      _$EmojiCategoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
        emojis: null == emojis
            ? _value._emojis
            : emojis // ignore: cast_nullable_to_non_nullable
                  as List<EmojiItem>,
        isCustom: null == isCustom
            ? _value.isCustom
            : isCustom // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmojiCategoryImpl extends _EmojiCategory {
  const _$EmojiCategoryImpl({
    required this.id,
    required this.name,
    required this.icon,
    required final List<EmojiItem> emojis,
    this.isCustom = false,
  }) : _emojis = emojis,
       super._();

  factory _$EmojiCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmojiCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String icon;
  final List<EmojiItem> _emojis;
  @override
  List<EmojiItem> get emojis {
    if (_emojis is EqualUnmodifiableListView) return _emojis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emojis);
  }

  @override
  @JsonKey()
  final bool isCustom;

  @override
  String toString() {
    return 'EmojiCategory(id: $id, name: $name, icon: $icon, emojis: $emojis, isCustom: $isCustom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmojiCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality().equals(other._emojis, _emojis) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    icon,
    const DeepCollectionEquality().hash(_emojis),
    isCustom,
  );

  /// Create a copy of EmojiCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmojiCategoryImplCopyWith<_$EmojiCategoryImpl> get copyWith =>
      __$$EmojiCategoryImplCopyWithImpl<_$EmojiCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmojiCategoryImplToJson(this);
  }
}

abstract class _EmojiCategory extends EmojiCategory {
  const factory _EmojiCategory({
    required final String id,
    required final String name,
    required final String icon,
    required final List<EmojiItem> emojis,
    final bool isCustom,
  }) = _$EmojiCategoryImpl;
  const _EmojiCategory._() : super._();

  factory _EmojiCategory.fromJson(Map<String, dynamic> json) =
      _$EmojiCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get icon;
  @override
  List<EmojiItem> get emojis;
  @override
  bool get isCustom;

  /// Create a copy of EmojiCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmojiCategoryImplCopyWith<_$EmojiCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmojiItem _$EmojiItemFromJson(Map<String, dynamic> json) {
  return _EmojiItem.fromJson(json);
}

/// @nodoc
mixin _$EmojiItem {
  String get code => throw _privateConstructorUsedError; // 表情编码/标识
  String get emoji =>
      throw _privateConstructorUsedError; // 表情内容 (Unicode 或自定义图片路径)
  String? get name => throw _privateConstructorUsedError; // 表情名称
  bool get isCustom => throw _privateConstructorUsedError; // 是否自定义表情
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this EmojiItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmojiItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmojiItemCopyWith<EmojiItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmojiItemCopyWith<$Res> {
  factory $EmojiItemCopyWith(EmojiItem value, $Res Function(EmojiItem) then) =
      _$EmojiItemCopyWithImpl<$Res, EmojiItem>;
  @useResult
  $Res call({
    String code,
    String emoji,
    String? name,
    bool isCustom,
    String? imageUrl,
  });
}

/// @nodoc
class _$EmojiItemCopyWithImpl<$Res, $Val extends EmojiItem>
    implements $EmojiItemCopyWith<$Res> {
  _$EmojiItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmojiItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? emoji = null,
    Object? name = freezed,
    Object? isCustom = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            emoji: null == emoji
                ? _value.emoji
                : emoji // ignore: cast_nullable_to_non_nullable
                      as String,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            isCustom: null == isCustom
                ? _value.isCustom
                : isCustom // ignore: cast_nullable_to_non_nullable
                      as bool,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmojiItemImplCopyWith<$Res>
    implements $EmojiItemCopyWith<$Res> {
  factory _$$EmojiItemImplCopyWith(
    _$EmojiItemImpl value,
    $Res Function(_$EmojiItemImpl) then,
  ) = __$$EmojiItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    String emoji,
    String? name,
    bool isCustom,
    String? imageUrl,
  });
}

/// @nodoc
class __$$EmojiItemImplCopyWithImpl<$Res>
    extends _$EmojiItemCopyWithImpl<$Res, _$EmojiItemImpl>
    implements _$$EmojiItemImplCopyWith<$Res> {
  __$$EmojiItemImplCopyWithImpl(
    _$EmojiItemImpl _value,
    $Res Function(_$EmojiItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmojiItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? emoji = null,
    Object? name = freezed,
    Object? isCustom = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$EmojiItemImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        emoji: null == emoji
            ? _value.emoji
            : emoji // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        isCustom: null == isCustom
            ? _value.isCustom
            : isCustom // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmojiItemImpl extends _EmojiItem {
  const _$EmojiItemImpl({
    required this.code,
    required this.emoji,
    this.name,
    this.isCustom = false,
    this.imageUrl,
  }) : super._();

  factory _$EmojiItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmojiItemImplFromJson(json);

  @override
  final String code;
  // 表情编码/标识
  @override
  final String emoji;
  // 表情内容 (Unicode 或自定义图片路径)
  @override
  final String? name;
  // 表情名称
  @override
  @JsonKey()
  final bool isCustom;
  // 是否自定义表情
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'EmojiItem(code: $code, emoji: $emoji, name: $name, isCustom: $isCustom, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmojiItemImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, emoji, name, isCustom, imageUrl);

  /// Create a copy of EmojiItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmojiItemImplCopyWith<_$EmojiItemImpl> get copyWith =>
      __$$EmojiItemImplCopyWithImpl<_$EmojiItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmojiItemImplToJson(this);
  }
}

abstract class _EmojiItem extends EmojiItem {
  const factory _EmojiItem({
    required final String code,
    required final String emoji,
    final String? name,
    final bool isCustom,
    final String? imageUrl,
  }) = _$EmojiItemImpl;
  const _EmojiItem._() : super._();

  factory _EmojiItem.fromJson(Map<String, dynamic> json) =
      _$EmojiItemImpl.fromJson;

  @override
  String get code; // 表情编码/标识
  @override
  String get emoji; // 表情内容 (Unicode 或自定义图片路径)
  @override
  String? get name; // 表情名称
  @override
  bool get isCustom; // 是否自定义表情
  @override
  String? get imageUrl;

  /// Create a copy of EmojiItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmojiItemImplCopyWith<_$EmojiItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentEmojis _$RecentEmojisFromJson(Map<String, dynamic> json) {
  return _RecentEmojis.fromJson(json);
}

/// @nodoc
mixin _$RecentEmojis {
  List<EmojiItem> get emojis => throw _privateConstructorUsedError;
  int get maxCount => throw _privateConstructorUsedError;

  /// Serializes this RecentEmojis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentEmojis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentEmojisCopyWith<RecentEmojis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentEmojisCopyWith<$Res> {
  factory $RecentEmojisCopyWith(
    RecentEmojis value,
    $Res Function(RecentEmojis) then,
  ) = _$RecentEmojisCopyWithImpl<$Res, RecentEmojis>;
  @useResult
  $Res call({List<EmojiItem> emojis, int maxCount});
}

/// @nodoc
class _$RecentEmojisCopyWithImpl<$Res, $Val extends RecentEmojis>
    implements $RecentEmojisCopyWith<$Res> {
  _$RecentEmojisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentEmojis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? emojis = null, Object? maxCount = null}) {
    return _then(
      _value.copyWith(
            emojis: null == emojis
                ? _value.emojis
                : emojis // ignore: cast_nullable_to_non_nullable
                      as List<EmojiItem>,
            maxCount: null == maxCount
                ? _value.maxCount
                : maxCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecentEmojisImplCopyWith<$Res>
    implements $RecentEmojisCopyWith<$Res> {
  factory _$$RecentEmojisImplCopyWith(
    _$RecentEmojisImpl value,
    $Res Function(_$RecentEmojisImpl) then,
  ) = __$$RecentEmojisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EmojiItem> emojis, int maxCount});
}

/// @nodoc
class __$$RecentEmojisImplCopyWithImpl<$Res>
    extends _$RecentEmojisCopyWithImpl<$Res, _$RecentEmojisImpl>
    implements _$$RecentEmojisImplCopyWith<$Res> {
  __$$RecentEmojisImplCopyWithImpl(
    _$RecentEmojisImpl _value,
    $Res Function(_$RecentEmojisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecentEmojis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? emojis = null, Object? maxCount = null}) {
    return _then(
      _$RecentEmojisImpl(
        emojis: null == emojis
            ? _value._emojis
            : emojis // ignore: cast_nullable_to_non_nullable
                  as List<EmojiItem>,
        maxCount: null == maxCount
            ? _value.maxCount
            : maxCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentEmojisImpl extends _RecentEmojis {
  const _$RecentEmojisImpl({
    final List<EmojiItem> emojis = const [],
    this.maxCount = 20,
  }) : _emojis = emojis,
       super._();

  factory _$RecentEmojisImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentEmojisImplFromJson(json);

  final List<EmojiItem> _emojis;
  @override
  @JsonKey()
  List<EmojiItem> get emojis {
    if (_emojis is EqualUnmodifiableListView) return _emojis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emojis);
  }

  @override
  @JsonKey()
  final int maxCount;

  @override
  String toString() {
    return 'RecentEmojis(emojis: $emojis, maxCount: $maxCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentEmojisImpl &&
            const DeepCollectionEquality().equals(other._emojis, _emojis) &&
            (identical(other.maxCount, maxCount) ||
                other.maxCount == maxCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_emojis),
    maxCount,
  );

  /// Create a copy of RecentEmojis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentEmojisImplCopyWith<_$RecentEmojisImpl> get copyWith =>
      __$$RecentEmojisImplCopyWithImpl<_$RecentEmojisImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentEmojisImplToJson(this);
  }
}

abstract class _RecentEmojis extends RecentEmojis {
  const factory _RecentEmojis({
    final List<EmojiItem> emojis,
    final int maxCount,
  }) = _$RecentEmojisImpl;
  const _RecentEmojis._() : super._();

  factory _RecentEmojis.fromJson(Map<String, dynamic> json) =
      _$RecentEmojisImpl.fromJson;

  @override
  List<EmojiItem> get emojis;
  @override
  int get maxCount;

  /// Create a copy of RecentEmojis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentEmojisImplCopyWith<_$RecentEmojisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
