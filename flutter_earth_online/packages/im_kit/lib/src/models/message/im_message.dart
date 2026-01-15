import 'package:freezed_annotation/freezed_annotation.dart';

part 'im_message.freezed.dart';
part 'im_message.g.dart';

/// 消息状态枚举
enum MessageStatus {
  /// 发送中
  sending,

  /// 已发送
  sent,

  /// 已送达
  delivered,

  /// 已读
  read,

  /// 发送失败
  failed,
}

/// 消息方向
enum MessageDirection {
  /// 发送
  send,

  /// 接收
  receive,
}

/// 消息类型枚举
enum MessageType {
  text,
  image,
  voice,
  video,
  file,
  location,
  card,
  redPacket,
  transfer,
  forward,
  custom,
}

/// IM 消息基础模型
/// 使用 Freezed union type 实现多消息类型
@Freezed(unionKey: 'type')
sealed class IMMessage with _$IMMessage {
  const IMMessage._();

  /// 文本消息
  @FreezedUnionValue('text')
  const factory IMMessage.text({
    required String id,
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    @Default(MessageDirection.send) MessageDirection direction,
    @Default(MessageStatus.sending) MessageStatus status,
    String? conversationId,
    // 文本特有字段
    required String content,
    @Default(false) bool isAtAll,
    @Default([]) List<String> atUserIds,
  }) = TextMessage;

  /// 图片消息
  @FreezedUnionValue('image')
  const factory IMMessage.image({
    required String id,
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    @Default(MessageDirection.send) MessageDirection direction,
    @Default(MessageStatus.sending) MessageStatus status,
    String? conversationId,
    // 图片特有字段
    required String url,
    String? thumbnailUrl,
    int? width,
    int? height,
    int? fileSize,
    String? localPath,
  }) = ImageMessage;

  /// 语音消息
  @FreezedUnionValue('voice')
  const factory IMMessage.voice({
    required String id,
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    @Default(MessageDirection.send) MessageDirection direction,
    @Default(MessageStatus.sending) MessageStatus status,
    String? conversationId,
    // 语音特有字段
    required String url,
    required int duration, // 秒
    @Default(false) bool isPlayed,
    String? localPath,
  }) = VoiceMessage;

  /// 视频消息
  @FreezedUnionValue('video')
  const factory IMMessage.video({
    required String id,
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    @Default(MessageDirection.send) MessageDirection direction,
    @Default(MessageStatus.sending) MessageStatus status,
    String? conversationId,
    // 视频特有字段
    required String url,
    String? thumbnailUrl,
    required int duration, // 秒
    int? width,
    int? height,
    int? fileSize,
    String? localPath,
  }) = VideoMessage;

  /// 文件消息
  @FreezedUnionValue('file')
  const factory IMMessage.file({
    required String id,
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    @Default(MessageDirection.send) MessageDirection direction,
    @Default(MessageStatus.sending) MessageStatus status,
    String? conversationId,
    // 文件特有字段
    required String url,
    required String fileName,
    required int fileSize,
    String? fileExtension,
    String? localPath,
    @Default(0) double downloadProgress,
  }) = FileMessage;

  /// 位置消息
  @FreezedUnionValue('location')
  const factory IMMessage.location({
    required String id,
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    @Default(MessageDirection.send) MessageDirection direction,
    @Default(MessageStatus.sending) MessageStatus status,
    String? conversationId,
    // 位置特有字段
    required double latitude,
    required double longitude,
    required String address,
    String? name,
    String? coverUrl,
  }) = LocationMessage;

  /// 名片消息
  @FreezedUnionValue('card')
  const factory IMMessage.card({
    required String id,
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    @Default(MessageDirection.send) MessageDirection direction,
    @Default(MessageStatus.sending) MessageStatus status,
    String? conversationId,
    // 名片特有字段
    required String userId,
    required String userName,
    String? userAvatar,
    String? userSignature,
  }) = CardMessage;

  /// 红包消息
  @FreezedUnionValue('redPacket')
  const factory IMMessage.redPacket({
    required String id,
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    @Default(MessageDirection.send) MessageDirection direction,
    @Default(MessageStatus.sending) MessageStatus status,
    String? conversationId,
    // 红包特有字段
    required String redPacketId,
    required String greeting,
    @Default(false) bool isOpened,
    @Default(false) bool isExpired,
  }) = RedPacketMessage;

  /// 转账消息
  @FreezedUnionValue('transfer')
  const factory IMMessage.transfer({
    required String id,
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    @Default(MessageDirection.send) MessageDirection direction,
    @Default(MessageStatus.sending) MessageStatus status,
    String? conversationId,
    // 转账特有字段
    required String transferId,
    required double amount,
    String? remark,
    @Default(false) bool isReceived,
    @Default(false) bool isExpired,
  }) = TransferMessage;

  /// 合并转发消息
  @FreezedUnionValue('forward')
  const factory IMMessage.forward({
    required String id,
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    @Default(MessageDirection.send) MessageDirection direction,
    @Default(MessageStatus.sending) MessageStatus status,
    String? conversationId,
    // 合并转发特有字段
    required String title,
    required List<ForwardMessageItem> messages,
    @Default([]) List<String> abstractList, // 摘要列表
  }) = ForwardMessage;

  /// 自定义消息
  @FreezedUnionValue('custom')
  const factory IMMessage.custom({
    required String id,
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required DateTime timestamp,
    @Default(MessageDirection.send) MessageDirection direction,
    @Default(MessageStatus.sending) MessageStatus status,
    String? conversationId,
    // 自定义消息字段
    required String customType,
    required Map<String, dynamic> data,
  }) = CustomMessage;

  /// 获取消息类型
  MessageType get messageType => map(
        text: (_) => MessageType.text,
        image: (_) => MessageType.image,
        voice: (_) => MessageType.voice,
        video: (_) => MessageType.video,
        file: (_) => MessageType.file,
        location: (_) => MessageType.location,
        card: (_) => MessageType.card,
        redPacket: (_) => MessageType.redPacket,
        transfer: (_) => MessageType.transfer,
        forward: (_) => MessageType.forward,
        custom: (_) => MessageType.custom,
      );

  /// 是否为自己发送
  bool get isSelf => direction == MessageDirection.send;

  /// 是否发送成功
  bool get isSent =>
      status == MessageStatus.sent ||
      status == MessageStatus.delivered ||
      status == MessageStatus.read;

  /// 是否发送失败
  bool get isFailed => status == MessageStatus.failed;

  /// 是否正在发送
  bool get isSending => status == MessageStatus.sending;

  factory IMMessage.fromJson(Map<String, dynamic> json) =>
      _$IMMessageFromJson(json);
}

/// 合并转发消息项（简化版本，用于转发消息内部）
@freezed
class ForwardMessageItem with _$ForwardMessageItem {
  const factory ForwardMessageItem({
    required String senderName,
    required String content,
    required MessageType type,
  }) = _ForwardMessageItem;

  factory ForwardMessageItem.fromJson(Map<String, dynamic> json) =>
      _$ForwardMessageItemFromJson(json);
}
