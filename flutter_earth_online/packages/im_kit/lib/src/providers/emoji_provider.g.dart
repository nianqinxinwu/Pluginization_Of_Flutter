// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$emojiDataNotifierHash() => r'053e8667e8b60b74a97f83d543b7d47a8db3d798';

/// 表情数据 Provider
///
/// Copied from [EmojiDataNotifier].
@ProviderFor(EmojiDataNotifier)
final emojiDataNotifierProvider =
    NotifierProvider<EmojiDataNotifier, List<EmojiCategory>>.internal(
      EmojiDataNotifier.new,
      name: r'emojiDataNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$emojiDataNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$EmojiDataNotifier = Notifier<List<EmojiCategory>>;
String _$recentEmojisNotifierHash() =>
    r'431afa57b5af5bbf49cc6af0cad1fcd742becdf9';

/// 最近使用表情 Provider
///
/// Copied from [RecentEmojisNotifier].
@ProviderFor(RecentEmojisNotifier)
final recentEmojisNotifierProvider =
    NotifierProvider<RecentEmojisNotifier, RecentEmojis>.internal(
      RecentEmojisNotifier.new,
      name: r'recentEmojisNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$recentEmojisNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RecentEmojisNotifier = Notifier<RecentEmojis>;
String _$selectedEmojiCategoryHash() =>
    r'441cd2239983efe198cd19411059cb6f0cad7a05';

/// 当前选中的表情分类索引
///
/// Copied from [SelectedEmojiCategory].
@ProviderFor(SelectedEmojiCategory)
final selectedEmojiCategoryProvider =
    AutoDisposeNotifierProvider<SelectedEmojiCategory, int>.internal(
      SelectedEmojiCategory.new,
      name: r'selectedEmojiCategoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$selectedEmojiCategoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedEmojiCategory = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
