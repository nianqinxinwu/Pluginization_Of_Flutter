// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentLanguageHash() => r'b01e8c1d988814837176e17bd27ed966bd83f3a1';

/// 当前语言 Provider (简化访问)
///
/// Copied from [currentLanguage].
@ProviderFor(currentLanguage)
final currentLanguageProvider = AutoDisposeProvider<AppLanguage>.internal(
  currentLanguage,
  name: r'currentLanguageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentLanguageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentLanguageRef = AutoDisposeProviderRef<AppLanguage>;
String _$resolvedLocaleHash() => r'1d91a6677d0ab6b0bede96b409bb47f4e5731e9c';

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

/// 解析后的 Locale Provider
/// 需要传入系统 Locale
///
/// Copied from [resolvedLocale].
@ProviderFor(resolvedLocale)
const resolvedLocaleProvider = ResolvedLocaleFamily();

/// 解析后的 Locale Provider
/// 需要传入系统 Locale
///
/// Copied from [resolvedLocale].
class ResolvedLocaleFamily extends Family<Locale> {
  /// 解析后的 Locale Provider
  /// 需要传入系统 Locale
  ///
  /// Copied from [resolvedLocale].
  const ResolvedLocaleFamily();

  /// 解析后的 Locale Provider
  /// 需要传入系统 Locale
  ///
  /// Copied from [resolvedLocale].
  ResolvedLocaleProvider call(Locale? systemLocale) {
    return ResolvedLocaleProvider(systemLocale);
  }

  @override
  ResolvedLocaleProvider getProviderOverride(
    covariant ResolvedLocaleProvider provider,
  ) {
    return call(provider.systemLocale);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'resolvedLocaleProvider';
}

/// 解析后的 Locale Provider
/// 需要传入系统 Locale
///
/// Copied from [resolvedLocale].
class ResolvedLocaleProvider extends AutoDisposeProvider<Locale> {
  /// 解析后的 Locale Provider
  /// 需要传入系统 Locale
  ///
  /// Copied from [resolvedLocale].
  ResolvedLocaleProvider(Locale? systemLocale)
    : this._internal(
        (ref) => resolvedLocale(ref as ResolvedLocaleRef, systemLocale),
        from: resolvedLocaleProvider,
        name: r'resolvedLocaleProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$resolvedLocaleHash,
        dependencies: ResolvedLocaleFamily._dependencies,
        allTransitiveDependencies:
            ResolvedLocaleFamily._allTransitiveDependencies,
        systemLocale: systemLocale,
      );

  ResolvedLocaleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.systemLocale,
  }) : super.internal();

  final Locale? systemLocale;

  @override
  Override overrideWith(Locale Function(ResolvedLocaleRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: ResolvedLocaleProvider._internal(
        (ref) => create(ref as ResolvedLocaleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        systemLocale: systemLocale,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Locale> createElement() {
    return _ResolvedLocaleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResolvedLocaleProvider &&
        other.systemLocale == systemLocale;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, systemLocale.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ResolvedLocaleRef on AutoDisposeProviderRef<Locale> {
  /// The parameter `systemLocale` of this provider.
  Locale? get systemLocale;
}

class _ResolvedLocaleProviderElement extends AutoDisposeProviderElement<Locale>
    with ResolvedLocaleRef {
  _ResolvedLocaleProviderElement(super.provider);

  @override
  Locale? get systemLocale => (origin as ResolvedLocaleProvider).systemLocale;
}

String _$localeNotifierHash() => r'aafcd967fa7233d3ec163e18ab54b514116135d4';

/// 语言状态管理
///
/// Copied from [LocaleNotifier].
@ProviderFor(LocaleNotifier)
final localeNotifierProvider =
    NotifierProvider<LocaleNotifier, AppLanguage>.internal(
      LocaleNotifier.new,
      name: r'localeNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$localeNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LocaleNotifier = Notifier<AppLanguage>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
