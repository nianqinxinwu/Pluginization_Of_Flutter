// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'im_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextMessageImpl _$$TextMessageImplFromJson(Map<String, dynamic> json) =>
    _$TextMessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderAvatar: json['senderAvatar'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      direction:
          $enumDecodeNullable(_$MessageDirectionEnumMap, json['direction']) ??
          MessageDirection.send,
      status:
          $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sending,
      conversationId: json['conversationId'] as String?,
      content: json['content'] as String,
      isAtAll: json['isAtAll'] as bool? ?? false,
      atUserIds:
          (json['atUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$TextMessageImplToJson(_$TextMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderAvatar': instance.senderAvatar,
      'timestamp': instance.timestamp.toIso8601String(),
      'direction': _$MessageDirectionEnumMap[instance.direction]!,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'conversationId': instance.conversationId,
      'content': instance.content,
      'isAtAll': instance.isAtAll,
      'atUserIds': instance.atUserIds,
      'type': instance.$type,
    };

const _$MessageDirectionEnumMap = {
  MessageDirection.send: 'send',
  MessageDirection.receive: 'receive',
};

const _$MessageStatusEnumMap = {
  MessageStatus.sending: 'sending',
  MessageStatus.sent: 'sent',
  MessageStatus.delivered: 'delivered',
  MessageStatus.read: 'read',
  MessageStatus.failed: 'failed',
};

_$ImageMessageImpl _$$ImageMessageImplFromJson(Map<String, dynamic> json) =>
    _$ImageMessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderAvatar: json['senderAvatar'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      direction:
          $enumDecodeNullable(_$MessageDirectionEnumMap, json['direction']) ??
          MessageDirection.send,
      status:
          $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sending,
      conversationId: json['conversationId'] as String?,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      fileSize: (json['fileSize'] as num?)?.toInt(),
      localPath: json['localPath'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ImageMessageImplToJson(_$ImageMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderAvatar': instance.senderAvatar,
      'timestamp': instance.timestamp.toIso8601String(),
      'direction': _$MessageDirectionEnumMap[instance.direction]!,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'conversationId': instance.conversationId,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'width': instance.width,
      'height': instance.height,
      'fileSize': instance.fileSize,
      'localPath': instance.localPath,
      'type': instance.$type,
    };

_$VoiceMessageImpl _$$VoiceMessageImplFromJson(Map<String, dynamic> json) =>
    _$VoiceMessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderAvatar: json['senderAvatar'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      direction:
          $enumDecodeNullable(_$MessageDirectionEnumMap, json['direction']) ??
          MessageDirection.send,
      status:
          $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sending,
      conversationId: json['conversationId'] as String?,
      url: json['url'] as String,
      duration: (json['duration'] as num).toInt(),
      isPlayed: json['isPlayed'] as bool? ?? false,
      localPath: json['localPath'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$VoiceMessageImplToJson(_$VoiceMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderAvatar': instance.senderAvatar,
      'timestamp': instance.timestamp.toIso8601String(),
      'direction': _$MessageDirectionEnumMap[instance.direction]!,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'conversationId': instance.conversationId,
      'url': instance.url,
      'duration': instance.duration,
      'isPlayed': instance.isPlayed,
      'localPath': instance.localPath,
      'type': instance.$type,
    };

_$VideoMessageImpl _$$VideoMessageImplFromJson(Map<String, dynamic> json) =>
    _$VideoMessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderAvatar: json['senderAvatar'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      direction:
          $enumDecodeNullable(_$MessageDirectionEnumMap, json['direction']) ??
          MessageDirection.send,
      status:
          $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sending,
      conversationId: json['conversationId'] as String?,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      duration: (json['duration'] as num).toInt(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      fileSize: (json['fileSize'] as num?)?.toInt(),
      localPath: json['localPath'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$VideoMessageImplToJson(_$VideoMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderAvatar': instance.senderAvatar,
      'timestamp': instance.timestamp.toIso8601String(),
      'direction': _$MessageDirectionEnumMap[instance.direction]!,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'conversationId': instance.conversationId,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'duration': instance.duration,
      'width': instance.width,
      'height': instance.height,
      'fileSize': instance.fileSize,
      'localPath': instance.localPath,
      'type': instance.$type,
    };

_$FileMessageImpl _$$FileMessageImplFromJson(Map<String, dynamic> json) =>
    _$FileMessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderAvatar: json['senderAvatar'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      direction:
          $enumDecodeNullable(_$MessageDirectionEnumMap, json['direction']) ??
          MessageDirection.send,
      status:
          $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sending,
      conversationId: json['conversationId'] as String?,
      url: json['url'] as String,
      fileName: json['fileName'] as String,
      fileSize: (json['fileSize'] as num).toInt(),
      fileExtension: json['fileExtension'] as String?,
      localPath: json['localPath'] as String?,
      downloadProgress: (json['downloadProgress'] as num?)?.toDouble() ?? 0,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FileMessageImplToJson(_$FileMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderAvatar': instance.senderAvatar,
      'timestamp': instance.timestamp.toIso8601String(),
      'direction': _$MessageDirectionEnumMap[instance.direction]!,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'conversationId': instance.conversationId,
      'url': instance.url,
      'fileName': instance.fileName,
      'fileSize': instance.fileSize,
      'fileExtension': instance.fileExtension,
      'localPath': instance.localPath,
      'downloadProgress': instance.downloadProgress,
      'type': instance.$type,
    };

_$LocationMessageImpl _$$LocationMessageImplFromJson(
  Map<String, dynamic> json,
) => _$LocationMessageImpl(
  id: json['id'] as String,
  senderId: json['senderId'] as String,
  senderName: json['senderName'] as String,
  senderAvatar: json['senderAvatar'] as String?,
  timestamp: DateTime.parse(json['timestamp'] as String),
  direction:
      $enumDecodeNullable(_$MessageDirectionEnumMap, json['direction']) ??
      MessageDirection.send,
  status:
      $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
      MessageStatus.sending,
  conversationId: json['conversationId'] as String?,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  address: json['address'] as String,
  name: json['name'] as String?,
  coverUrl: json['coverUrl'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$$LocationMessageImplToJson(
  _$LocationMessageImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'senderId': instance.senderId,
  'senderName': instance.senderName,
  'senderAvatar': instance.senderAvatar,
  'timestamp': instance.timestamp.toIso8601String(),
  'direction': _$MessageDirectionEnumMap[instance.direction]!,
  'status': _$MessageStatusEnumMap[instance.status]!,
  'conversationId': instance.conversationId,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'address': instance.address,
  'name': instance.name,
  'coverUrl': instance.coverUrl,
  'type': instance.$type,
};

_$CardMessageImpl _$$CardMessageImplFromJson(Map<String, dynamic> json) =>
    _$CardMessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderAvatar: json['senderAvatar'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      direction:
          $enumDecodeNullable(_$MessageDirectionEnumMap, json['direction']) ??
          MessageDirection.send,
      status:
          $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sending,
      conversationId: json['conversationId'] as String?,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userAvatar: json['userAvatar'] as String?,
      userSignature: json['userSignature'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$CardMessageImplToJson(_$CardMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderAvatar': instance.senderAvatar,
      'timestamp': instance.timestamp.toIso8601String(),
      'direction': _$MessageDirectionEnumMap[instance.direction]!,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'conversationId': instance.conversationId,
      'userId': instance.userId,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'userSignature': instance.userSignature,
      'type': instance.$type,
    };

_$RedPacketMessageImpl _$$RedPacketMessageImplFromJson(
  Map<String, dynamic> json,
) => _$RedPacketMessageImpl(
  id: json['id'] as String,
  senderId: json['senderId'] as String,
  senderName: json['senderName'] as String,
  senderAvatar: json['senderAvatar'] as String?,
  timestamp: DateTime.parse(json['timestamp'] as String),
  direction:
      $enumDecodeNullable(_$MessageDirectionEnumMap, json['direction']) ??
      MessageDirection.send,
  status:
      $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
      MessageStatus.sending,
  conversationId: json['conversationId'] as String?,
  redPacketId: json['redPacketId'] as String,
  greeting: json['greeting'] as String,
  isOpened: json['isOpened'] as bool? ?? false,
  isExpired: json['isExpired'] as bool? ?? false,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$$RedPacketMessageImplToJson(
  _$RedPacketMessageImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'senderId': instance.senderId,
  'senderName': instance.senderName,
  'senderAvatar': instance.senderAvatar,
  'timestamp': instance.timestamp.toIso8601String(),
  'direction': _$MessageDirectionEnumMap[instance.direction]!,
  'status': _$MessageStatusEnumMap[instance.status]!,
  'conversationId': instance.conversationId,
  'redPacketId': instance.redPacketId,
  'greeting': instance.greeting,
  'isOpened': instance.isOpened,
  'isExpired': instance.isExpired,
  'type': instance.$type,
};

_$TransferMessageImpl _$$TransferMessageImplFromJson(
  Map<String, dynamic> json,
) => _$TransferMessageImpl(
  id: json['id'] as String,
  senderId: json['senderId'] as String,
  senderName: json['senderName'] as String,
  senderAvatar: json['senderAvatar'] as String?,
  timestamp: DateTime.parse(json['timestamp'] as String),
  direction:
      $enumDecodeNullable(_$MessageDirectionEnumMap, json['direction']) ??
      MessageDirection.send,
  status:
      $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
      MessageStatus.sending,
  conversationId: json['conversationId'] as String?,
  transferId: json['transferId'] as String,
  amount: (json['amount'] as num).toDouble(),
  remark: json['remark'] as String?,
  isReceived: json['isReceived'] as bool? ?? false,
  isExpired: json['isExpired'] as bool? ?? false,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$$TransferMessageImplToJson(
  _$TransferMessageImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'senderId': instance.senderId,
  'senderName': instance.senderName,
  'senderAvatar': instance.senderAvatar,
  'timestamp': instance.timestamp.toIso8601String(),
  'direction': _$MessageDirectionEnumMap[instance.direction]!,
  'status': _$MessageStatusEnumMap[instance.status]!,
  'conversationId': instance.conversationId,
  'transferId': instance.transferId,
  'amount': instance.amount,
  'remark': instance.remark,
  'isReceived': instance.isReceived,
  'isExpired': instance.isExpired,
  'type': instance.$type,
};

_$ForwardMessageImpl _$$ForwardMessageImplFromJson(Map<String, dynamic> json) =>
    _$ForwardMessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderAvatar: json['senderAvatar'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      direction:
          $enumDecodeNullable(_$MessageDirectionEnumMap, json['direction']) ??
          MessageDirection.send,
      status:
          $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sending,
      conversationId: json['conversationId'] as String?,
      title: json['title'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ForwardMessageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      abstractList:
          (json['abstractList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ForwardMessageImplToJson(
  _$ForwardMessageImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'senderId': instance.senderId,
  'senderName': instance.senderName,
  'senderAvatar': instance.senderAvatar,
  'timestamp': instance.timestamp.toIso8601String(),
  'direction': _$MessageDirectionEnumMap[instance.direction]!,
  'status': _$MessageStatusEnumMap[instance.status]!,
  'conversationId': instance.conversationId,
  'title': instance.title,
  'messages': instance.messages,
  'abstractList': instance.abstractList,
  'type': instance.$type,
};

_$CustomMessageImpl _$$CustomMessageImplFromJson(Map<String, dynamic> json) =>
    _$CustomMessageImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderAvatar: json['senderAvatar'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      direction:
          $enumDecodeNullable(_$MessageDirectionEnumMap, json['direction']) ??
          MessageDirection.send,
      status:
          $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sending,
      conversationId: json['conversationId'] as String?,
      customType: json['customType'] as String,
      data: json['data'] as Map<String, dynamic>,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$CustomMessageImplToJson(_$CustomMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderAvatar': instance.senderAvatar,
      'timestamp': instance.timestamp.toIso8601String(),
      'direction': _$MessageDirectionEnumMap[instance.direction]!,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'conversationId': instance.conversationId,
      'customType': instance.customType,
      'data': instance.data,
      'type': instance.$type,
    };

_$ForwardMessageItemImpl _$$ForwardMessageItemImplFromJson(
  Map<String, dynamic> json,
) => _$ForwardMessageItemImpl(
  senderName: json['senderName'] as String,
  content: json['content'] as String,
  type: $enumDecode(_$MessageTypeEnumMap, json['type']),
);

Map<String, dynamic> _$$ForwardMessageItemImplToJson(
  _$ForwardMessageItemImpl instance,
) => <String, dynamic>{
  'senderName': instance.senderName,
  'content': instance.content,
  'type': _$MessageTypeEnumMap[instance.type]!,
};

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.voice: 'voice',
  MessageType.video: 'video',
  MessageType.file: 'file',
  MessageType.location: 'location',
  MessageType.card: 'card',
  MessageType.redPacket: 'redPacket',
  MessageType.transfer: 'transfer',
  MessageType.forward: 'forward',
  MessageType.custom: 'custom',
};
