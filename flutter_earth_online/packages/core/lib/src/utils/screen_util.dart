import 'dart:math';
import 'package:flutter/material.dart';

/// 设计稿配置
///
/// 预设常用设计稿尺寸，支持自定义
///
/// ## 预设配置一览
///
/// | 配置                          | 尺寸         | 适用场景                    |
/// |------------------------------|-------------|---------------------------|
/// | **iOS**                      |             |                           |
/// | `DesignConfig.iPhoneSE`      | 375 x 667   | iPhone SE                 |
/// | `DesignConfig.iPhoneX`       | 375 x 812   | iPhone X/11/12/13/14      |
/// | `DesignConfig.iPhonePro`     | 390 x 844   | iPhone 12/13/14 Pro (默认) |
/// | `DesignConfig.iPhoneProMax`  | 393 x 852   | iPhone 14/15 Pro Max      |
/// | `DesignConfig.iPhone16Pro`   | 402 x 874   | iPhone 16 Pro             |
/// | **Android**                  |             |                           |
/// | `DesignConfig.androidSmall`  | 360 x 640   | 小屏 Android               |
/// | `DesignConfig.android`       | 360 x 780   | 标准 Android               |
/// | `DesignConfig.androidLarge`  | 411 x 731   | 大屏 Android               |
/// | `DesignConfig.androidFullScreen` | 360 x 800 | 全面屏 Android           |
/// | **平板**                      |             |                           |
/// | `DesignConfig.iPadMini`      | 768 x 1024  | iPad Mini                 |
/// | `DesignConfig.iPad`          | 810 x 1080  | iPad                      |
/// | `DesignConfig.iPadPro11`     | 834 x 1194  | iPad Pro 11"              |
/// | `DesignConfig.iPadPro12`     | 1024 x 1366 | iPad Pro 12.9"            |
///
/// ## 使用示例
///
/// ```dart
/// // 使用预设
/// ScreenUtil.init(context, config: DesignConfig.iPhoneX);
///
/// // 使用自定义配置
/// ScreenUtil.init(context, config: DesignConfig(
///   width: 360,
///   height: 640,
///   name: 'Custom Android',
/// ));
///
/// // 自动选择（根据设备屏幕尺寸自动匹配）
/// ScreenUtil.initAuto(context);
/// ```
class DesignConfig {
  /// 设计稿宽度
  final double width;

  /// 设计稿高度
  final double height;

  /// 配置名称（用于调试）
  final String name;

  /// 是否允许字体随系统缩放
  final bool allowFontScaling;

  const DesignConfig({
    required this.width,
    required this.height,
    this.name = 'Custom',
    this.allowFontScaling = false,
  });

  // ==================== iOS 预设 ====================

  /// iPhone SE (375 x 667)
  static const DesignConfig iPhoneSE = DesignConfig(
    width: 375,
    height: 667,
    name: 'iPhone SE',
  );

  /// iPhone X / 11 / 12 / 13 / 14 (375 x 812) - 推荐默认
  static const DesignConfig iPhoneX = DesignConfig(
    width: 375,
    height: 812,
    name: 'iPhone X',
  );

  /// iPhone 12/13/14 Pro (390 x 844)
  static const DesignConfig iPhonePro = DesignConfig(
    width: 390,
    height: 844,
    name: 'iPhone Pro',
  );

  /// iPhone 14 Pro Max / 15 Pro Max (393 x 852)
  static const DesignConfig iPhoneProMax = DesignConfig(
    width: 393,
    height: 852,
    name: 'iPhone Pro Max',
  );

  /// iPhone 16 Pro (402 x 874)
  static const DesignConfig iPhone16Pro = DesignConfig(
    width: 402,
    height: 874,
    name: 'iPhone 16 Pro',
  );

  // ==================== Android 预设 ====================

  /// Android 小屏 (360 x 640)
  static const DesignConfig androidSmall = DesignConfig(
    width: 360,
    height: 640,
    name: 'Android Small',
  );

  /// Android 标准 (360 x 780)
  static const DesignConfig android = DesignConfig(
    width: 360,
    height: 780,
    name: 'Android',
  );

  /// Android 大屏 (411 x 731)
  static const DesignConfig androidLarge = DesignConfig(
    width: 411,
    height: 731,
    name: 'Android Large',
  );

