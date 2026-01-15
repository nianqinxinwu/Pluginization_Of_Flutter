import 'package:freezed_annotation/freezed_annotation.dart';

part 'emoji_data.freezed.dart';
part 'emoji_data.g.dart';

/// 表情分类
@freezed
class EmojiCategory with _$EmojiCategory {
  const EmojiCategory._();

  const factory EmojiCategory({
    required String id,
    required String name,
    required String icon,
    required List<EmojiItem> emojis,
    @Default(false) bool isCustom,
  }) = _EmojiCategory;

  factory EmojiCategory.fromJson(Map<String, dynamic> json) =>
      _$EmojiCategoryFromJson(json);

  /// 创建最近使用分类
  factory EmojiCategory.recent(List<EmojiItem> emojis) {
    return EmojiCategory(
      id: 'recent',
      name: '最近使用',
      icon: '🕐',
      emojis: emojis,
    );
  }

  /// 创建默认表情分类
  factory EmojiCategory.faces() {
    return const EmojiCategory(
      id: 'faces',
      name: '表情',
      icon: '😀',
      emojis: [
        EmojiItem(code: 'smile', emoji: '😀'),
        EmojiItem(code: 'grin', emoji: '😄'),
        EmojiItem(code: 'joy', emoji: '😂'),
        EmojiItem(code: 'rofl', emoji: '🤣'),
        EmojiItem(code: 'wink', emoji: '😉'),
        EmojiItem(code: 'blush', emoji: '😊'),
        EmojiItem(code: 'innocent', emoji: '😇'),
        EmojiItem(code: 'love_eyes', emoji: '😍'),
        EmojiItem(code: 'star_eyes', emoji: '🤩'),
        EmojiItem(code: 'kiss', emoji: '😘'),
        EmojiItem(code: 'kissing', emoji: '😗'),
        EmojiItem(code: 'relaxed', emoji: '☺️'),
        EmojiItem(code: 'yum', emoji: '😋'),
        EmojiItem(code: 'stuck_out_tongue', emoji: '😛'),
        EmojiItem(code: 'stuck_out_tongue_wink', emoji: '😜'),
        EmojiItem(code: 'zany', emoji: '🤪'),
        EmojiItem(code: 'raised_eyebrow', emoji: '🤨'),
        EmojiItem(code: 'monocle', emoji: '🧐'),
        EmojiItem(code: 'nerd', emoji: '🤓'),
        EmojiItem(code: 'sunglasses', emoji: '😎'),
        EmojiItem(code: 'disguised', emoji: '🥸'),
        EmojiItem(code: 'partying', emoji: '🥳'),
        EmojiItem(code: 'smirk', emoji: '😏'),
        EmojiItem(code: 'unamused', emoji: '😒'),
        EmojiItem(code: 'disappointed', emoji: '😞'),
        EmojiItem(code: 'worried', emoji: '😟'),
        EmojiItem(code: 'confused', emoji: '😕'),
        EmojiItem(code: 'slight_frown', emoji: '🙁'),
        EmojiItem(code: 'frown', emoji: '☹️'),
        EmojiItem(code: 'persevere', emoji: '😣'),
        EmojiItem(code: 'confounded', emoji: '😖'),
        EmojiItem(code: 'tired', emoji: '😫'),
        EmojiItem(code: 'weary', emoji: '😩'),
        EmojiItem(code: 'pleading', emoji: '🥺'),
        EmojiItem(code: 'cry', emoji: '😢'),
        EmojiItem(code: 'sob', emoji: '😭'),
        EmojiItem(code: 'triumph', emoji: '😤'),
        EmojiItem(code: 'angry', emoji: '😠'),
        EmojiItem(code: 'rage', emoji: '😡'),
        EmojiItem(code: 'exploding_head', emoji: '🤯'),
        EmojiItem(code: 'flushed', emoji: '😳'),
        EmojiItem(code: 'hot', emoji: '🥵'),
        EmojiItem(code: 'cold', emoji: '🥶'),
        EmojiItem(code: 'scream', emoji: '😱'),
        EmojiItem(code: 'fearful', emoji: '😨'),
        EmojiItem(code: 'sweat', emoji: '😰'),
        EmojiItem(code: 'disappointed_relieved', emoji: '😥'),
        EmojiItem(code: 'thinking', emoji: '🤔'),
        EmojiItem(code: 'shushing', emoji: '🤫'),
        EmojiItem(code: 'lying', emoji: '🤥'),
        EmojiItem(code: 'no_mouth', emoji: '😶'),
        EmojiItem(code: 'neutral', emoji: '😐'),
        EmojiItem(code: 'expressionless', emoji: '😑'),
        EmojiItem(code: 'grimacing', emoji: '😬'),
        EmojiItem(code: 'rolling_eyes', emoji: '🙄'),
        EmojiItem(code: 'hushed', emoji: '😯'),
        EmojiItem(code: 'astonished', emoji: '😲'),
        EmojiItem(code: 'yawning', emoji: '🥱'),
        EmojiItem(code: 'sleeping', emoji: '😴'),
        EmojiItem(code: 'drooling', emoji: '🤤'),
        EmojiItem(code: 'mask', emoji: '😷'),
        EmojiItem(code: 'sick', emoji: '🤒'),
        EmojiItem(code: 'injured', emoji: '🤕'),
        EmojiItem(code: 'nauseated', emoji: '🤢'),
        EmojiItem(code: 'vomiting', emoji: '🤮'),
        EmojiItem(code: 'sneezing', emoji: '🤧'),
      ],
    );
  }

