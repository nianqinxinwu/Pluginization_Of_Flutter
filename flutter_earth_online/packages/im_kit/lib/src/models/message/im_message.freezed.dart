// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'im_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IMMessage _$IMMessageFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'text':
      return TextMessage.fromJson(json);
    case 'image':
      return ImageMessage.fromJson(json);
    case 'voice':
      return VoiceMessage.fromJson(json);
    case 'video':
      return VideoMessage.fromJson(json);
    case 'file':
      return FileMessage.fromJson(json);
    case 'location':
      return LocationMessage.fromJson(json);
    case 'card':
      return CardMessage.fromJson(json);
    case 'redPacket':
      return RedPacketMessage.fromJson(json);
    case 'transfer':
      return TransferMessage.fromJson(json);
    case 'forward':
      return ForwardMessage.fromJson(json);
    case 'custom':
      return CustomMessage.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'type',
        'IMMessage',
        'Invalid union type "${json['type']}"!',
      );
  }
}

/// @nodoc
mixin _$IMMessage {
  String get id => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get senderName => throw _privateConstructorUsedError;
  String? get senderAvatar => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  MessageDirection get direction => throw _privateConstructorUsedError;
  MessageStatus get status => throw _privateConstructorUsedError;
  String? get conversationId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )
    text,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    image,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )
    voice,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    video,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )
    file,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )
    location,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )
    card,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )
    redPacket,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )
    transfer,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )
    forward,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )
    custom,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextMessage value) text,
    required TResult Function(ImageMessage value) image,
    required TResult Function(VoiceMessage value) voice,
    required TResult Function(VideoMessage value) video,
    required TResult Function(FileMessage value) file,
    required TResult Function(LocationMessage value) location,
    required TResult Function(CardMessage value) card,
    required TResult Function(RedPacketMessage value) redPacket,
    required TResult Function(TransferMessage value) transfer,
    required TResult Function(ForwardMessage value) forward,
    required TResult Function(CustomMessage value) custom,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextMessage value)? text,
    TResult? Function(ImageMessage value)? image,
    TResult? Function(VoiceMessage value)? voice,
    TResult? Function(VideoMessage value)? video,
    TResult? Function(FileMessage value)? file,
    TResult? Function(LocationMessage value)? location,
    TResult? Function(CardMessage value)? card,
    TResult? Function(RedPacketMessage value)? redPacket,
    TResult? Function(TransferMessage value)? transfer,
    TResult? Function(ForwardMessage value)? forward,
    TResult? Function(CustomMessage value)? custom,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextMessage value)? text,
    TResult Function(ImageMessage value)? image,
    TResult Function(VoiceMessage value)? voice,
    TResult Function(VideoMessage value)? video,
    TResult Function(FileMessage value)? file,
    TResult Function(LocationMessage value)? location,
    TResult Function(CardMessage value)? card,
    TResult Function(RedPacketMessage value)? redPacket,
    TResult Function(TransferMessage value)? transfer,
    TResult Function(ForwardMessage value)? forward,
    TResult Function(CustomMessage value)? custom,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this IMMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IMMessageCopyWith<IMMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IMMessageCopyWith<$Res> {
  factory $IMMessageCopyWith(IMMessage value, $Res Function(IMMessage) then) =
      _$IMMessageCopyWithImpl<$Res, IMMessage>;
  @useResult
  $Res call({
    String id,
    String senderId,
    String senderName,
    String? senderAvatar,
    DateTime timestamp,
    MessageDirection direction,
    MessageStatus status,
    String? conversationId,
  });
}

/// @nodoc
class _$IMMessageCopyWithImpl<$Res, $Val extends IMMessage>
    implements $IMMessageCopyWith<$Res> {
  _$IMMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatar = freezed,
    Object? timestamp = null,
    Object? direction = null,
    Object? status = null,
    Object? conversationId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            senderId: null == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as String,
            senderName: null == senderName
                ? _value.senderName
                : senderName // ignore: cast_nullable_to_non_nullable
                      as String,
            senderAvatar: freezed == senderAvatar
                ? _value.senderAvatar
                : senderAvatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            direction: null == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as MessageDirection,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MessageStatus,
            conversationId: freezed == conversationId
                ? _value.conversationId
                : conversationId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TextMessageImplCopyWith<$Res>
    implements $IMMessageCopyWith<$Res> {
  factory _$$TextMessageImplCopyWith(
    _$TextMessageImpl value,
    $Res Function(_$TextMessageImpl) then,
  ) = __$$TextMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String senderId,
    String senderName,
    String? senderAvatar,
    DateTime timestamp,
    MessageDirection direction,
    MessageStatus status,
    String? conversationId,
    String content,
    bool isAtAll,
    List<String> atUserIds,
  });
}

/// @nodoc
class __$$TextMessageImplCopyWithImpl<$Res>
    extends _$IMMessageCopyWithImpl<$Res, _$TextMessageImpl>
    implements _$$TextMessageImplCopyWith<$Res> {
  __$$TextMessageImplCopyWithImpl(
    _$TextMessageImpl _value,
    $Res Function(_$TextMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatar = freezed,
    Object? timestamp = null,
    Object? direction = null,
    Object? status = null,
    Object? conversationId = freezed,
    Object? content = null,
    Object? isAtAll = null,
    Object? atUserIds = null,
  }) {
    return _then(
      _$TextMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        senderAvatar: freezed == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as MessageDirection,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        conversationId: freezed == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        isAtAll: null == isAtAll
            ? _value.isAtAll
            : isAtAll // ignore: cast_nullable_to_non_nullable
                  as bool,
        atUserIds: null == atUserIds
            ? _value._atUserIds
            : atUserIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TextMessageImpl extends TextMessage {
  const _$TextMessageImpl({
    required this.id,
    required this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    this.direction = MessageDirection.send,
    this.status = MessageStatus.sending,
    this.conversationId,
    required this.content,
    this.isAtAll = false,
    final List<String> atUserIds = const [],
    final String? $type,
  }) : _atUserIds = atUserIds,
       $type = $type ?? 'text',
       super._();

  factory _$TextMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderAvatar;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final MessageDirection direction;
  @override
  @JsonKey()
  final MessageStatus status;
  @override
  final String? conversationId;
  // 文本特有字段
  @override
  final String content;
  @override
  @JsonKey()
  final bool isAtAll;
  final List<String> _atUserIds;
  @override
  @JsonKey()
  List<String> get atUserIds {
    if (_atUserIds is EqualUnmodifiableListView) return _atUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_atUserIds);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IMMessage.text(id: $id, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp, direction: $direction, status: $status, conversationId: $conversationId, content: $content, isAtAll: $isAtAll, atUserIds: $atUserIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isAtAll, isAtAll) || other.isAtAll == isAtAll) &&
            const DeepCollectionEquality().equals(
              other._atUserIds,
              _atUserIds,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    senderId,
    senderName,
    senderAvatar,
    timestamp,
    direction,
    status,
    conversationId,
    content,
    isAtAll,
    const DeepCollectionEquality().hash(_atUserIds),
  );

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextMessageImplCopyWith<_$TextMessageImpl> get copyWith =>
      __$$TextMessageImplCopyWithImpl<_$TextMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )
    text,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    image,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )
    voice,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    video,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )
    file,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )
    location,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )
    card,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )
    redPacket,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )
    transfer,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )
    forward,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )
    custom,
  }) {
    return text(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      content,
      isAtAll,
      atUserIds,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
  }) {
    return text?.call(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      content,
      isAtAll,
      atUserIds,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(
        id,
        senderId,
        senderName,
        senderAvatar,
        timestamp,
        direction,
        status,
        conversationId,
        content,
        isAtAll,
        atUserIds,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextMessage value) text,
    required TResult Function(ImageMessage value) image,
    required TResult Function(VoiceMessage value) voice,
    required TResult Function(VideoMessage value) video,
    required TResult Function(FileMessage value) file,
    required TResult Function(LocationMessage value) location,
    required TResult Function(CardMessage value) card,
    required TResult Function(RedPacketMessage value) redPacket,
    required TResult Function(TransferMessage value) transfer,
    required TResult Function(ForwardMessage value) forward,
    required TResult Function(CustomMessage value) custom,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextMessage value)? text,
    TResult? Function(ImageMessage value)? image,
    TResult? Function(VoiceMessage value)? voice,
    TResult? Function(VideoMessage value)? video,
    TResult? Function(FileMessage value)? file,
    TResult? Function(LocationMessage value)? location,
    TResult? Function(CardMessage value)? card,
    TResult? Function(RedPacketMessage value)? redPacket,
    TResult? Function(TransferMessage value)? transfer,
    TResult? Function(ForwardMessage value)? forward,
    TResult? Function(CustomMessage value)? custom,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextMessage value)? text,
    TResult Function(ImageMessage value)? image,
    TResult Function(VoiceMessage value)? voice,
    TResult Function(VideoMessage value)? video,
    TResult Function(FileMessage value)? file,
    TResult Function(LocationMessage value)? location,
    TResult Function(CardMessage value)? card,
    TResult Function(RedPacketMessage value)? redPacket,
    TResult Function(TransferMessage value)? transfer,
    TResult Function(ForwardMessage value)? forward,
    TResult Function(CustomMessage value)? custom,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextMessageImplToJson(this);
  }
}

abstract class TextMessage extends IMMessage {
  const factory TextMessage({
    required final String id,
    required final String senderId,
    required final String senderName,
    final String? senderAvatar,
    required final DateTime timestamp,
    final MessageDirection direction,
    final MessageStatus status,
    final String? conversationId,
    required final String content,
    final bool isAtAll,
    final List<String> atUserIds,
  }) = _$TextMessageImpl;
  const TextMessage._() : super._();

