import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locale_config.dart';

part 'locale_provider.g.dart';

/// 语言状态管理
@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  static const String _storageKey = 'app_language';

  @override
  AppLanguage build() {
    // 初始化时从本地存储读取
    _loadSavedLanguage();
    return AppLanguage.system;
  }

  /// 从本地存储加载语言设置
  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedIndex = prefs.getInt(_storageKey);

    if (savedIndex != null &&
        savedIndex >= 0 &&
        savedIndex < AppLanguage.values.length) {
      state = AppLanguage.values[savedIndex];
    }
  }

  /// 切换语言
  Future<void> setLanguage(AppLanguage language) async {
    if (state == language) return;

    state = language;

    // 持久化存储
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_storageKey, language.index);
  }

  /// 获取当前实际的 Locale (处理跟随系统的情况)
  Locale getResolvedLocale(Locale? systemLocale) {
    return LocaleConfig.resolveLocale(state, systemLocale);
  }
}

/// 当前语言 Provider (简化访问)
@riverpod
AppLanguage currentLanguage(CurrentLanguageRef ref) {
  return ref.watch(localeNotifierProvider);
}

/// 解析后的 Locale Provider
/// 需要传入系统 Locale
@riverpod
Locale resolvedLocale(ResolvedLocaleRef ref, Locale? systemLocale) {
  final language = ref.watch(localeNotifierProvider);
  return LocaleConfig.resolveLocale(language, systemLocale);
}
