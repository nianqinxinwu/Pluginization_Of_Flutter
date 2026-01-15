import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('zh'),
  ];

  /// 应用名称
  ///
  /// In zh, this message translates to:
  /// **'Flutter Earth Online'**
  String get appName;

  /// 首页标签
  ///
  /// In zh, this message translates to:
  /// **'首页'**
  String get home;

  /// 发现标签
  ///
  /// In zh, this message translates to:
  /// **'发现'**
  String get discover;

  /// 消息标签
  ///
  /// In zh, this message translates to:
  /// **'消息'**
  String get message;

  /// 我的标签
  ///
  /// In zh, this message translates to:
  /// **'我的'**
  String get profile;

  /// 设置页面标题
  ///
  /// In zh, this message translates to:
  /// **'设置'**
  String get settings;

  /// 语言设置
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get language;

  /// 跟随系统语言
  ///
  /// In zh, this message translates to:
  /// **'跟随系统'**
  String get languageSystem;

  /// 简体中文
  ///
  /// In zh, this message translates to:
  /// **'简体中文'**
  String get languageZh;

  /// 英语
  ///
  /// In zh, this message translates to:
  /// **'English'**
  String get languageEn;

  /// 日语
  ///
  /// In zh, this message translates to:
  /// **'日本語'**
  String get languageJa;

  /// 深色模式设置
  ///
  /// In zh, this message translates to:
  /// **'深色模式'**
  String get darkMode;

  /// 通知设置
  ///
  /// In zh, this message translates to:
  /// **'通知设置'**
  String get notification;

  /// 关于我们
  ///
  /// In zh, this message translates to:
  /// **'关于我们'**
  String get about;

  /// 版本信息
  ///
  /// In zh, this message translates to:
  /// **'版本'**
  String get version;

  /// 检查更新
  ///
  /// In zh, this message translates to:
  /// **'检查更新'**
  String get checkUpdate;

  /// 退出登录按钮
  ///
  /// In zh, this message translates to:
  /// **'退出登录'**
  String get logout;

  /// 取消按钮
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get cancel;

  /// 确认按钮
  ///
  /// In zh, this message translates to:
  /// **'确认'**
  String get confirm;

  /// 保存按钮
  ///
  /// In zh, this message translates to:
  /// **'保存'**
  String get save;

  /// 删除按钮
  ///
  /// In zh, this message translates to:
  /// **'删除'**
  String get delete;

  /// 编辑按钮
  ///
  /// In zh, this message translates to:
  /// **'编辑'**
  String get edit;

  /// 加载提示
  ///
  /// In zh, this message translates to:
  /// **'加载中...'**
  String get loading;

  /// 空数据提示
  ///
  /// In zh, this message translates to:
  /// **'暂无数据'**
  String get noData;

  /// 网络错误提示
  ///
  /// In zh, this message translates to:
  /// **'网络错误，请稍后重试'**
  String get networkError;

  /// 重试按钮
  ///
  /// In zh, this message translates to:
  /// **'重试'**
  String get retry;

  /// 成功提示
  ///
  /// In zh, this message translates to:
  /// **'操作成功'**
  String get success;

  /// 失败提示
  ///
  /// In zh, this message translates to:
  /// **'操作失败'**
  String get failed;

  /// 欢迎语
  ///
  /// In zh, this message translates to:
  /// **'欢迎回来'**
  String get welcome;

  /// 搜索框提示
  ///
  /// In zh, this message translates to:
  /// **'搜索你感兴趣的内容'**
  String get searchHint;

  /// 查看更多按钮
  ///
  /// In zh, this message translates to:
  /// **'查看更多'**
  String get viewMore;

  /// 开发者选项标题
  ///
  /// In zh, this message translates to:
  /// **'开发者选项'**
  String get developerOptions;

  /// Demo入口
  ///
  /// In zh, this message translates to:
  /// **'样例'**
  String get demo;

  /// Demo描述
  ///
  /// In zh, this message translates to:
  /// **'UI展示与网络请求测试'**
  String get demoDescription;

  /// 环境切换
  ///
  /// In zh, this message translates to:
  /// **'环境切换'**
  String get envSwitch;

  /// 开发环境
  ///
  /// In zh, this message translates to:
  /// **'开发环境'**
  String get envDevelopment;

  /// 测试环境
  ///
  /// In zh, this message translates to:
  /// **'测试环境'**
  String get envTest;

  /// 预发布环境
  ///
  /// In zh, this message translates to:
  /// **'预发布环境'**
  String get envProduction;

  /// 线上环境
  ///
  /// In zh, this message translates to:
  /// **'线上环境'**
  String get envRelease;

  /// 环境切换后的重启提示
  ///
  /// In zh, this message translates to:
  /// **'已切换环境，建议重启应用以确保生效'**
  String get restartHint;

  /// 知道了按钮
  ///
  /// In zh, this message translates to:
  /// **'知道了'**
  String get gotIt;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
