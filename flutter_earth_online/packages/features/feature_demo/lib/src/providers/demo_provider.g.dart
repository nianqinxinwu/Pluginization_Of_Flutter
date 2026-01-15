// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$demoNetworkHash() => r'67fdb01ff4fef15a1a261d591990309a6ccba012';

/// Demo 网络请求状态管理
///
/// Copied from [DemoNetwork].
@ProviderFor(DemoNetwork)
final demoNetworkProvider =
    AutoDisposeAsyncNotifierProvider<DemoNetwork, String?>.internal(
      DemoNetwork.new,
      name: r'demoNetworkProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$demoNetworkHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DemoNetwork = AutoDisposeAsyncNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