  factory TextMessage.fromJson(Map<String, dynamic> json) =
      _$TextMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderAvatar;
  @override
  DateTime get timestamp;
  @override
  MessageDirection get direction;
  @override
  MessageStatus get status;
  @override
  String? get conversationId; // 文本特有字段
  String get content;
  bool get isAtAll;
  List<String> get atUserIds;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextMessageImplCopyWith<_$TextMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageMessageImplCopyWith<$Res>
    implements $IMMessageCopyWith<$Res> {
  factory _$$ImageMessageImplCopyWith(
    _$ImageMessageImpl value,
    $Res Function(_$ImageMessageImpl) then,
  ) = __$$ImageMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String senderId,
    String senderName,
    String? senderAvatar,
    DateTime timestamp,
    MessageDirection direction,
    MessageStatus status,
    String? conversationId,
    String url,
    String? thumbnailUrl,
    int? width,
    int? height,
    int? fileSize,
    String? localPath,
  });
}

/// @nodoc
class __$$ImageMessageImplCopyWithImpl<$Res>
    extends _$IMMessageCopyWithImpl<$Res, _$ImageMessageImpl>
    implements _$$ImageMessageImplCopyWith<$Res> {
  __$$ImageMessageImplCopyWithImpl(
    _$ImageMessageImpl _value,
    $Res Function(_$ImageMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatar = freezed,
    Object? timestamp = null,
    Object? direction = null,
    Object? status = null,
    Object? conversationId = freezed,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? fileSize = freezed,
    Object? localPath = freezed,
  }) {
    return _then(
      _$ImageMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        senderAvatar: freezed == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as MessageDirection,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        conversationId: freezed == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        width: freezed == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as int?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int?,
        fileSize: freezed == fileSize
            ? _value.fileSize
            : fileSize // ignore: cast_nullable_to_non_nullable
                  as int?,
        localPath: freezed == localPath
            ? _value.localPath
            : localPath // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageMessageImpl extends ImageMessage {
  const _$ImageMessageImpl({
    required this.id,
    required this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    this.direction = MessageDirection.send,
    this.status = MessageStatus.sending,
    this.conversationId,
    required this.url,
    this.thumbnailUrl,
    this.width,
    this.height,
    this.fileSize,
    this.localPath,
    final String? $type,
  }) : $type = $type ?? 'image',
       super._();

  factory _$ImageMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderAvatar;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final MessageDirection direction;
  @override
  @JsonKey()
  final MessageStatus status;
  @override
  final String? conversationId;
  // 图片特有字段
  @override
  final String url;
  @override
  final String? thumbnailUrl;
  @override
  final int? width;
  @override
  final int? height;
  @override
  final int? fileSize;
  @override
  final String? localPath;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IMMessage.image(id: $id, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp, direction: $direction, status: $status, conversationId: $conversationId, url: $url, thumbnailUrl: $thumbnailUrl, width: $width, height: $height, fileSize: $fileSize, localPath: $localPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    senderId,
    senderName,
    senderAvatar,
    timestamp,
    direction,
    status,
    conversationId,
    url,
    thumbnailUrl,
    width,
    height,
    fileSize,
    localPath,
  );

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageMessageImplCopyWith<_$ImageMessageImpl> get copyWith =>
      __$$ImageMessageImplCopyWithImpl<_$ImageMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )
    text,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    image,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )
    voice,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    video,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )
    file,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )
    location,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )
    card,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )
    redPacket,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )
    transfer,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )
    forward,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )
    custom,
  }) {
    return image(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      url,
      thumbnailUrl,
      width,
      height,
      fileSize,
      localPath,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
  }) {
    return image?.call(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      url,
      thumbnailUrl,
      width,
      height,
      fileSize,
      localPath,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(
        id,
        senderId,
        senderName,
        senderAvatar,
        timestamp,
        direction,
        status,
        conversationId,
        url,
        thumbnailUrl,
        width,
        height,
        fileSize,
        localPath,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextMessage value) text,
    required TResult Function(ImageMessage value) image,
    required TResult Function(VoiceMessage value) voice,
    required TResult Function(VideoMessage value) video,
    required TResult Function(FileMessage value) file,
    required TResult Function(LocationMessage value) location,
    required TResult Function(CardMessage value) card,
    required TResult Function(RedPacketMessage value) redPacket,
    required TResult Function(TransferMessage value) transfer,
    required TResult Function(ForwardMessage value) forward,
    required TResult Function(CustomMessage value) custom,
  }) {
    return image(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextMessage value)? text,
    TResult? Function(ImageMessage value)? image,
    TResult? Function(VoiceMessage value)? voice,
    TResult? Function(VideoMessage value)? video,
    TResult? Function(FileMessage value)? file,
    TResult? Function(LocationMessage value)? location,
    TResult? Function(CardMessage value)? card,
    TResult? Function(RedPacketMessage value)? redPacket,
    TResult? Function(TransferMessage value)? transfer,
    TResult? Function(ForwardMessage value)? forward,
    TResult? Function(CustomMessage value)? custom,
  }) {
    return image?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextMessage value)? text,
    TResult Function(ImageMessage value)? image,
    TResult Function(VoiceMessage value)? voice,
    TResult Function(VideoMessage value)? video,
    TResult Function(FileMessage value)? file,
    TResult Function(LocationMessage value)? location,
    TResult Function(CardMessage value)? card,
    TResult Function(RedPacketMessage value)? redPacket,
    TResult Function(TransferMessage value)? transfer,
    TResult Function(ForwardMessage value)? forward,
    TResult Function(CustomMessage value)? custom,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageMessageImplToJson(this);
  }
}

abstract class ImageMessage extends IMMessage {
  const factory ImageMessage({
    required final String id,
    required final String senderId,
    required final String senderName,
    final String? senderAvatar,
    required final DateTime timestamp,
    final MessageDirection direction,
    final MessageStatus status,
    final String? conversationId,
    required final String url,
    final String? thumbnailUrl,
    final int? width,
    final int? height,
    final int? fileSize,
    final String? localPath,
  }) = _$ImageMessageImpl;
  const ImageMessage._() : super._();

  factory ImageMessage.fromJson(Map<String, dynamic> json) =
      _$ImageMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderAvatar;
  @override
  DateTime get timestamp;
  @override
  MessageDirection get direction;
  @override
  MessageStatus get status;
  @override
  String? get conversationId; // 图片特有字段
  String get url;
  String? get thumbnailUrl;
  int? get width;
  int? get height;
  int? get fileSize;
  String? get localPath;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageMessageImplCopyWith<_$ImageMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VoiceMessageImplCopyWith<$Res>
    implements $IMMessageCopyWith<$Res> {
  factory _$$VoiceMessageImplCopyWith(
    _$VoiceMessageImpl value,
    $Res Function(_$VoiceMessageImpl) then,
  ) = __$$VoiceMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String senderId,
    String senderName,
    String? senderAvatar,
    DateTime timestamp,
    MessageDirection direction,
    MessageStatus status,
    String? conversationId,
    String url,
    int duration,
    bool isPlayed,
    String? localPath,
  });
}