  /// Android 全面屏 (360 x 800)
  static const DesignConfig androidFullScreen = DesignConfig(
    width: 360,
    height: 800,
    name: 'Android FullScreen',
  );

  // ==================== 平板预设 ====================

  /// iPad Mini (768 x 1024)
  static const DesignConfig iPadMini = DesignConfig(
    width: 768,
    height: 1024,
    name: 'iPad Mini',
  );

  /// iPad (810 x 1080)
  static const DesignConfig iPad = DesignConfig(
    width: 810,
    height: 1080,
    name: 'iPad',
  );

  /// iPad Pro 11" (834 x 1194)
  static const DesignConfig iPadPro11 = DesignConfig(
    width: 834,
    height: 1194,
    name: 'iPad Pro 11"',
  );

  /// iPad Pro 12.9" (1024 x 1366)
  static const DesignConfig iPadPro12 = DesignConfig(
    width: 1024,
    height: 1366,
    name: 'iPad Pro 12.9"',
  );

  // ==================== 默认配置 ====================

  /// 默认配置（iPhone Pro）
  static const DesignConfig defaultConfig = iPhonePro;

  /// 根据当前设备自动选择合适的设计稿
  static DesignConfig autoSelect(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    if (width >= 1024) {
      return iPadPro12;
    } else if (width >= 834) {
      return iPadPro11;
    } else if (width >= 768) {
      return iPadMini;
    } else if (width >= 390) {
      return iPhonePro;
    } else if (width >= 375) {
      return iPhoneX;
    } else {
      return android;
    }
  }

  @override
  String toString() => 'DesignConfig($name: ${width}x$height)';
}

/// 屏幕适配工具
///
/// 基于设计稿尺寸进行屏幕适配，支持宽度、高度、字体、圆角的自适应
///
/// 初始化方式（在 MaterialApp 的 builder 中）：
/// ```dart
/// MaterialApp(
///   builder: (context, child) {
///     // 方式1：使用预设配置
///     ScreenUtil.init(context, config: DesignConfig.iPhoneX);
///
///     // 方式2：使用自定义尺寸
///     ScreenUtil.init(context, designWidth: 375, designHeight: 812);
///
///     // 方式3：自动选择配置
///     ScreenUtil.initAuto(context);
///
///     return child!;
///   },
/// )
/// ```
///
/// 使用方式：
/// ```dart
/// // 方式一：扩展方法（推荐）
/// Container(
///   width: 100.w,      // 宽度适配
///   height: 50.h,      // 高度适配
///   padding: 16.paddingAll,
///   child: Text(
///     'Hello',
///     style: TextStyle(fontSize: 14.sp),  // 字体适配
///   ),
/// )
///
/// // 方式二：直接调用
/// Container(
///   width: ScreenUtil.setWidth(100),
///   height: ScreenUtil.setHeight(50),
/// )
/// ```
class ScreenUtil {
  ScreenUtil._();

  static ScreenUtil? _instance;

  /// 设计稿宽度
  late double _designWidth;

  /// 设计稿高度
  late double _designHeight;

  /// 屏幕宽度
  late double _screenWidth;

  /// 屏幕高度
  late double _screenHeight;

  /// 状态栏高度
  late double _statusBarHeight;

  /// 底部安全区高度
  late double _bottomBarHeight;

  /// 设备像素比
  late double _pixelRatio;

  /// 文字缩放因子
  late double _textScaleFactor;

  /// 是否允许字体随系统缩放
  bool _allowFontScaling = false;

  /// 当前使用的配置
  DesignConfig? _currentConfig;

  /// 获取实例
  static ScreenUtil get instance {
    if (_instance == null) {
      throw StateError(
        'ScreenUtil is not initialized. '
        'Call ScreenUtil.init() in MaterialApp builder first.',
      );
    }
    return _instance!;
  }

