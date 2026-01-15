// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$inputNotifierHash() => r'42b0e6ee79d686665723b5b12798218fee72de1a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$InputNotifier
    extends BuildlessAutoDisposeNotifier<InputState> {
  late final String conversationId;

  InputState build(String conversationId);
}

/// 输入状态管理
///
/// Copied from [InputNotifier].
@ProviderFor(InputNotifier)
const inputNotifierProvider = InputNotifierFamily();

/// 输入状态管理
///
/// Copied from [InputNotifier].
class InputNotifierFamily extends Family<InputState> {
  /// 输入状态管理
  ///
  /// Copied from [InputNotifier].
  const InputNotifierFamily();

  /// 输入状态管理
  ///
  /// Copied from [InputNotifier].
  InputNotifierProvider call(String conversationId) {
    return InputNotifierProvider(conversationId);
  }

  @override
  InputNotifierProvider getProviderOverride(
    covariant InputNotifierProvider provider,
  ) {
    return call(provider.conversationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'inputNotifierProvider';
}

/// 输入状态管理
///
/// Copied from [InputNotifier].
class InputNotifierProvider
    extends AutoDisposeNotifierProviderImpl<InputNotifier, InputState> {
  /// 输入状态管理
  ///
  /// Copied from [InputNotifier].
  InputNotifierProvider(String conversationId)
    : this._internal(
        () => InputNotifier()..conversationId = conversationId,
        from: inputNotifierProvider,
        name: r'inputNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$inputNotifierHash,
        dependencies: InputNotifierFamily._dependencies,
        allTransitiveDependencies:
            InputNotifierFamily._allTransitiveDependencies,
        conversationId: conversationId,
      );

  InputNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.conversationId,
  }) : super.internal();

  final String conversationId;

  @override
  InputState runNotifierBuild(covariant InputNotifier notifier) {
    return notifier.build(conversationId);
  }

  @override
  Override overrideWith(InputNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: InputNotifierProvider._internal(
        () => create()..conversationId = conversationId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        conversationId: conversationId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<InputNotifier, InputState>
  createElement() {
    return _InputNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InputNotifierProvider &&
        other.conversationId == conversationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, conversationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InputNotifierRef on AutoDisposeNotifierProviderRef<InputState> {
  /// The parameter `conversationId` of this provider.
  String get conversationId;
}

class _InputNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<InputNotifier, InputState>
    with InputNotifierRef {
  _InputNotifierProviderElement(super.provider);

  @override
  String get conversationId => (origin as InputNotifierProvider).conversationId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