/// @nodoc
class __$$VoiceMessageImplCopyWithImpl<$Res>
    extends _$IMMessageCopyWithImpl<$Res, _$VoiceMessageImpl>
    implements _$$VoiceMessageImplCopyWith<$Res> {
  __$$VoiceMessageImplCopyWithImpl(
    _$VoiceMessageImpl _value,
    $Res Function(_$VoiceMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatar = freezed,
    Object? timestamp = null,
    Object? direction = null,
    Object? status = null,
    Object? conversationId = freezed,
    Object? url = null,
    Object? duration = null,
    Object? isPlayed = null,
    Object? localPath = freezed,
  }) {
    return _then(
      _$VoiceMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        senderAvatar: freezed == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as MessageDirection,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        conversationId: freezed == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        isPlayed: null == isPlayed
            ? _value.isPlayed
            : isPlayed // ignore: cast_nullable_to_non_nullable
                  as bool,
        localPath: freezed == localPath
            ? _value.localPath
            : localPath // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceMessageImpl extends VoiceMessage {
  const _$VoiceMessageImpl({
    required this.id,
    required this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    this.direction = MessageDirection.send,
    this.status = MessageStatus.sending,
    this.conversationId,
    required this.url,
    required this.duration,
    this.isPlayed = false,
    this.localPath,
    final String? $type,
  }) : $type = $type ?? 'voice',
       super._();

  factory _$VoiceMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoiceMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderAvatar;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final MessageDirection direction;
  @override
  @JsonKey()
  final MessageStatus status;
  @override
  final String? conversationId;
  // 语音特有字段
  @override
  final String url;
  @override
  final int duration;
  // 秒
  @override
  @JsonKey()
  final bool isPlayed;
  @override
  final String? localPath;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IMMessage.voice(id: $id, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp, direction: $direction, status: $status, conversationId: $conversationId, url: $url, duration: $duration, isPlayed: $isPlayed, localPath: $localPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.isPlayed, isPlayed) ||
                other.isPlayed == isPlayed) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    senderId,
    senderName,
    senderAvatar,
    timestamp,
    direction,
    status,
    conversationId,
    url,
    duration,
    isPlayed,
    localPath,
  );

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceMessageImplCopyWith<_$VoiceMessageImpl> get copyWith =>
      __$$VoiceMessageImplCopyWithImpl<_$VoiceMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )
    text,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    image,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )
    voice,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    video,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )
    file,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )
    location,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )
    card,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )
    redPacket,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )
    transfer,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )
    forward,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )
    custom,
  }) {
    return voice(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      url,
      duration,
      isPlayed,
      localPath,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
  }) {
    return voice?.call(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      url,
      duration,
      isPlayed,
      localPath,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
    required TResult orElse(),
  }) {
    if (voice != null) {
      return voice(
        id,
        senderId,
        senderName,
        senderAvatar,
        timestamp,
        direction,
        status,
        conversationId,
        url,
        duration,
        isPlayed,
        localPath,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextMessage value) text,
    required TResult Function(ImageMessage value) image,
    required TResult Function(VoiceMessage value) voice,
    required TResult Function(VideoMessage value) video,
    required TResult Function(FileMessage value) file,
    required TResult Function(LocationMessage value) location,
    required TResult Function(CardMessage value) card,
    required TResult Function(RedPacketMessage value) redPacket,
    required TResult Function(TransferMessage value) transfer,
    required TResult Function(ForwardMessage value) forward,
    required TResult Function(CustomMessage value) custom,
  }) {
    return voice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextMessage value)? text,
    TResult? Function(ImageMessage value)? image,
    TResult? Function(VoiceMessage value)? voice,
    TResult? Function(VideoMessage value)? video,
    TResult? Function(FileMessage value)? file,
    TResult? Function(LocationMessage value)? location,
    TResult? Function(CardMessage value)? card,
    TResult? Function(RedPacketMessage value)? redPacket,
    TResult? Function(TransferMessage value)? transfer,
    TResult? Function(ForwardMessage value)? forward,
    TResult? Function(CustomMessage value)? custom,
  }) {
    return voice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextMessage value)? text,
    TResult Function(ImageMessage value)? image,
    TResult Function(VoiceMessage value)? voice,
    TResult Function(VideoMessage value)? video,
    TResult Function(FileMessage value)? file,
    TResult Function(LocationMessage value)? location,
    TResult Function(CardMessage value)? card,
    TResult Function(RedPacketMessage value)? redPacket,
    TResult Function(TransferMessage value)? transfer,
    TResult Function(ForwardMessage value)? forward,
    TResult Function(CustomMessage value)? custom,
    required TResult orElse(),
  }) {
    if (voice != null) {
      return voice(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceMessageImplToJson(this);
  }
}

abstract class VoiceMessage extends IMMessage {
  const factory VoiceMessage({
    required final String id,
    required final String senderId,
    required final String senderName,
    final String? senderAvatar,
    required final DateTime timestamp,
    final MessageDirection direction,
    final MessageStatus status,
    final String? conversationId,
    required final String url,
    required final int duration,
    final bool isPlayed,
    final String? localPath,
  }) = _$VoiceMessageImpl;
  const VoiceMessage._() : super._();

  factory VoiceMessage.fromJson(Map<String, dynamic> json) =
      _$VoiceMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderAvatar;
  @override
  DateTime get timestamp;
  @override
  MessageDirection get direction;
  @override
  MessageStatus get status;
  @override
  String? get conversationId; // 语音特有字段
  String get url;
  int get duration; // 秒
  bool get isPlayed;
  String? get localPath;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceMessageImplCopyWith<_$VoiceMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VideoMessageImplCopyWith<$Res>
    implements $IMMessageCopyWith<$Res> {
  factory _$$VideoMessageImplCopyWith(
    _$VideoMessageImpl value,
    $Res Function(_$VideoMessageImpl) then,
  ) = __$$VideoMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String senderId,
    String senderName,
    String? senderAvatar,
    DateTime timestamp,
    MessageDirection direction,
    MessageStatus status,
    String? conversationId,
    String url,
    String? thumbnailUrl,
    int duration,
    int? width,
    int? height,
    int? fileSize,
    String? localPath,
  });
}

/// @nodoc
class __$$VideoMessageImplCopyWithImpl<$Res>
    extends _$IMMessageCopyWithImpl<$Res, _$VideoMessageImpl>
    implements _$$VideoMessageImplCopyWith<$Res> {
  __$$VideoMessageImplCopyWithImpl(
    _$VideoMessageImpl _value,
    $Res Function(_$VideoMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatar = freezed,
    Object? timestamp = null,
    Object? direction = null,
    Object? status = null,
    Object? conversationId = freezed,
    Object? url = null,
    Object? thumbnailUrl = freezed,
    Object? duration = null,
    Object? width = freezed,
    Object? height = freezed,
    Object? fileSize = freezed,
    Object? localPath = freezed,
  }) {
    return _then(
      _$VideoMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        senderAvatar: freezed == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as MessageDirection,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        conversationId: freezed == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        width: freezed == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as int?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int?,
        fileSize: freezed == fileSize
            ? _value.fileSize
            : fileSize // ignore: cast_nullable_to_non_nullable
                  as int?,
        localPath: freezed == localPath
            ? _value.localPath
            : localPath // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoMessageImpl extends VideoMessage {
  const _$VideoMessageImpl({
    required this.id,
    required this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    this.direction = MessageDirection.send,
    this.status = MessageStatus.sending,
    this.conversationId,
    required this.url,
    this.thumbnailUrl,
    required this.duration,
    this.width,
    this.height,
    this.fileSize,
    this.localPath,
    final String? $type,
  }) : $type = $type ?? 'video',
       super._();

  factory _$VideoMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderAvatar;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final MessageDirection direction;
  @override
  @JsonKey()
  final MessageStatus status;
  @override
  final String? conversationId;
  // 视频特有字段
  @override
  final String url;
  @override
  final String? thumbnailUrl;
  @override
  final int duration;
  // 秒
  @override
  final int? width;
  @override
  final int? height;
  @override
  final int? fileSize;
  @override
  final String? localPath;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IMMessage.video(id: $id, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp, direction: $direction, status: $status, conversationId: $conversationId, url: $url, thumbnailUrl: $thumbnailUrl, duration: $duration, width: $width, height: $height, fileSize: $fileSize, localPath: $localPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    senderId,
    senderName,
    senderAvatar,
    timestamp,
    direction,
    status,
    conversationId,
    url,
    thumbnailUrl,
    duration,
    width,
    height,
    fileSize,
    localPath,
  );

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoMessageImplCopyWith<_$VideoMessageImpl> get copyWith =>
      __$$VideoMessageImplCopyWithImpl<_$VideoMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )
    text,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    image,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )
    voice,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    video,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )
    file,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )
    location,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )
    card,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )
    redPacket,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )
    transfer,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )
    forward,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )
    custom,
  }) {
    return video(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      url,
      thumbnailUrl,
      duration,
      width,
      height,
      fileSize,
      localPath,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
  }) {
    return video?.call(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      url,
      thumbnailUrl,
      duration,
      width,
      height,
      fileSize,
      localPath,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
    required TResult orElse(),
  }) {
    if (video != null) {
      return video(
        id,
        senderId,
        senderName,
        senderAvatar,
        timestamp,
        direction,
        status,
        conversationId,
        url,
        thumbnailUrl,
        duration,
        width,
        height,
        fileSize,
        localPath,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextMessage value) text,
    required TResult Function(ImageMessage value) image,
    required TResult Function(VoiceMessage value) voice,
    required TResult Function(VideoMessage value) video,
    required TResult Function(FileMessage value) file,
    required TResult Function(LocationMessage value) location,
    required TResult Function(CardMessage value) card,
    required TResult Function(RedPacketMessage value) redPacket,
    required TResult Function(TransferMessage value) transfer,
    required TResult Function(ForwardMessage value) forward,
    required TResult Function(CustomMessage value) custom,
  }) {
    return video(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextMessage value)? text,
    TResult? Function(ImageMessage value)? image,
    TResult? Function(VoiceMessage value)? voice,
    TResult? Function(VideoMessage value)? video,
    TResult? Function(FileMessage value)? file,
    TResult? Function(LocationMessage value)? location,
    TResult? Function(CardMessage value)? card,
    TResult? Function(RedPacketMessage value)? redPacket,
    TResult? Function(TransferMessage value)? transfer,
    TResult? Function(ForwardMessage value)? forward,
    TResult? Function(CustomMessage value)? custom,
  }) {
    return video?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextMessage value)? text,
    TResult Function(ImageMessage value)? image,
    TResult Function(VoiceMessage value)? voice,
    TResult Function(VideoMessage value)? video,
    TResult Function(FileMessage value)? file,
    TResult Function(LocationMessage value)? location,
    TResult Function(CardMessage value)? card,
    TResult Function(RedPacketMessage value)? redPacket,
    TResult Function(TransferMessage value)? transfer,
    TResult Function(ForwardMessage value)? forward,
    TResult Function(CustomMessage value)? custom,
    required TResult orElse(),
  }) {
    if (video != null) {
      return video(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoMessageImplToJson(this);
  }
}

abstract class VideoMessage extends IMMessage {
  const factory VideoMessage({
    required final String id,
    required final String senderId,
    required final String senderName,
    final String? senderAvatar,
    required final DateTime timestamp,
    final MessageDirection direction,
    final MessageStatus status,
    final String? conversationId,
    required final String url,
    final String? thumbnailUrl,
    required final int duration,
    final int? width,
    final int? height,
    final int? fileSize,
    final String? localPath,
  }) = _$VideoMessageImpl;
  const VideoMessage._() : super._();

  factory VideoMessage.fromJson(Map<String, dynamic> json) =
      _$VideoMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderAvatar;
  @override
  DateTime get timestamp;
  @override
  MessageDirection get direction;
  @override
  MessageStatus get status;
  @override
  String? get conversationId; // 视频特有字段
  String get url;
  String? get thumbnailUrl;
  int get duration; // 秒
  int? get width;
  int? get height;
  int? get fileSize;
  String? get localPath;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoMessageImplCopyWith<_$VideoMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FileMessageImplCopyWith<$Res>
    implements $IMMessageCopyWith<$Res> {
  factory _$$FileMessageImplCopyWith(
    _$FileMessageImpl value,
    $Res Function(_$FileMessageImpl) then,
  ) = __$$FileMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String senderId,
    String senderName,
    String? senderAvatar,
    DateTime timestamp,
    MessageDirection direction,
    MessageStatus status,
    String? conversationId,
    String url,
    String fileName,
    int fileSize,
    String? fileExtension,
    String? localPath,
    double downloadProgress,
  });
}