  /// 初始化
  ///
  /// [context] BuildContext
  /// [config] 设计稿配置（优先级高于 designWidth/designHeight）
  /// [designWidth] 设计稿宽度，默认 390 (iPhone Pro)
  /// [designHeight] 设计稿高度，默认 844 (iPhone Pro)
  /// [allowFontScaling] 是否允许字体随系统设置缩放，默认 false
  static void init(
    BuildContext context, {
    DesignConfig? config,
    double designWidth = 390,
    double designHeight = 844,
    bool allowFontScaling = false,
  }) {
    _instance ??= ScreenUtil._();

    final mediaQuery = MediaQuery.of(context);

    // 优先使用 config 配置
    final effectiveConfig = config;
    _instance!._designWidth = effectiveConfig?.width ?? designWidth;
    _instance!._designHeight = effectiveConfig?.height ?? designHeight;
    _instance!._allowFontScaling =
        effectiveConfig?.allowFontScaling ?? allowFontScaling;
    _instance!._currentConfig = effectiveConfig;

    _instance!._screenWidth = mediaQuery.size.width;
    _instance!._screenHeight = mediaQuery.size.height;
    _instance!._statusBarHeight = mediaQuery.padding.top;
    _instance!._bottomBarHeight = mediaQuery.padding.bottom;
    _instance!._pixelRatio = mediaQuery.devicePixelRatio;
    _instance!._textScaleFactor = mediaQuery.textScaler.scale(1.0);
  }

  /// 自动初始化（根据设备屏幕自动选择合适的设计稿配置）
  static void initAuto(BuildContext context) {
    final config = DesignConfig.autoSelect(context);
    init(context, config: config);
  }

  /// 使用 MediaQueryData 初始化（适用于无 context 场景）
  static void initWithMediaQueryData(
    MediaQueryData mediaQuery, {
    DesignConfig? config,
    double designWidth = 390,
    double designHeight = 844,
    bool allowFontScaling = false,
  }) {
    _instance ??= ScreenUtil._();

    // 优先使用 config 配置
    final effectiveConfig = config;
    _instance!._designWidth = effectiveConfig?.width ?? designWidth;
    _instance!._designHeight = effectiveConfig?.height ?? designHeight;
    _instance!._allowFontScaling =
        effectiveConfig?.allowFontScaling ?? allowFontScaling;
    _instance!._currentConfig = effectiveConfig;

    _instance!._screenWidth = mediaQuery.size.width;
    _instance!._screenHeight = mediaQuery.size.height;
    _instance!._statusBarHeight = mediaQuery.padding.top;
    _instance!._bottomBarHeight = mediaQuery.padding.bottom;
    _instance!._pixelRatio = mediaQuery.devicePixelRatio;
    _instance!._textScaleFactor = mediaQuery.textScaler.scale(1.0);
  }

  // ==================== 屏幕信息 ====================

  /// 当前使用的设计稿配置
  static DesignConfig? get currentConfig => instance._currentConfig;

  /// 设计稿宽度
  static double get designWidth => instance._designWidth;

  /// 设计稿高度
  static double get designHeight => instance._designHeight;

  /// 屏幕宽度
  static double get screenWidth => instance._screenWidth;

  /// 屏幕高度
  static double get screenHeight => instance._screenHeight;

  /// 状态栏高度
  static double get statusBarHeight => instance._statusBarHeight;

  /// 底部安全区高度
  static double get bottomBarHeight => instance._bottomBarHeight;

  /// 设备像素比
  static double get pixelRatio => instance._pixelRatio;

  /// 文字缩放因子
  static double get textScaleFactor => instance._textScaleFactor;

  /// 宽度缩放比例
  static double get scaleWidth => screenWidth / designWidth;

  /// 高度缩放比例
  static double get scaleHeight => screenHeight / designHeight;

  /// 取宽高比例中较小的值（保证不会超出屏幕）
  static double get scaleMin => min(scaleWidth, scaleHeight);

  // ==================== 适配方法 ====================

  /// 根据设计稿宽度适配
  static double setWidth(num width) => width * scaleWidth;

  /// 根据设计稿高度适配
  static double setHeight(num height) => height * scaleHeight;

  /// 圆角适配（取宽高比例较小值）
  static double setRadius(num radius) => radius * scaleMin;

  /// 字体大小适配
  static double setSp(num fontSize) {
    final scaledSize = fontSize * scaleMin;
    return instance._allowFontScaling
        ? scaledSize
        : scaledSize / textScaleFactor;
  }

  /// 根据设计稿宽度适配（同 setWidth）
  static double w(num width) => setWidth(width);

