import 'package:intl/intl.dart';

/// 时间格式化工具
class TimeFormatter {
  TimeFormatter._();

  /// 格式化消息时间
  /// 今天: HH:mm
  /// 昨天: 昨天 HH:mm
  /// 本周: 周X HH:mm
  /// 本年: MM-dd HH:mm
  /// 其他: yyyy-MM-dd HH:mm
  static String formatMessageTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (messageDate == today) {
      // 今天
      return DateFormat('HH:mm').format(dateTime);
    } else if (messageDate == yesterday) {
      // 昨天
      return '昨天 ${DateFormat('HH:mm').format(dateTime)}';
    } else if (now.difference(dateTime).inDays < 7) {
      // 本周
      return '${_getWeekDay(dateTime.weekday)} ${DateFormat('HH:mm').format(dateTime)}';
    } else if (dateTime.year == now.year) {
      // 本年
      return DateFormat('MM-dd HH:mm').format(dateTime);
    } else {
      // 其他
      return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    }
  }

  /// 格式化会话列表时间
  /// 今天: HH:mm
  /// 昨天: 昨天
  /// 本周: 周X
  /// 本年: MM-dd
  /// 其他: yyyy-MM-dd
  static String formatConversationTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (messageDate == today) {
      return DateFormat('HH:mm').format(dateTime);
    } else if (messageDate == yesterday) {
      return '昨天';
    } else if (now.difference(dateTime).inDays < 7) {
      return _getWeekDay(dateTime.weekday);
    } else if (dateTime.year == now.year) {
      return DateFormat('MM-dd').format(dateTime);
    } else {
      return DateFormat('yyyy-MM-dd').format(dateTime);
    }
  }

  /// 格式化语音时长
  static String formatVoiceDuration(int seconds) {
    if (seconds < 60) {
      return '$seconds″';
    }
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '$minutes′$secs″';
  }

  /// 格式化视频时长
  static String formatVideoDuration(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  /// 获取星期几
  static String _getWeekDay(int weekday) {
    const weekDays = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
    return weekDays[weekday - 1];
  }
}