/// @nodoc
class __$$FileMessageImplCopyWithImpl<$Res>
    extends _$IMMessageCopyWithImpl<$Res, _$FileMessageImpl>
    implements _$$FileMessageImplCopyWith<$Res> {
  __$$FileMessageImplCopyWithImpl(
    _$FileMessageImpl _value,
    $Res Function(_$FileMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatar = freezed,
    Object? timestamp = null,
    Object? direction = null,
    Object? status = null,
    Object? conversationId = freezed,
    Object? url = null,
    Object? fileName = null,
    Object? fileSize = null,
    Object? fileExtension = freezed,
    Object? localPath = freezed,
    Object? downloadProgress = null,
  }) {
    return _then(
      _$FileMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        senderAvatar: freezed == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as MessageDirection,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        conversationId: freezed == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        fileName: null == fileName
            ? _value.fileName
            : fileName // ignore: cast_nullable_to_non_nullable
                  as String,
        fileSize: null == fileSize
            ? _value.fileSize
            : fileSize // ignore: cast_nullable_to_non_nullable
                  as int,
        fileExtension: freezed == fileExtension
            ? _value.fileExtension
            : fileExtension // ignore: cast_nullable_to_non_nullable
                  as String?,
        localPath: freezed == localPath
            ? _value.localPath
            : localPath // ignore: cast_nullable_to_non_nullable
                  as String?,
        downloadProgress: null == downloadProgress
            ? _value.downloadProgress
            : downloadProgress // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FileMessageImpl extends FileMessage {
  const _$FileMessageImpl({
    required this.id,
    required this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    this.direction = MessageDirection.send,
    this.status = MessageStatus.sending,
    this.conversationId,
    required this.url,
    required this.fileName,
    required this.fileSize,
    this.fileExtension,
    this.localPath,
    this.downloadProgress = 0,
    final String? $type,
  }) : $type = $type ?? 'file',
       super._();

  factory _$FileMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderAvatar;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final MessageDirection direction;
  @override
  @JsonKey()
  final MessageStatus status;
  @override
  final String? conversationId;
  // 文件特有字段
  @override
  final String url;
  @override
  final String fileName;
  @override
  final int fileSize;
  @override
  final String? fileExtension;
  @override
  final String? localPath;
  @override
  @JsonKey()
  final double downloadProgress;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IMMessage.file(id: $id, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp, direction: $direction, status: $status, conversationId: $conversationId, url: $url, fileName: $fileName, fileSize: $fileSize, fileExtension: $fileExtension, localPath: $localPath, downloadProgress: $downloadProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.fileExtension, fileExtension) ||
                other.fileExtension == fileExtension) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.downloadProgress, downloadProgress) ||
                other.downloadProgress == downloadProgress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    senderId,
    senderName,
    senderAvatar,
    timestamp,
    direction,
    status,
    conversationId,
    url,
    fileName,
    fileSize,
    fileExtension,
    localPath,
    downloadProgress,
  );

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileMessageImplCopyWith<_$FileMessageImpl> get copyWith =>
      __$$FileMessageImplCopyWithImpl<_$FileMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )
    text,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    image,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )
    voice,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    video,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )
    file,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )
    location,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )
    card,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )
    redPacket,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )
    transfer,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )
    forward,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )
    custom,
  }) {
    return file(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      url,
      fileName,
      fileSize,
      fileExtension,
      localPath,
      downloadProgress,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
  }) {
    return file?.call(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      url,
      fileName,
      fileSize,
      fileExtension,
      localPath,
      downloadProgress,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(
        id,
        senderId,
        senderName,
        senderAvatar,
        timestamp,
        direction,
        status,
        conversationId,
        url,
        fileName,
        fileSize,
        fileExtension,
        localPath,
        downloadProgress,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextMessage value) text,
    required TResult Function(ImageMessage value) image,
    required TResult Function(VoiceMessage value) voice,
    required TResult Function(VideoMessage value) video,
    required TResult Function(FileMessage value) file,
    required TResult Function(LocationMessage value) location,
    required TResult Function(CardMessage value) card,
    required TResult Function(RedPacketMessage value) redPacket,
    required TResult Function(TransferMessage value) transfer,
    required TResult Function(ForwardMessage value) forward,
    required TResult Function(CustomMessage value) custom,
  }) {
    return file(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextMessage value)? text,
    TResult? Function(ImageMessage value)? image,
    TResult? Function(VoiceMessage value)? voice,
    TResult? Function(VideoMessage value)? video,
    TResult? Function(FileMessage value)? file,
    TResult? Function(LocationMessage value)? location,
    TResult? Function(CardMessage value)? card,
    TResult? Function(RedPacketMessage value)? redPacket,
    TResult? Function(TransferMessage value)? transfer,
    TResult? Function(ForwardMessage value)? forward,
    TResult? Function(CustomMessage value)? custom,
  }) {
    return file?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextMessage value)? text,
    TResult Function(ImageMessage value)? image,
    TResult Function(VoiceMessage value)? voice,
    TResult Function(VideoMessage value)? video,
    TResult Function(FileMessage value)? file,
    TResult Function(LocationMessage value)? location,
    TResult Function(CardMessage value)? card,
    TResult Function(RedPacketMessage value)? redPacket,
    TResult Function(TransferMessage value)? transfer,
    TResult Function(ForwardMessage value)? forward,
    TResult Function(CustomMessage value)? custom,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FileMessageImplToJson(this);
  }
}

abstract class FileMessage extends IMMessage {
  const factory FileMessage({
    required final String id,
    required final String senderId,
    required final String senderName,
    final String? senderAvatar,
    required final DateTime timestamp,
    final MessageDirection direction,
    final MessageStatus status,
    final String? conversationId,
    required final String url,
    required final String fileName,
    required final int fileSize,
    final String? fileExtension,
    final String? localPath,
    final double downloadProgress,
  }) = _$FileMessageImpl;
  const FileMessage._() : super._();

  factory FileMessage.fromJson(Map<String, dynamic> json) =
      _$FileMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderAvatar;
  @override
  DateTime get timestamp;
  @override
  MessageDirection get direction;
  @override
  MessageStatus get status;
  @override
  String? get conversationId; // 文件特有字段
  String get url;
  String get fileName;
  int get fileSize;
  String? get fileExtension;
  String? get localPath;
  double get downloadProgress;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileMessageImplCopyWith<_$FileMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationMessageImplCopyWith<$Res>
    implements $IMMessageCopyWith<$Res> {
  factory _$$LocationMessageImplCopyWith(
    _$LocationMessageImpl value,
    $Res Function(_$LocationMessageImpl) then,
  ) = __$$LocationMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String senderId,
    String senderName,
    String? senderAvatar,
    DateTime timestamp,
    MessageDirection direction,
    MessageStatus status,
    String? conversationId,
    double latitude,
    double longitude,
    String address,
    String? name,
    String? coverUrl,
  });
}

