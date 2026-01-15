// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentTabIndexHash() => r'e843f09d65a9719a14549874e1b2d5d74ea696a2';

/// 当前 Tab 索引状态
///
/// Copied from [CurrentTabIndex].
@ProviderFor(CurrentTabIndex)
final currentTabIndexProvider =
    AutoDisposeNotifierProvider<CurrentTabIndex, int>.internal(
      CurrentTabIndex.new,
      name: r'currentTabIndexProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentTabIndexHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CurrentTabIndex = AutoDisposeNotifier<int>;
String _$mainConfigHash() => r'1df1254fcf014d3d180a3e330459d88c2215b4d0';

/// 主模块配置状态
///
/// Copied from [MainConfig].
@ProviderFor(MainConfig)
final mainConfigProvider =
    AutoDisposeNotifierProvider<MainConfig, MainModuleConfig>.internal(
      MainConfig.new,
      name: r'mainConfigProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$mainConfigHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MainConfig = AutoDisposeNotifier<MainModuleConfig>;
String _$tabKeepAliveHash() => r'5cf39866a2d6e208bb16d6eb16250429d0ef4a10';

/// Tab 页面 KeepAlive 状态
///
/// Copied from [TabKeepAlive].
@ProviderFor(TabKeepAlive)
final tabKeepAliveProvider =
    AutoDisposeNotifierProvider<TabKeepAlive, List<bool>>.internal(
      TabKeepAlive.new,
      name: r'tabKeepAliveProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$tabKeepAliveHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TabKeepAlive = AutoDisposeNotifier<List<bool>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
