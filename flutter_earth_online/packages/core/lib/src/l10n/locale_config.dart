import 'package:flutter/material.dart';

/// 支持的语言枚举
enum AppLanguage {
  /// 跟随系统
  system,

  /// 简体中文
  zh,

  /// 英语
  en,

  /// 日语
  ja,
}

/// 语言配置扩展
extension AppLanguageExtension on AppLanguage {
  /// 获取 Locale
  Locale? get locale {
    switch (this) {
      case AppLanguage.system:
        return null; // null 表示跟随系统
      case AppLanguage.zh:
        return const Locale('zh', 'CN');
      case AppLanguage.en:
        return const Locale('en', 'US');
      case AppLanguage.ja:
        return const Locale('ja', 'JP');
    }
  }

  /// 显示名称
  String get displayName {
    switch (this) {
      case AppLanguage.system:
        return '跟随系统';
      case AppLanguage.zh:
        return '简体中文';
      case AppLanguage.en:
        return 'English';
      case AppLanguage.ja:
        return '日本語';
    }
  }

  /// 本地化显示名称 key
  String get localeKey {
    switch (this) {
      case AppLanguage.system:
        return 'languageSystem';
      case AppLanguage.zh:
        return 'languageZh';
      case AppLanguage.en:
        return 'languageEn';
      case AppLanguage.ja:
        return 'languageJa';
    }
  }

  /// 原生名称 (用于设置界面)
  String get nativeName {
    switch (this) {
      case AppLanguage.system:
        return 'System';
      case AppLanguage.zh:
        return '简体中文';
      case AppLanguage.en:
        return 'English';
      case AppLanguage.ja:
        return '日本語';
    }
  }
}

/// 语言配置
class LocaleConfig {
  LocaleConfig._();

  /// 支持的语言列表
  static const List<Locale> supportedLocales = [
    Locale('zh', 'CN'),
    Locale('en', 'US'),
    Locale('ja', 'JP'),
  ];

  /// 默认语言
  static const Locale fallbackLocale = Locale('zh', 'CN');

  /// 根据 Locale 获取 AppLanguage
  static AppLanguage fromLocale(Locale? locale) {
    if (locale == null) return AppLanguage.system;

    switch (locale.languageCode) {
      case 'zh':
        return AppLanguage.zh;
      case 'en':
        return AppLanguage.en;
      case 'ja':
        return AppLanguage.ja;
      default:
        return AppLanguage.system;
    }
  }

  /// 解析 Locale (处理跟随系统的情况)
  static Locale resolveLocale(AppLanguage language, Locale? systemLocale) {
    if (language == AppLanguage.system) {
      // 跟随系统，检查系统语言是否支持
      if (systemLocale != null) {
        for (final supported in supportedLocales) {
          if (supported.languageCode == systemLocale.languageCode) {
            return supported;
          }
        }
      }
      // 系统语言不支持，使用默认语言
      return fallbackLocale;
    }
    return language.locale ?? fallbackLocale;
  }
}