/// @nodoc
class __$$LocationMessageImplCopyWithImpl<$Res>
    extends _$IMMessageCopyWithImpl<$Res, _$LocationMessageImpl>
    implements _$$LocationMessageImplCopyWith<$Res> {
  __$$LocationMessageImplCopyWithImpl(
    _$LocationMessageImpl _value,
    $Res Function(_$LocationMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatar = freezed,
    Object? timestamp = null,
    Object? direction = null,
    Object? status = null,
    Object? conversationId = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
    Object? name = freezed,
    Object? coverUrl = freezed,
  }) {
    return _then(
      _$LocationMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        senderAvatar: freezed == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as MessageDirection,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        conversationId: freezed == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        coverUrl: freezed == coverUrl
            ? _value.coverUrl
            : coverUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationMessageImpl extends LocationMessage {
  const _$LocationMessageImpl({
    required this.id,
    required this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    this.direction = MessageDirection.send,
    this.status = MessageStatus.sending,
    this.conversationId,
    required this.latitude,
    required this.longitude,
    required this.address,
    this.name,
    this.coverUrl,
    final String? $type,
  }) : $type = $type ?? 'location',
       super._();

  factory _$LocationMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderAvatar;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final MessageDirection direction;
  @override
  @JsonKey()
  final MessageStatus status;
  @override
  final String? conversationId;
  // 位置特有字段
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String address;
  @override
  final String? name;
  @override
  final String? coverUrl;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IMMessage.location(id: $id, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp, direction: $direction, status: $status, conversationId: $conversationId, latitude: $latitude, longitude: $longitude, address: $address, name: $name, coverUrl: $coverUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    senderId,
    senderName,
    senderAvatar,
    timestamp,
    direction,
    status,
    conversationId,
    latitude,
    longitude,
    address,
    name,
    coverUrl,
  );

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationMessageImplCopyWith<_$LocationMessageImpl> get copyWith =>
      __$$LocationMessageImplCopyWithImpl<_$LocationMessageImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )
    text,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    image,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )
    voice,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    video,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )
    file,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )
    location,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )
    card,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )
    redPacket,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )
    transfer,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )
    forward,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )
    custom,
  }) {
    return location(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      latitude,
      longitude,
      address,
      name,
      coverUrl,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
  }) {
    return location?.call(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      latitude,
      longitude,
      address,
      name,
      coverUrl,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
    required TResult orElse(),
  }) {
    if (location != null) {
      return location(
        id,
        senderId,
        senderName,
        senderAvatar,
        timestamp,
        direction,
        status,
        conversationId,
        latitude,
        longitude,
        address,
        name,
        coverUrl,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextMessage value) text,
    required TResult Function(ImageMessage value) image,
    required TResult Function(VoiceMessage value) voice,
    required TResult Function(VideoMessage value) video,
    required TResult Function(FileMessage value) file,
    required TResult Function(LocationMessage value) location,
    required TResult Function(CardMessage value) card,
    required TResult Function(RedPacketMessage value) redPacket,
    required TResult Function(TransferMessage value) transfer,
    required TResult Function(ForwardMessage value) forward,
    required TResult Function(CustomMessage value) custom,
  }) {
    return location(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextMessage value)? text,
    TResult? Function(ImageMessage value)? image,
    TResult? Function(VoiceMessage value)? voice,
    TResult? Function(VideoMessage value)? video,
    TResult? Function(FileMessage value)? file,
    TResult? Function(LocationMessage value)? location,
    TResult? Function(CardMessage value)? card,
    TResult? Function(RedPacketMessage value)? redPacket,
    TResult? Function(TransferMessage value)? transfer,
    TResult? Function(ForwardMessage value)? forward,
    TResult? Function(CustomMessage value)? custom,
  }) {
    return location?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextMessage value)? text,
    TResult Function(ImageMessage value)? image,
    TResult Function(VoiceMessage value)? voice,
    TResult Function(VideoMessage value)? video,
    TResult Function(FileMessage value)? file,
    TResult Function(LocationMessage value)? location,
    TResult Function(CardMessage value)? card,
    TResult Function(RedPacketMessage value)? redPacket,
    TResult Function(TransferMessage value)? transfer,
    TResult Function(ForwardMessage value)? forward,
    TResult Function(CustomMessage value)? custom,
    required TResult orElse(),
  }) {
    if (location != null) {
      return location(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationMessageImplToJson(this);
  }
}

abstract class LocationMessage extends IMMessage {
  const factory LocationMessage({
    required final String id,
    required final String senderId,
    required final String senderName,
    final String? senderAvatar,
    required final DateTime timestamp,
    final MessageDirection direction,
    final MessageStatus status,
    final String? conversationId,
    required final double latitude,
    required final double longitude,
    required final String address,
    final String? name,
    final String? coverUrl,
  }) = _$LocationMessageImpl;
  const LocationMessage._() : super._();

  factory LocationMessage.fromJson(Map<String, dynamic> json) =
      _$LocationMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderAvatar;
  @override
  DateTime get timestamp;
  @override
  MessageDirection get direction;
  @override
  MessageStatus get status;
  @override
  String? get conversationId; // 位置特有字段
  double get latitude;
  double get longitude;
  String get address;
  String? get name;
  String? get coverUrl;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationMessageImplCopyWith<_$LocationMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CardMessageImplCopyWith<$Res>
    implements $IMMessageCopyWith<$Res> {
  factory _$$CardMessageImplCopyWith(
    _$CardMessageImpl value,
    $Res Function(_$CardMessageImpl) then,
  ) = __$$CardMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String senderId,
    String senderName,
    String? senderAvatar,
    DateTime timestamp,
    MessageDirection direction,
    MessageStatus status,
    String? conversationId,
    String userId,
    String userName,
    String? userAvatar,
    String? userSignature,
  });
}

/// @nodoc
class __$$CardMessageImplCopyWithImpl<$Res>
    extends _$IMMessageCopyWithImpl<$Res, _$CardMessageImpl>
    implements _$$CardMessageImplCopyWith<$Res> {
  __$$CardMessageImplCopyWithImpl(
    _$CardMessageImpl _value,
    $Res Function(_$CardMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatar = freezed,
    Object? timestamp = null,
    Object? direction = null,
    Object? status = null,
    Object? conversationId = freezed,
    Object? userId = null,
    Object? userName = null,
    Object? userAvatar = freezed,
    Object? userSignature = freezed,
  }) {
    return _then(
      _$CardMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        senderAvatar: freezed == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as MessageDirection,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        conversationId: freezed == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        userName: null == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String,
        userAvatar: freezed == userAvatar
            ? _value.userAvatar
            : userAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        userSignature: freezed == userSignature
            ? _value.userSignature
            : userSignature // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CardMessageImpl extends CardMessage {
  const _$CardMessageImpl({
    required this.id,
    required this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    this.direction = MessageDirection.send,
    this.status = MessageStatus.sending,
    this.conversationId,
    required this.userId,
    required this.userName,
    this.userAvatar,
    this.userSignature,
    final String? $type,
  }) : $type = $type ?? 'card',
       super._();

  factory _$CardMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderAvatar;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final MessageDirection direction;
  @override
  @JsonKey()
  final MessageStatus status;
  @override
  final String? conversationId;
  // 名片特有字段
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String? userAvatar;
  @override
  final String? userSignature;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IMMessage.card(id: $id, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp, direction: $direction, status: $status, conversationId: $conversationId, userId: $userId, userName: $userName, userAvatar: $userAvatar, userSignature: $userSignature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userAvatar, userAvatar) ||
                other.userAvatar == userAvatar) &&
            (identical(other.userSignature, userSignature) ||
                other.userSignature == userSignature));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    senderId,
    senderName,
    senderAvatar,
    timestamp,
    direction,
    status,
    conversationId,
    userId,
    userName,
    userAvatar,
    userSignature,
  );

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardMessageImplCopyWith<_$CardMessageImpl> get copyWith =>
      __$$CardMessageImplCopyWithImpl<_$CardMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )
    text,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    image,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )
    voice,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    video,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )
    file,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )
    location,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )
    card,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )
    redPacket,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )
    transfer,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )
    forward,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )
    custom,
  }) {
    return card(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      userId,
      userName,
      userAvatar,
      userSignature,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
  }) {
    return card?.call(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      userId,
      userName,
      userAvatar,
      userSignature,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
    required TResult orElse(),
  }) {
    if (card != null) {
      return card(
        id,
        senderId,
        senderName,
        senderAvatar,
        timestamp,
        direction,
        status,
        conversationId,
        userId,
        userName,
        userAvatar,
        userSignature,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextMessage value) text,
    required TResult Function(ImageMessage value) image,
    required TResult Function(VoiceMessage value) voice,
    required TResult Function(VideoMessage value) video,
    required TResult Function(FileMessage value) file,
    required TResult Function(LocationMessage value) location,
    required TResult Function(CardMessage value) card,
    required TResult Function(RedPacketMessage value) redPacket,
    required TResult Function(TransferMessage value) transfer,
    required TResult Function(ForwardMessage value) forward,
    required TResult Function(CustomMessage value) custom,
  }) {
    return card(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextMessage value)? text,
    TResult? Function(ImageMessage value)? image,
    TResult? Function(VoiceMessage value)? voice,
    TResult? Function(VideoMessage value)? video,
    TResult? Function(FileMessage value)? file,
    TResult? Function(LocationMessage value)? location,
    TResult? Function(CardMessage value)? card,
    TResult? Function(RedPacketMessage value)? redPacket,
    TResult? Function(TransferMessage value)? transfer,
    TResult? Function(ForwardMessage value)? forward,
    TResult? Function(CustomMessage value)? custom,
  }) {
    return card?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextMessage value)? text,
    TResult Function(ImageMessage value)? image,
    TResult Function(VoiceMessage value)? voice,
    TResult Function(VideoMessage value)? video,
    TResult Function(FileMessage value)? file,
    TResult Function(LocationMessage value)? location,
    TResult Function(CardMessage value)? card,
    TResult Function(RedPacketMessage value)? redPacket,
    TResult Function(TransferMessage value)? transfer,
    TResult Function(ForwardMessage value)? forward,
    TResult Function(CustomMessage value)? custom,
    required TResult orElse(),
  }) {
    if (card != null) {
      return card(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CardMessageImplToJson(this);
  }
}

abstract class CardMessage extends IMMessage {
  const factory CardMessage({
    required final String id,
    required final String senderId,
    required final String senderName,
    final String? senderAvatar,
    required final DateTime timestamp,
    final MessageDirection direction,
    final MessageStatus status,
    final String? conversationId,
    required final String userId,
    required final String userName,
    final String? userAvatar,
    final String? userSignature,
  }) = _$CardMessageImpl;
  const CardMessage._() : super._();

  factory CardMessage.fromJson(Map<String, dynamic> json) =
      _$CardMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderAvatar;
  @override
  DateTime get timestamp;
  @override
  MessageDirection get direction;
  @override
  MessageStatus get status;
  @override
  String? get conversationId; // 名片特有字段
  String get userId;
  String get userName;
  String? get userAvatar;
  String? get userSignature;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardMessageImplCopyWith<_$CardMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedPacketMessageImplCopyWith<$Res>
    implements $IMMessageCopyWith<$Res> {
  factory _$$RedPacketMessageImplCopyWith(
    _$RedPacketMessageImpl value,
    $Res Function(_$RedPacketMessageImpl) then,
  ) = __$$RedPacketMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String senderId,
    String senderName,
    String? senderAvatar,
    DateTime timestamp,
    MessageDirection direction,
    MessageStatus status,
    String? conversationId,
    String redPacketId,
    String greeting,
    bool isOpened,
    bool isExpired,
  });
}

