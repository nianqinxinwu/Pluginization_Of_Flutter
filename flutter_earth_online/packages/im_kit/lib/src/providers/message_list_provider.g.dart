// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messageListNotifierHash() =>
    r'8a0315e4b0c9ead8122cf7360e4905d04c425e49';

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

abstract class _$MessageListNotifier
    extends BuildlessAutoDisposeNotifier<List<IMMessage>> {
  late final String conversationId;

  List<IMMessage> build(String conversationId);
}

/// 消息列表管理
///
/// Copied from [MessageListNotifier].
@ProviderFor(MessageListNotifier)
const messageListNotifierProvider = MessageListNotifierFamily();

/// 消息列表管理
///
/// Copied from [MessageListNotifier].
class MessageListNotifierFamily extends Family<List<IMMessage>> {
  /// 消息列表管理
  ///
  /// Copied from [MessageListNotifier].
  const MessageListNotifierFamily();

  /// 消息列表管理
  ///
  /// Copied from [MessageListNotifier].
  MessageListNotifierProvider call(String conversationId) {
    return MessageListNotifierProvider(conversationId);
  }

  @override
  MessageListNotifierProvider getProviderOverride(
    covariant MessageListNotifierProvider provider,
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
  String? get name => r'messageListNotifierProvider';
}

/// 消息列表管理
///
/// Copied from [MessageListNotifier].
class MessageListNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<MessageListNotifier, List<IMMessage>> {
  /// 消息列表管理
  ///
  /// Copied from [MessageListNotifier].
  MessageListNotifierProvider(String conversationId)
    : this._internal(
        () => MessageListNotifier()..conversationId = conversationId,
        from: messageListNotifierProvider,
        name: r'messageListNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$messageListNotifierHash,
        dependencies: MessageListNotifierFamily._dependencies,
        allTransitiveDependencies:
            MessageListNotifierFamily._allTransitiveDependencies,
        conversationId: conversationId,
      );

  MessageListNotifierProvider._internal(
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
  List<IMMessage> runNotifierBuild(covariant MessageListNotifier notifier) {
    return notifier.build(conversationId);
  }

  @override
  Override overrideWith(MessageListNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: MessageListNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<MessageListNotifier, List<IMMessage>>
  createElement() {
    return _MessageListNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessageListNotifierProvider &&
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
mixin MessageListNotifierRef
    on AutoDisposeNotifierProviderRef<List<IMMessage>> {
  /// The parameter `conversationId` of this provider.
  String get conversationId;
}

class _MessageListNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<MessageListNotifier, List<IMMessage>>
    with MessageListNotifierRef {
  _MessageListNotifierProviderElement(super.provider);

  @override
  String get conversationId =>
      (origin as MessageListNotifierProvider).conversationId;
}

String _$messageListStateNotifierHash() =>
    r'270605f7d0f3bf278c1fd85bdbe46528308d0a7d';

abstract class _$MessageListStateNotifier
    extends BuildlessAutoDisposeNotifier<MessageListState> {
  late final String conversationId;

  MessageListState build(String conversationId);
}

/// 消息列表状态管理
///
/// Copied from [MessageListStateNotifier].
@ProviderFor(MessageListStateNotifier)
const messageListStateNotifierProvider = MessageListStateNotifierFamily();

/// 消息列表状态管理
///
/// Copied from [MessageListStateNotifier].
class MessageListStateNotifierFamily extends Family<MessageListState> {
  /// 消息列表状态管理
  ///
  /// Copied from [MessageListStateNotifier].
  const MessageListStateNotifierFamily();

  /// 消息列表状态管理
  ///
  /// Copied from [MessageListStateNotifier].
  MessageListStateNotifierProvider call(String conversationId) {
    return MessageListStateNotifierProvider(conversationId);
  }

  @override
  MessageListStateNotifierProvider getProviderOverride(
    covariant MessageListStateNotifierProvider provider,
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
  String? get name => r'messageListStateNotifierProvider';
}

/// 消息列表状态管理
///
/// Copied from [MessageListStateNotifier].
class MessageListStateNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          MessageListStateNotifier,
          MessageListState
        > {
  /// 消息列表状态管理
  ///
  /// Copied from [MessageListStateNotifier].
  MessageListStateNotifierProvider(String conversationId)
    : this._internal(
        () => MessageListStateNotifier()..conversationId = conversationId,
        from: messageListStateNotifierProvider,
        name: r'messageListStateNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$messageListStateNotifierHash,
        dependencies: MessageListStateNotifierFamily._dependencies,
        allTransitiveDependencies:
            MessageListStateNotifierFamily._allTransitiveDependencies,
        conversationId: conversationId,
      );

  MessageListStateNotifierProvider._internal(
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
  MessageListState runNotifierBuild(
    covariant MessageListStateNotifier notifier,
  ) {
    return notifier.build(conversationId);
  }

  @override
  Override overrideWith(MessageListStateNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: MessageListStateNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<MessageListStateNotifier, MessageListState>
  createElement() {
    return _MessageListStateNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessageListStateNotifierProvider &&
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
mixin MessageListStateNotifierRef
    on AutoDisposeNotifierProviderRef<MessageListState> {
  /// The parameter `conversationId` of this provider.
  String get conversationId;
}

class _MessageListStateNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          MessageListStateNotifier,
          MessageListState
        >
    with MessageListStateNotifierRef {
  _MessageListStateNotifierProviderElement(super.provider);

  @override
  String get conversationId =>
      (origin as MessageListStateNotifierProvider).conversationId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
