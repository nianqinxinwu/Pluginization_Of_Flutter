import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/app_localizations.dart';
import 'locale_config.dart';

/// App 本地化配置扩展
extension AppLocalizationsX on BuildContext {
  /// 获取本地化字符串
  AppLocalizations get l10n => AppLocalizations.of(this);

  /// 安全获取本地化字符串 (可能为 null)
  AppLocalizations? get l10nOrNull {
    try {
      return AppLocalizations.of(this);
    } catch (_) {
      return null;
    }
  }
}

/// MaterialApp 本地化配置
class AppLocalizationConfig {
  AppLocalizationConfig._();

  /// 本地化代理列表
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  /// 支持的语言列表
  static List<Locale> get supportedLocales => LocaleConfig.supportedLocales;

  /// Locale 解析回调
  static Locale? localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (locale == null) return LocaleConfig.fallbackLocale;

    for (final supported in supportedLocales) {
      if (supported.languageCode == locale.languageCode) {
        return supported;
      }
    }

    return LocaleConfig.fallbackLocale;
  }
}