/// @nodoc
class __$$RedPacketMessageImplCopyWithImpl<$Res>
    extends _$IMMessageCopyWithImpl<$Res, _$RedPacketMessageImpl>
    implements _$$RedPacketMessageImplCopyWith<$Res> {
  __$$RedPacketMessageImplCopyWithImpl(
    _$RedPacketMessageImpl _value,
    $Res Function(_$RedPacketMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatar = freezed,
    Object? timestamp = null,
    Object? direction = null,
    Object? status = null,
    Object? conversationId = freezed,
    Object? redPacketId = null,
    Object? greeting = null,
    Object? isOpened = null,
    Object? isExpired = null,
  }) {
    return _then(
      _$RedPacketMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        senderAvatar: freezed == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as MessageDirection,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        conversationId: freezed == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        redPacketId: null == redPacketId
            ? _value.redPacketId
            : redPacketId // ignore: cast_nullable_to_non_nullable
                  as String,
        greeting: null == greeting
            ? _value.greeting
            : greeting // ignore: cast_nullable_to_non_nullable
                  as String,
        isOpened: null == isOpened
            ? _value.isOpened
            : isOpened // ignore: cast_nullable_to_non_nullable
                  as bool,
        isExpired: null == isExpired
            ? _value.isExpired
            : isExpired // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RedPacketMessageImpl extends RedPacketMessage {
  const _$RedPacketMessageImpl({
    required this.id,
    required this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    this.direction = MessageDirection.send,
    this.status = MessageStatus.sending,
    this.conversationId,
    required this.redPacketId,
    required this.greeting,
    this.isOpened = false,
    this.isExpired = false,
    final String? $type,
  }) : $type = $type ?? 'redPacket',
       super._();

  factory _$RedPacketMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$RedPacketMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderAvatar;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final MessageDirection direction;
  @override
  @JsonKey()
  final MessageStatus status;
  @override
  final String? conversationId;
  // 红包特有字段
  @override
  final String redPacketId;
  @override
  final String greeting;
  @override
  @JsonKey()
  final bool isOpened;
  @override
  @JsonKey()
  final bool isExpired;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IMMessage.redPacket(id: $id, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp, direction: $direction, status: $status, conversationId: $conversationId, redPacketId: $redPacketId, greeting: $greeting, isOpened: $isOpened, isExpired: $isExpired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedPacketMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.redPacketId, redPacketId) ||
                other.redPacketId == redPacketId) &&
            (identical(other.greeting, greeting) ||
                other.greeting == greeting) &&
            (identical(other.isOpened, isOpened) ||
                other.isOpened == isOpened) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    senderId,
    senderName,
    senderAvatar,
    timestamp,
    direction,
    status,
    conversationId,
    redPacketId,
    greeting,
    isOpened,
    isExpired,
  );

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedPacketMessageImplCopyWith<_$RedPacketMessageImpl> get copyWith =>
      __$$RedPacketMessageImplCopyWithImpl<_$RedPacketMessageImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )
    text,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    image,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )
    voice,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    video,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )
    file,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )
    location,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )
    card,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )
    redPacket,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )
    transfer,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )
    forward,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )
    custom,
  }) {
    return redPacket(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      redPacketId,
      greeting,
      isOpened,
      isExpired,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
  }) {
    return redPacket?.call(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      redPacketId,
      greeting,
      isOpened,
      isExpired,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
    required TResult orElse(),
  }) {
    if (redPacket != null) {
      return redPacket(
        id,
        senderId,
        senderName,
        senderAvatar,
        timestamp,
        direction,
        status,
        conversationId,
        redPacketId,
        greeting,
        isOpened,
        isExpired,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextMessage value) text,
    required TResult Function(ImageMessage value) image,
    required TResult Function(VoiceMessage value) voice,
    required TResult Function(VideoMessage value) video,
    required TResult Function(FileMessage value) file,
    required TResult Function(LocationMessage value) location,
    required TResult Function(CardMessage value) card,
    required TResult Function(RedPacketMessage value) redPacket,
    required TResult Function(TransferMessage value) transfer,
    required TResult Function(ForwardMessage value) forward,
    required TResult Function(CustomMessage value) custom,
  }) {
    return redPacket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextMessage value)? text,
    TResult? Function(ImageMessage value)? image,
    TResult? Function(VoiceMessage value)? voice,
    TResult? Function(VideoMessage value)? video,
    TResult? Function(FileMessage value)? file,
    TResult? Function(LocationMessage value)? location,
    TResult? Function(CardMessage value)? card,
    TResult? Function(RedPacketMessage value)? redPacket,
    TResult? Function(TransferMessage value)? transfer,
    TResult? Function(ForwardMessage value)? forward,
    TResult? Function(CustomMessage value)? custom,
  }) {
    return redPacket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextMessage value)? text,
    TResult Function(ImageMessage value)? image,
    TResult Function(VoiceMessage value)? voice,
    TResult Function(VideoMessage value)? video,
    TResult Function(FileMessage value)? file,
    TResult Function(LocationMessage value)? location,
    TResult Function(CardMessage value)? card,
    TResult Function(RedPacketMessage value)? redPacket,
    TResult Function(TransferMessage value)? transfer,
    TResult Function(ForwardMessage value)? forward,
    TResult Function(CustomMessage value)? custom,
    required TResult orElse(),
  }) {
    if (redPacket != null) {
      return redPacket(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RedPacketMessageImplToJson(this);
  }
}

abstract class RedPacketMessage extends IMMessage {
  const factory RedPacketMessage({
    required final String id,
    required final String senderId,
    required final String senderName,
    final String? senderAvatar,
    required final DateTime timestamp,
    final MessageDirection direction,
    final MessageStatus status,
    final String? conversationId,
    required final String redPacketId,
    required final String greeting,
    final bool isOpened,
    final bool isExpired,
  }) = _$RedPacketMessageImpl;
  const RedPacketMessage._() : super._();

  factory RedPacketMessage.fromJson(Map<String, dynamic> json) =
      _$RedPacketMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderAvatar;
  @override
  DateTime get timestamp;
  @override
  MessageDirection get direction;
  @override
  MessageStatus get status;
  @override
  String? get conversationId; // 红包特有字段
  String get redPacketId;
  String get greeting;
  bool get isOpened;
  bool get isExpired;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedPacketMessageImplCopyWith<_$RedPacketMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransferMessageImplCopyWith<$Res>
    implements $IMMessageCopyWith<$Res> {
  factory _$$TransferMessageImplCopyWith(
    _$TransferMessageImpl value,
    $Res Function(_$TransferMessageImpl) then,
  ) = __$$TransferMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String senderId,
    String senderName,
    String? senderAvatar,
    DateTime timestamp,
    MessageDirection direction,
    MessageStatus status,
    String? conversationId,
    String transferId,
    double amount,
    String? remark,
    bool isReceived,
    bool isExpired,
  });
}

/// @nodoc
class __$$TransferMessageImplCopyWithImpl<$Res>
    extends _$IMMessageCopyWithImpl<$Res, _$TransferMessageImpl>
    implements _$$TransferMessageImplCopyWith<$Res> {
  __$$TransferMessageImplCopyWithImpl(
    _$TransferMessageImpl _value,
    $Res Function(_$TransferMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatar = freezed,
    Object? timestamp = null,
    Object? direction = null,
    Object? status = null,
    Object? conversationId = freezed,
    Object? transferId = null,
    Object? amount = null,
    Object? remark = freezed,
    Object? isReceived = null,
    Object? isExpired = null,
  }) {
    return _then(
      _$TransferMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        senderAvatar: freezed == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as MessageDirection,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        conversationId: freezed == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        transferId: null == transferId
            ? _value.transferId
            : transferId // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        remark: freezed == remark
            ? _value.remark
            : remark // ignore: cast_nullable_to_non_nullable
                  as String?,
        isReceived: null == isReceived
            ? _value.isReceived
            : isReceived // ignore: cast_nullable_to_non_nullable
                  as bool,
        isExpired: null == isExpired
            ? _value.isExpired
            : isExpired // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferMessageImpl extends TransferMessage {
  const _$TransferMessageImpl({
    required this.id,
    required this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    this.direction = MessageDirection.send,
    this.status = MessageStatus.sending,
    this.conversationId,
    required this.transferId,
    required this.amount,
    this.remark,
    this.isReceived = false,
    this.isExpired = false,
    final String? $type,
  }) : $type = $type ?? 'transfer',
       super._();

  factory _$TransferMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderAvatar;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final MessageDirection direction;
  @override
  @JsonKey()
  final MessageStatus status;
  @override
  final String? conversationId;
  // 转账特有字段
  @override
  final String transferId;
  @override
  final double amount;
  @override
  final String? remark;
  @override
  @JsonKey()
  final bool isReceived;
  @override
  @JsonKey()
  final bool isExpired;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IMMessage.transfer(id: $id, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp, direction: $direction, status: $status, conversationId: $conversationId, transferId: $transferId, amount: $amount, remark: $remark, isReceived: $isReceived, isExpired: $isExpired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.transferId, transferId) ||
                other.transferId == transferId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.isReceived, isReceived) ||
                other.isReceived == isReceived) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    senderId,
    senderName,
    senderAvatar,
    timestamp,
    direction,
    status,
    conversationId,
    transferId,
    amount,
    remark,
    isReceived,
    isExpired,
  );

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferMessageImplCopyWith<_$TransferMessageImpl> get copyWith =>
      __$$TransferMessageImplCopyWithImpl<_$TransferMessageImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )
    text,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    image,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )
    voice,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    video,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )
    file,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )
    location,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )
    card,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )
    redPacket,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )
    transfer,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )
    forward,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )
    custom,
  }) {
    return transfer(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      transferId,
      amount,
      remark,
      isReceived,
      isExpired,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
  }) {
    return transfer?.call(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      transferId,
      amount,
      remark,
      isReceived,
      isExpired,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
    required TResult orElse(),
  }) {
    if (transfer != null) {
      return transfer(
        id,
        senderId,
        senderName,
        senderAvatar,
        timestamp,
        direction,
        status,
        conversationId,
        transferId,
        amount,
        remark,
        isReceived,
        isExpired,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextMessage value) text,
    required TResult Function(ImageMessage value) image,
    required TResult Function(VoiceMessage value) voice,
    required TResult Function(VideoMessage value) video,
    required TResult Function(FileMessage value) file,
    required TResult Function(LocationMessage value) location,
    required TResult Function(CardMessage value) card,
    required TResult Function(RedPacketMessage value) redPacket,
    required TResult Function(TransferMessage value) transfer,
    required TResult Function(ForwardMessage value) forward,
    required TResult Function(CustomMessage value) custom,
  }) {
    return transfer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextMessage value)? text,
    TResult? Function(ImageMessage value)? image,
    TResult? Function(VoiceMessage value)? voice,
    TResult? Function(VideoMessage value)? video,
    TResult? Function(FileMessage value)? file,
    TResult? Function(LocationMessage value)? location,
    TResult? Function(CardMessage value)? card,
    TResult? Function(RedPacketMessage value)? redPacket,
    TResult? Function(TransferMessage value)? transfer,
    TResult? Function(ForwardMessage value)? forward,
    TResult? Function(CustomMessage value)? custom,
  }) {
    return transfer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextMessage value)? text,
    TResult Function(ImageMessage value)? image,
    TResult Function(VoiceMessage value)? voice,
    TResult Function(VideoMessage value)? video,
    TResult Function(FileMessage value)? file,
    TResult Function(LocationMessage value)? location,
    TResult Function(CardMessage value)? card,
    TResult Function(RedPacketMessage value)? redPacket,
    TResult Function(TransferMessage value)? transfer,
    TResult Function(ForwardMessage value)? forward,
    TResult Function(CustomMessage value)? custom,
    required TResult orElse(),
  }) {
    if (transfer != null) {
      return transfer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferMessageImplToJson(this);
  }
}