  /// 创建手势分类
  factory EmojiCategory.gestures() {
    return const EmojiCategory(
      id: 'gestures',
      name: '手势',
      icon: '👍',
      emojis: [
        EmojiItem(code: 'thumbsup', emoji: '👍'),
        EmojiItem(code: 'thumbsdown', emoji: '👎'),
        EmojiItem(code: 'ok_hand', emoji: '👌'),
        EmojiItem(code: 'pinch', emoji: '🤌'),
        EmojiItem(code: 'pinching', emoji: '🤏'),
        EmojiItem(code: 'victory', emoji: '✌️'),
        EmojiItem(code: 'crossed_fingers', emoji: '🤞'),
        EmojiItem(code: 'love_you', emoji: '🤟'),
        EmojiItem(code: 'rock', emoji: '🤘'),
        EmojiItem(code: 'call_me', emoji: '🤙'),
        EmojiItem(code: 'point_left', emoji: '👈'),
        EmojiItem(code: 'point_right', emoji: '👉'),
        EmojiItem(code: 'point_up', emoji: '👆'),
        EmojiItem(code: 'point_down', emoji: '👇'),
        EmojiItem(code: 'middle_finger', emoji: '🖕'),
        EmojiItem(code: 'raised_hand', emoji: '✋'),
        EmojiItem(code: 'raised_back', emoji: '🤚'),
        EmojiItem(code: 'wave', emoji: '👋'),
        EmojiItem(code: 'clap', emoji: '👏'),
        EmojiItem(code: 'open_hands', emoji: '👐'),
        EmojiItem(code: 'raised_hands', emoji: '🙌'),
        EmojiItem(code: 'palms_up', emoji: '🤲'),
        EmojiItem(code: 'pray', emoji: '🙏'),
        EmojiItem(code: 'handshake', emoji: '🤝'),
        EmojiItem(code: 'muscle', emoji: '💪'),
        EmojiItem(code: 'fist', emoji: '✊'),
        EmojiItem(code: 'fist_left', emoji: '🤛'),
        EmojiItem(code: 'fist_right', emoji: '🤜'),
      ],
    );
  }

  /// 创建心形/爱分类
  factory EmojiCategory.love() {
    return const EmojiCategory(
      id: 'love',
      name: '爱心',
      icon: '❤️',
      emojis: [
        EmojiItem(code: 'heart', emoji: '❤️'),
        EmojiItem(code: 'orange_heart', emoji: '🧡'),
        EmojiItem(code: 'yellow_heart', emoji: '💛'),
        EmojiItem(code: 'green_heart', emoji: '💚'),
        EmojiItem(code: 'blue_heart', emoji: '💙'),
        EmojiItem(code: 'purple_heart', emoji: '💜'),
        EmojiItem(code: 'brown_heart', emoji: '🤎'),
        EmojiItem(code: 'black_heart', emoji: '🖤'),
        EmojiItem(code: 'white_heart', emoji: '🤍'),
        EmojiItem(code: 'pink_heart', emoji: '🩷'),
        EmojiItem(code: 'broken_heart', emoji: '💔'),
        EmojiItem(code: 'heart_exclamation', emoji: '❣️'),
        EmojiItem(code: 'two_hearts', emoji: '💕'),
        EmojiItem(code: 'revolving_hearts', emoji: '💞'),
        EmojiItem(code: 'heartbeat', emoji: '💓'),
        EmojiItem(code: 'heartpulse', emoji: '💗'),
        EmojiItem(code: 'sparkling_heart', emoji: '💖'),
        EmojiItem(code: 'cupid', emoji: '💘'),
        EmojiItem(code: 'gift_heart', emoji: '💝'),
        EmojiItem(code: 'heart_decoration', emoji: '💟'),
        EmojiItem(code: 'kiss_mark', emoji: '💋'),
        EmojiItem(code: 'bouquet', emoji: '💐'),
        EmojiItem(code: 'rose', emoji: '🌹'),
        EmojiItem(code: 'tulip', emoji: '🌷'),
      ],
    );
  }

