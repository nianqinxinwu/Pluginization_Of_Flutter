import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/keyboard/emoji_data.dart';

part 'emoji_provider.g.dart';

/// 表情数据 Provider
@Riverpod(keepAlive: true)
class EmojiDataNotifier extends _$EmojiDataNotifier {
  @override
  List<EmojiCategory> build() {
    // 初始化时加载默认表情
    return _getDefaultCategories();
  }

  /// 添加自定义表情分类
  void addCategory(EmojiCategory category) {
    state = [...state, category];
  }

  /// 移除表情分类
  void removeCategory(String categoryId) {
    state = state.where((c) => c.id != categoryId).toList();
  }

  /// 更新表情分类
  void updateCategory(EmojiCategory category) {
    final index = state.indexWhere((c) => c.id == category.id);
    if (index != -1) {
      final categories = [...state];
      categories[index] = category;
      state = categories;
    }
  }

  /// 获取默认表情分类
  List<EmojiCategory> _getDefaultCategories() {
    return EmojiCategory.defaultCategories();
  }
}

/// 最近使用表情 Provider
@Riverpod(keepAlive: true)
class RecentEmojisNotifier extends _$RecentEmojisNotifier {
  @override
  RecentEmojis build() {
    return const RecentEmojis();
  }

  /// 添加到最近使用
  void addEmoji(EmojiItem emoji) {
    state = state.addEmoji(emoji);
  }

  /// 清空最近使用
  void clear() {
    state = const RecentEmojis();
  }
}

/// 当前选中的表情分类索引
@riverpod
class SelectedEmojiCategory extends _$SelectedEmojiCategory {
  @override
  int build() => 0;

  void select(int index) {
    state = index;
  }
}