  /// 根据设计稿高度适配（同 setHeight）
  static double h(num height) => setHeight(height);

  /// 字体大小适配（同 setSp）
  static double sp(num fontSize) => setSp(fontSize);

  /// 圆角适配（同 setRadius）
  static double r(num radius) => setRadius(radius);

  // ==================== 设备类型判断 ====================

  /// 是否是小屏设备（宽度 < 360）
  static bool get isSmallScreen => screenWidth < 360;

  /// 是否是中等屏设备（360 <= 宽度 < 600）
  static bool get isMediumScreen => screenWidth >= 360 && screenWidth < 600;

  /// 是否是大屏设备（宽度 >= 600，通常是平板）
  static bool get isLargeScreen => screenWidth >= 600;

  /// 是否是手机
  static bool get isPhone => screenWidth < 600;

  /// 是否是平板
  static bool get isTablet => screenWidth >= 600;

  /// 是否是横屏
  static bool get isLandscape => screenWidth > screenHeight;

  /// 是否是竖屏
  static bool get isPortrait => screenWidth <= screenHeight;
}

/// 响应式断点
class Breakpoints {
  Breakpoints._();

  /// 小屏（手机竖屏）
  static const double xs = 0;

  /// 中小屏（大手机）
  static const double sm = 360;

  /// 中屏（小平板）
  static const double md = 600;

  /// 大屏（平板）
  static const double lg = 900;

  /// 超大屏（大平板/桌面）
  static const double xl = 1200;
}

/// 响应式构建器
///
/// 根据屏幕宽度返回不同的 Widget
///
/// ```dart
/// ResponsiveBuilder(
///   xs: (context) => MobileLayout(),
///   md: (context) => TabletLayout(),
///   lg: (context) => DesktopLayout(),
/// )
/// ```
class ResponsiveBuilder extends StatelessWidget {
  /// 小屏布局 (< 360)
  final WidgetBuilder? xs;

  /// 中小屏布局 (>= 360)
  final WidgetBuilder? sm;

  /// 中屏布局 (>= 600)
  final WidgetBuilder? md;

  /// 大屏布局 (>= 900)
  final WidgetBuilder? lg;

  /// 超大屏布局 (>= 1200)
  final WidgetBuilder? xl;

  const ResponsiveBuilder({
    super.key,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    WidgetBuilder? builder;

    if (width >= Breakpoints.xl && xl != null) {
      builder = xl;
    } else if (width >= Breakpoints.lg && lg != null) {
      builder = lg;
    } else if (width >= Breakpoints.md && md != null) {
      builder = md;
    } else if (width >= Breakpoints.sm && sm != null) {
      builder = sm;
    } else {
      builder = xs;
    }

    // 向下兼容：如果没有找到对应断点的 builder，使用较小断点的 builder
    builder ??= xs ?? sm ?? md ?? lg ?? xl;

    if (builder == null) {
      throw ArgumentError('ResponsiveBuilder requires at least one builder');
    }

    return builder(context);
  }
}

/// 响应式数值选择器
///
/// 根据屏幕宽度返回不同的数值
///
/// ```dart
/// final padding = ResponsiveValue<double>(
///   context,
///   xs: 8,
///   sm: 12,
///   md: 16,
///   lg: 24,
/// ).value;
/// ```
class ResponsiveValue<T> {
  final BuildContext context;
  final T? xs;
  final T? sm;
  final T? md;
  final T? lg;
  final T? xl;
  final T? defaultValue;

  ResponsiveValue(
    this.context, {
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.defaultValue,
  });

  T get value {
    final width = MediaQuery.of(context).size.width;

    T? result;

    if (width >= Breakpoints.xl && xl != null) {
      result = xl;
    } else if (width >= Breakpoints.lg && lg != null) {
      result = lg;
    } else if (width >= Breakpoints.md && md != null) {
      result = md;
    } else if (width >= Breakpoints.sm && sm != null) {
      result = sm;
    } else if (xs != null) {
      result = xs;
    }

    // 向下兼容
    result ??= xs ?? sm ?? md ?? lg ?? xl ?? defaultValue;

    if (result == null) {
      throw ArgumentError('ResponsiveValue requires at least one value');
    }

    return result;
  }
}
