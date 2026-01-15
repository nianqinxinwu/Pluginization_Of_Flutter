import '../models/message/im_message.dart';

/// 消息辅助工具
class MessageHelper {
  MessageHelper._();

  /// 获取消息摘要（用于会话列表）
  static String getMessageAbstract(IMMessage message) {
    return message.map(
      text: (m) => m.content,
      image: (_) => '[图片]',
      voice: (m) => '[语音] ${m.duration}″',
      video: (_) => '[视频]',
      file: (m) => '[文件] ${m.fileName}',
      location: (m) => '[位置] ${m.name ?? m.address}',
      card: (m) => '[名片] ${m.userName}',
      redPacket: (m) => '[红包] ${m.greeting}',
      transfer: (m) => '[转账] ¥${m.amount.toStringAsFixed(2)}',
      forward: (m) => '[聊天记录] ${m.title}',
      custom: (m) => '[${m.customType}]',
    );
  }

  /// 生成消息ID
  static String generateMessageId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = (timestamp % 10000).toString().padLeft(4, '0');
    return '${timestamp}_$random';
  }

  /// 判断是否需要显示时间分隔
  static bool shouldShowTimeDivider(
    IMMessage current,
    IMMessage? previous, {
    int intervalMinutes = 5,
  }) {
    if (previous == null) return true;

    final diff = current.timestamp.difference(previous.timestamp).abs();
    return diff.inMinutes >= intervalMinutes;
  }

  /// 格式化文件大小
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// 获取文件图标
  static String getFileIcon(String? extension) {
    if (extension == null) return '📄';

    final ext = extension.toLowerCase();
    if (['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp'].contains(ext)) {
      return '🖼️';
    }
    if (['mp4', 'avi', 'mov', 'mkv', 'flv', 'wmv'].contains(ext)) {
      return '🎬';
    }
    if (['mp3', 'wav', 'aac', 'flac', 'ogg', 'm4a'].contains(ext)) {
      return '🎵';
    }
    if (['pdf'].contains(ext)) {
      return '📕';
    }
    if (['doc', 'docx'].contains(ext)) {
      return '📘';
    }
    if (['xls', 'xlsx'].contains(ext)) {
      return '📗';
    }
    if (['ppt', 'pptx'].contains(ext)) {
      return '📙';
    }
    if (['zip', 'rar', '7z', 'tar', 'gz'].contains(ext)) {
      return '📦';
    }
    if (['txt'].contains(ext)) {
      return '📝';
    }
    if (['apk'].contains(ext)) {
      return '📱';
    }
    return '📄';
  }

  /// 创建文本消息
  static TextMessage createTextMessage({
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required String content,
    String? conversationId,
    MessageDirection direction = MessageDirection.send,
    List<String> atUserIds = const [],
    bool isAtAll = false,
  }) {
    return TextMessage(
      id: generateMessageId(),
      senderId: senderId,
      senderName: senderName,
      senderAvatar: senderAvatar,
      timestamp: DateTime.now(),
      direction: direction,
      status: MessageStatus.sending,
      conversationId: conversationId,
      content: content,
      atUserIds: atUserIds,
      isAtAll: isAtAll,
    );
  }

  /// 创建图片消息
  static ImageMessage createImageMessage({
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required String url,
    String? thumbnailUrl,
    int? width,
    int? height,
    String? conversationId,
    MessageDirection direction = MessageDirection.send,
  }) {
    return ImageMessage(
      id: generateMessageId(),
      senderId: senderId,
      senderName: senderName,
      senderAvatar: senderAvatar,
      timestamp: DateTime.now(),
      direction: direction,
      status: MessageStatus.sending,
      conversationId: conversationId,
      url: url,
      thumbnailUrl: thumbnailUrl,
      width: width,
      height: height,
    );
  }

  /// 创建语音消息
  static VoiceMessage createVoiceMessage({
    required String senderId,
    required String senderName,
    String? senderAvatar,
    required String url,
    required int duration,
    String? conversationId,
    MessageDirection direction = MessageDirection.send,
  }) {
    return VoiceMessage(
      id: generateMessageId(),
      senderId: senderId,
      senderName: senderName,
      senderAvatar: senderAvatar,
      timestamp: DateTime.now(),
      direction: direction,
      status: MessageStatus.sending,
      conversationId: conversationId,
      url: url,
      duration: duration,
    );
  }
}