  /// 创建物品分类
  factory EmojiCategory.objects() {
    return const EmojiCategory(
      id: 'objects',
      name: '物品',
      icon: '🎁',
      emojis: [
        EmojiItem(code: 'gift', emoji: '🎁'),
        EmojiItem(code: 'red_envelope', emoji: '🧧'),
        EmojiItem(code: 'balloon', emoji: '🎈'),
        EmojiItem(code: 'party_popper', emoji: '🎉'),
        EmojiItem(code: 'confetti_ball', emoji: '🎊'),
        EmojiItem(code: 'sparkles', emoji: '✨'),
        EmojiItem(code: 'star', emoji: '⭐'),
        EmojiItem(code: 'fire', emoji: '🔥'),
        EmojiItem(code: 'zap', emoji: '⚡'),
        EmojiItem(code: 'rainbow', emoji: '🌈'),
        EmojiItem(code: 'sun', emoji: '☀️'),
        EmojiItem(code: 'moon', emoji: '🌙'),
        EmojiItem(code: 'cloud', emoji: '☁️'),
        EmojiItem(code: 'umbrella', emoji: '☂️'),
        EmojiItem(code: 'snowflake', emoji: '❄️'),
        EmojiItem(code: 'trophy', emoji: '🏆'),
        EmojiItem(code: 'medal', emoji: '🏅'),
        EmojiItem(code: 'crown', emoji: '👑'),
        EmojiItem(code: 'money_bag', emoji: '💰'),
        EmojiItem(code: 'money_wings', emoji: '💸'),
        EmojiItem(code: 'credit_card', emoji: '💳'),
        EmojiItem(code: 'gem', emoji: '💎'),
        EmojiItem(code: 'phone', emoji: '📱'),
        EmojiItem(code: 'laptop', emoji: '💻'),
        EmojiItem(code: 'camera', emoji: '📷'),
        EmojiItem(code: 'video_camera', emoji: '📹'),
        EmojiItem(code: 'microphone', emoji: '🎤'),
        EmojiItem(code: 'headphones', emoji: '🎧'),
      ],
    );
  }

  /// 获取默认表情分类列表
  static List<EmojiCategory> defaultCategories() {
    return [
      EmojiCategory.faces(),
      EmojiCategory.gestures(),
      EmojiCategory.love(),
      EmojiCategory.objects(),
    ];
  }
}

/// 表情项
@freezed
class EmojiItem with _$EmojiItem {
  const EmojiItem._();

  const factory EmojiItem({
    required String code, // 表情编码/标识
    required String emoji, // 表情内容 (Unicode 或自定义图片路径)
    String? name, // 表情名称
    @Default(false) bool isCustom, // 是否自定义表情
    String? imageUrl, // 自定义表情图片地址
  }) = _EmojiItem;

  factory EmojiItem.fromJson(Map<String, dynamic> json) =>
      _$EmojiItemFromJson(json);

  /// 是否是图片表情
  bool get isImageEmoji => isCustom && imageUrl != null;
}

/// 最近使用的表情
@freezed
class RecentEmojis with _$RecentEmojis {
  const RecentEmojis._();

  const factory RecentEmojis({
    @Default([]) List<EmojiItem> emojis,
    @Default(20) int maxCount,
  }) = _RecentEmojis;

  factory RecentEmojis.fromJson(Map<String, dynamic> json) =>
      _$RecentEmojisFromJson(json);

  /// 添加表情到最近使用
  RecentEmojis addEmoji(EmojiItem emoji) {
    final newEmojis = [...emojis];
    // 移除已存在的
    newEmojis.removeWhere((e) => e.code == emoji.code);
    // 添加到开头
    newEmojis.insert(0, emoji);
    // 限制数量
    if (newEmojis.length > maxCount) {
      return copyWith(emojis: newEmojis.sublist(0, maxCount));
    }
    return copyWith(emojis: newEmojis);
  }
}