abstract class TransferMessage extends IMMessage {
  const factory TransferMessage({
    required final String id,
    required final String senderId,
    required final String senderName,
    final String? senderAvatar,
    required final DateTime timestamp,
    final MessageDirection direction,
    final MessageStatus status,
    final String? conversationId,
    required final String transferId,
    required final double amount,
    final String? remark,
    final bool isReceived,
    final bool isExpired,
  }) = _$TransferMessageImpl;
  const TransferMessage._() : super._();

  factory TransferMessage.fromJson(Map<String, dynamic> json) =
      _$TransferMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderAvatar;
  @override
  DateTime get timestamp;
  @override
  MessageDirection get direction;
  @override
  MessageStatus get status;
  @override
  String? get conversationId; // 转账特有字段
  String get transferId;
  double get amount;
  String? get remark;
  bool get isReceived;
  bool get isExpired;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferMessageImplCopyWith<_$TransferMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForwardMessageImplCopyWith<$Res>
    implements $IMMessageCopyWith<$Res> {
  factory _$$ForwardMessageImplCopyWith(
    _$ForwardMessageImpl value,
    $Res Function(_$ForwardMessageImpl) then,
  ) = __$$ForwardMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String senderId,
    String senderName,
    String? senderAvatar,
    DateTime timestamp,
    MessageDirection direction,
    MessageStatus status,
    String? conversationId,
    String title,
    List<ForwardMessageItem> messages,
    List<String> abstractList,
  });
}

/// @nodoc
class __$$ForwardMessageImplCopyWithImpl<$Res>
    extends _$IMMessageCopyWithImpl<$Res, _$ForwardMessageImpl>
    implements _$$ForwardMessageImplCopyWith<$Res> {
  __$$ForwardMessageImplCopyWithImpl(
    _$ForwardMessageImpl _value,
    $Res Function(_$ForwardMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatar = freezed,
    Object? timestamp = null,
    Object? direction = null,
    Object? status = null,
    Object? conversationId = freezed,
    Object? title = null,
    Object? messages = null,
    Object? abstractList = null,
  }) {
    return _then(
      _$ForwardMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        senderAvatar: freezed == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as MessageDirection,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        conversationId: freezed == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<ForwardMessageItem>,
        abstractList: null == abstractList
            ? _value._abstractList
            : abstractList // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForwardMessageImpl extends ForwardMessage {
  const _$ForwardMessageImpl({
    required this.id,
    required this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    this.direction = MessageDirection.send,
    this.status = MessageStatus.sending,
    this.conversationId,
    required this.title,
    required final List<ForwardMessageItem> messages,
    final List<String> abstractList = const [],
    final String? $type,
  }) : _messages = messages,
       _abstractList = abstractList,
       $type = $type ?? 'forward',
       super._();

  factory _$ForwardMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForwardMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderAvatar;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final MessageDirection direction;
  @override
  @JsonKey()
  final MessageStatus status;
  @override
  final String? conversationId;
  // 合并转发特有字段
  @override
  final String title;
  final List<ForwardMessageItem> _messages;
  @override
  List<ForwardMessageItem> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final List<String> _abstractList;
  @override
  @JsonKey()
  List<String> get abstractList {
    if (_abstractList is EqualUnmodifiableListView) return _abstractList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abstractList);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IMMessage.forward(id: $id, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp, direction: $direction, status: $status, conversationId: $conversationId, title: $title, messages: $messages, abstractList: $abstractList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForwardMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality().equals(
              other._abstractList,
              _abstractList,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    senderId,
    senderName,
    senderAvatar,
    timestamp,
    direction,
    status,
    conversationId,
    title,
    const DeepCollectionEquality().hash(_messages),
    const DeepCollectionEquality().hash(_abstractList),
  );

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForwardMessageImplCopyWith<_$ForwardMessageImpl> get copyWith =>
      __$$ForwardMessageImplCopyWithImpl<_$ForwardMessageImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )
    text,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    image,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )
    voice,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    video,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )
    file,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )
    location,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )
    card,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )
    redPacket,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )
    transfer,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )
    forward,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )
    custom,
  }) {
    return forward(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      title,
      messages,
      abstractList,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
  }) {
    return forward?.call(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      title,
      messages,
      abstractList,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
    required TResult orElse(),
  }) {
    if (forward != null) {
      return forward(
        id,
        senderId,
        senderName,
        senderAvatar,
        timestamp,
        direction,
        status,
        conversationId,
        title,
        messages,
        abstractList,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextMessage value) text,
    required TResult Function(ImageMessage value) image,
    required TResult Function(VoiceMessage value) voice,
    required TResult Function(VideoMessage value) video,
    required TResult Function(FileMessage value) file,
    required TResult Function(LocationMessage value) location,
    required TResult Function(CardMessage value) card,
    required TResult Function(RedPacketMessage value) redPacket,
    required TResult Function(TransferMessage value) transfer,
    required TResult Function(ForwardMessage value) forward,
    required TResult Function(CustomMessage value) custom,
  }) {
    return forward(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextMessage value)? text,
    TResult? Function(ImageMessage value)? image,
    TResult? Function(VoiceMessage value)? voice,
    TResult? Function(VideoMessage value)? video,
    TResult? Function(FileMessage value)? file,
    TResult? Function(LocationMessage value)? location,
    TResult? Function(CardMessage value)? card,
    TResult? Function(RedPacketMessage value)? redPacket,
    TResult? Function(TransferMessage value)? transfer,
    TResult? Function(ForwardMessage value)? forward,
    TResult? Function(CustomMessage value)? custom,
  }) {
    return forward?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextMessage value)? text,
    TResult Function(ImageMessage value)? image,
    TResult Function(VoiceMessage value)? voice,
    TResult Function(VideoMessage value)? video,
    TResult Function(FileMessage value)? file,
    TResult Function(LocationMessage value)? location,
    TResult Function(CardMessage value)? card,
    TResult Function(RedPacketMessage value)? redPacket,
    TResult Function(TransferMessage value)? transfer,
    TResult Function(ForwardMessage value)? forward,
    TResult Function(CustomMessage value)? custom,
    required TResult orElse(),
  }) {
    if (forward != null) {
      return forward(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ForwardMessageImplToJson(this);
  }
}

abstract class ForwardMessage extends IMMessage {
  const factory ForwardMessage({
    required final String id,
    required final String senderId,
    required final String senderName,
    final String? senderAvatar,
    required final DateTime timestamp,
    final MessageDirection direction,
    final MessageStatus status,
    final String? conversationId,
    required final String title,
    required final List<ForwardMessageItem> messages,
    final List<String> abstractList,
  }) = _$ForwardMessageImpl;
  const ForwardMessage._() : super._();

  factory ForwardMessage.fromJson(Map<String, dynamic> json) =
      _$ForwardMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderAvatar;
  @override
  DateTime get timestamp;
  @override
  MessageDirection get direction;
  @override
  MessageStatus get status;
  @override
  String? get conversationId; // 合并转发特有字段
  String get title;
  List<ForwardMessageItem> get messages;
  List<String> get abstractList;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForwardMessageImplCopyWith<_$ForwardMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomMessageImplCopyWith<$Res>
    implements $IMMessageCopyWith<$Res> {
  factory _$$CustomMessageImplCopyWith(
    _$CustomMessageImpl value,
    $Res Function(_$CustomMessageImpl) then,
  ) = __$$CustomMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String senderId,
    String senderName,
    String? senderAvatar,
    DateTime timestamp,
    MessageDirection direction,
    MessageStatus status,
    String? conversationId,
    String customType,
    Map<String, dynamic> data,
  });
}

/// @nodoc
class __$$CustomMessageImplCopyWithImpl<$Res>
    extends _$IMMessageCopyWithImpl<$Res, _$CustomMessageImpl>
    implements _$$CustomMessageImplCopyWith<$Res> {
  __$$CustomMessageImplCopyWithImpl(
    _$CustomMessageImpl _value,
    $Res Function(_$CustomMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? senderAvatar = freezed,
    Object? timestamp = null,
    Object? direction = null,
    Object? status = null,
    Object? conversationId = freezed,
    Object? customType = null,
    Object? data = null,
  }) {
    return _then(
      _$CustomMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        senderAvatar: freezed == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as MessageDirection,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MessageStatus,
        conversationId: freezed == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        customType: null == customType
            ? _value.customType
            : customType // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomMessageImpl extends CustomMessage {
  const _$CustomMessageImpl({
    required this.id,
    required this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    this.direction = MessageDirection.send,
    this.status = MessageStatus.sending,
    this.conversationId,
    required this.customType,
    required final Map<String, dynamic> data,
    final String? $type,
  }) : _data = data,
       $type = $type ?? 'custom',
       super._();

  factory _$CustomMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderName;
  @override
  final String? senderAvatar;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final MessageDirection direction;
  @override
  @JsonKey()
  final MessageStatus status;
  @override
  final String? conversationId;
  // 自定义消息字段
  @override
  final String customType;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IMMessage.custom(id: $id, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp, direction: $direction, status: $status, conversationId: $conversationId, customType: $customType, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.customType, customType) ||
                other.customType == customType) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    senderId,
    senderName,
    senderAvatar,
    timestamp,
    direction,
    status,
    conversationId,
    customType,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomMessageImplCopyWith<_$CustomMessageImpl> get copyWith =>
      __$$CustomMessageImplCopyWithImpl<_$CustomMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )
    text,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    image,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )
    voice,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )
    video,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )
    file,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )
    location,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )
    card,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )
    redPacket,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )
    transfer,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )
    forward,
    required TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )
    custom,
  }) {
    return custom(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      customType,
      data,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult? Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
  }) {
    return custom?.call(
      id,
      senderId,
      senderName,
      senderAvatar,
      timestamp,
      direction,
      status,
      conversationId,
      customType,
      data,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String content,
      bool isAtAll,
      List<String> atUserIds,
    )?
    text,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    image,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      int duration,
      bool isPlayed,
      String? localPath,
    )?
    voice,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String? thumbnailUrl,
      int duration,
      int? width,
      int? height,
      int? fileSize,
      String? localPath,
    )?
    video,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String url,
      String fileName,
      int fileSize,
      String? fileExtension,
      String? localPath,
      double downloadProgress,
    )?
    file,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      double latitude,
      double longitude,
      String address,
      String? name,
      String? coverUrl,
    )?
    location,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String userId,
      String userName,
      String? userAvatar,
      String? userSignature,
    )?
    card,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String redPacketId,
      String greeting,
      bool isOpened,
      bool isExpired,
    )?
    redPacket,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String transferId,
      double amount,
      String? remark,
      bool isReceived,
      bool isExpired,
    )?
    transfer,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String title,
      List<ForwardMessageItem> messages,
      List<String> abstractList,
    )?
    forward,
    TResult Function(
      String id,
      String senderId,
      String senderName,
      String? senderAvatar,
      DateTime timestamp,
      MessageDirection direction,
      MessageStatus status,
      String? conversationId,
      String customType,
      Map<String, dynamic> data,
    )?
    custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(
        id,
        senderId,
        senderName,
        senderAvatar,
        timestamp,
        direction,
        status,
        conversationId,
        customType,
        data,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextMessage value) text,
    required TResult Function(ImageMessage value) image,
    required TResult Function(VoiceMessage value) voice,
    required TResult Function(VideoMessage value) video,
    required TResult Function(FileMessage value) file,
    required TResult Function(LocationMessage value) location,
    required TResult Function(CardMessage value) card,
    required TResult Function(RedPacketMessage value) redPacket,
    required TResult Function(TransferMessage value) transfer,
    required TResult Function(ForwardMessage value) forward,
    required TResult Function(CustomMessage value) custom,
  }) {
    return custom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextMessage value)? text,
    TResult? Function(ImageMessage value)? image,
    TResult? Function(VoiceMessage value)? voice,
    TResult? Function(VideoMessage value)? video,
    TResult? Function(FileMessage value)? file,
    TResult? Function(LocationMessage value)? location,
    TResult? Function(CardMessage value)? card,
    TResult? Function(RedPacketMessage value)? redPacket,
    TResult? Function(TransferMessage value)? transfer,
    TResult? Function(ForwardMessage value)? forward,
    TResult? Function(CustomMessage value)? custom,
  }) {
    return custom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextMessage value)? text,
    TResult Function(ImageMessage value)? image,
    TResult Function(VoiceMessage value)? voice,
    TResult Function(VideoMessage value)? video,
    TResult Function(FileMessage value)? file,
    TResult Function(LocationMessage value)? location,
    TResult Function(CardMessage value)? card,
    TResult Function(RedPacketMessage value)? redPacket,
    TResult Function(TransferMessage value)? transfer,
    TResult Function(ForwardMessage value)? forward,
    TResult Function(CustomMessage value)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomMessageImplToJson(this);
  }
}

abstract class CustomMessage extends IMMessage {
  const factory CustomMessage({
    required final String id,
    required final String senderId,
    required final String senderName,
    final String? senderAvatar,
    required final DateTime timestamp,
    final MessageDirection direction,
    final MessageStatus status,
    final String? conversationId,
    required final String customType,
    required final Map<String, dynamic> data,
  }) = _$CustomMessageImpl;
  const CustomMessage._() : super._();

  factory CustomMessage.fromJson(Map<String, dynamic> json) =
      _$CustomMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String? get senderAvatar;
  @override
  DateTime get timestamp;
  @override
  MessageDirection get direction;
  @override
  MessageStatus get status;
  @override
  String? get conversationId; // 自定义消息字段
  String get customType;
  Map<String, dynamic> get data;

  /// Create a copy of IMMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomMessageImplCopyWith<_$CustomMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForwardMessageItem _$ForwardMessageItemFromJson(Map<String, dynamic> json) {
  return _ForwardMessageItem.fromJson(json);
}

/// @nodoc
mixin _$ForwardMessageItem {
  String get senderName => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;

  /// Serializes this ForwardMessageItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForwardMessageItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForwardMessageItemCopyWith<ForwardMessageItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForwardMessageItemCopyWith<$Res> {
  factory $ForwardMessageItemCopyWith(
    ForwardMessageItem value,
    $Res Function(ForwardMessageItem) then,
  ) = _$ForwardMessageItemCopyWithImpl<$Res, ForwardMessageItem>;
  @useResult
  $Res call({String senderName, String content, MessageType type});
}

/// @nodoc
class _$ForwardMessageItemCopyWithImpl<$Res, $Val extends ForwardMessageItem>
    implements $ForwardMessageItemCopyWith<$Res> {
  _$ForwardMessageItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForwardMessageItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderName = null,
    Object? content = null,
    Object? type = null,
  }) {
    return _then(
      _value.copyWith(
            senderName: null == senderName
                ? _value.senderName
                : senderName // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as MessageType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForwardMessageItemImplCopyWith<$Res>
    implements $ForwardMessageItemCopyWith<$Res> {
  factory _$$ForwardMessageItemImplCopyWith(
    _$ForwardMessageItemImpl value,
    $Res Function(_$ForwardMessageItemImpl) then,
  ) = __$$ForwardMessageItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String senderName, String content, MessageType type});
}

/// @nodoc
class __$$ForwardMessageItemImplCopyWithImpl<$Res>
    extends _$ForwardMessageItemCopyWithImpl<$Res, _$ForwardMessageItemImpl>
    implements _$$ForwardMessageItemImplCopyWith<$Res> {
  __$$ForwardMessageItemImplCopyWithImpl(
    _$ForwardMessageItemImpl _value,
    $Res Function(_$ForwardMessageItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForwardMessageItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderName = null,
    Object? content = null,
    Object? type = null,
  }) {
    return _then(
      _$ForwardMessageItemImpl(
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as MessageType,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForwardMessageItemImpl implements _ForwardMessageItem {
  const _$ForwardMessageItemImpl({
    required this.senderName,
    required this.content,
    required this.type,
  });

  factory _$ForwardMessageItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForwardMessageItemImplFromJson(json);

  @override
  final String senderName;
  @override
  final String content;
  @override
  final MessageType type;

  @override
  String toString() {
    return 'ForwardMessageItem(senderName: $senderName, content: $content, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForwardMessageItemImpl &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, senderName, content, type);

  /// Create a copy of ForwardMessageItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForwardMessageItemImplCopyWith<_$ForwardMessageItemImpl> get copyWith =>
      __$$ForwardMessageItemImplCopyWithImpl<_$ForwardMessageItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ForwardMessageItemImplToJson(this);
  }
}

abstract class _ForwardMessageItem implements ForwardMessageItem {
  const factory _ForwardMessageItem({
    required final String senderName,
    required final String content,
    required final MessageType type,
  }) = _$ForwardMessageItemImpl;

  factory _ForwardMessageItem.fromJson(Map<String, dynamic> json) =
      _$ForwardMessageItemImpl.fromJson;

  @override
  String get senderName;
  @override
  String get content;
  @override
  MessageType get type;

  /// Create a copy of ForwardMessageItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForwardMessageItemImplCopyWith<_$ForwardMessageItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
