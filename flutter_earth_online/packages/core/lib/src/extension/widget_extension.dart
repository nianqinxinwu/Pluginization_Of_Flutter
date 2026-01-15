import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

/// Widget 扩展方法
///
/// 提供链式调用的 Widget 包装方法
///
/// 使用示例：
/// ```dart
/// Text('Hello')
///     .padding(all: 16)
///     .backgroundColor(Colors.white)
///     .clipRRect(all: 8)
///     .onTap(() => print('tapped'))
/// ```
extension WidgetExtension on Widget {
  // ==================== 对齐 ====================

  /// 对齐
  Widget align(AlignmentGeometry alignment, {Key? key}) =>
      Align(key: key, alignment: alignment, child: this);

  /// 居中对齐
  Widget alignCenter() => align(Alignment.center);

  /// 左对齐
  Widget alignLeft() => align(Alignment.centerLeft);

  /// 右对齐
  Widget alignRight() => align(Alignment.centerRight);

  /// 顶部对齐
  Widget alignTop() => align(Alignment.topCenter);

  /// 底部对齐
  Widget alignBottom() => align(Alignment.bottomCenter);

  // ==================== 布局 ====================

  /// 宽高比
  Widget aspectRatio({Key? key, required double aspectRatio}) => AspectRatio(
        key: key,
        aspectRatio: aspectRatio,
        child: this,
      );

  /// 居中
  Widget center({Key? key, double? widthFactor, double? heightFactor}) =>
      Center(
        key: key,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  /// 撑满 Expanded
  Widget expanded({Key? key, int flex = 1}) => Expanded(
        key: key,
        flex: flex,
        child: this,
      );

  /// 弹性布局 Flexible
  Widget flexible({Key? key, int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(
        key: key,
        flex: flex,
        fit: fit,
        child: this,
      );

  /// FittedBox
  Widget fittedBox({
    Key? key,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    Clip clipBehavior = Clip.none,
  }) =>
      FittedBox(
        key: key,
        fit: fit,
        alignment: alignment,
        clipBehavior: clipBehavior,
        child: this,
      );

  /// FractionallySizedBox
  Widget fractionallySizedBox({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
  }) =>
      FractionallySizedBox(
        key: key,
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  // ==================== 约束 ====================

  /// 宽度约束
  Widget width(double width, {Key? key}) => ConstrainedBox(
        key: key,
        constraints: BoxConstraints.tightFor(width: width),
        child: this,
      );

  /// 高度约束
  Widget height(double height, {Key? key}) => ConstrainedBox(
        key: key,
        constraints: BoxConstraints.tightFor(height: height),
        child: this,
      );

  /// 宽高约束
  Widget tight({double? width, double? height, Key? key}) => ConstrainedBox(
        key: key,
        constraints: BoxConstraints.tightFor(width: width, height: height),
        child: this,
      );

  /// 固定尺寸
  Widget tightSize(double size, {Key? key}) => ConstrainedBox(
        key: key,
        constraints: BoxConstraints.tightFor(width: size, height: size),
        child: this,
      );

  /// 自定义约束
  Widget constrained({
    Key? key,
    double? width,
    double? height,
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) {
    BoxConstraints constraints = BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
    constraints = (width != null || height != null)
        ? constraints.tighten(width: width, height: height)
        : constraints;
    return ConstrainedBox(
      key: key,
      constraints: constraints,
      child: this,
    );
  }

  /// 取消父级约束
  Widget unconstrained({
    Key? key,
    TextDirection? textDirection,
    AlignmentGeometry alignment = Alignment.center,
    Axis? constrainedAxis,
    Clip clipBehavior = Clip.none,
  }) =>
      UnconstrainedBox(
        key: key,
        textDirection: textDirection,
        alignment: alignment,
        constrainedAxis: constrainedAxis,
        clipBehavior: clipBehavior,
        child: this,
      );

  /// 限制最大宽高
  Widget limitedBox({
    Key? key,
    double maxWidth = double.infinity,
    double maxHeight = double.infinity,
  }) =>
      LimitedBox(
        key: key,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        child: this,
      );

  // ==================== 间距 ====================

  /// 内间距
  Widget padding({
    Key? key,
    EdgeInsetsGeometry? value,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      Padding(
        key: key,
        padding: value ??
            EdgeInsets.only(
              top: top ?? vertical ?? all ?? 0.0,
              bottom: bottom ?? vertical ?? all ?? 0.0,
              left: left ?? horizontal ?? all ?? 0.0,
              right: right ?? horizontal ?? all ?? 0.0,
            ),
        child: this,
      );

  /// 上内间距
  Widget paddingTop(double val) => padding(top: val);

  /// 下内间距
  Widget paddingBottom(double val) => padding(bottom: val);

  /// 左内间距
  Widget paddingLeft(double val) => padding(left: val);

  /// 右内间距
  Widget paddingRight(double val) => padding(right: val);

  /// 水平内间距
  Widget paddingHorizontal(double val) => padding(horizontal: val);

  /// 垂直内间距
  Widget paddingVertical(double val) => padding(vertical: val);

  /// 全部内间距
  Widget paddingAll(double val) => padding(all: val);

  // ==================== Sliver 间距 ====================

  /// Sliver 内间距
  Widget sliverPadding({
    Key? key,
    EdgeInsetsGeometry? value,
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      SliverPadding(
        key: key,
        padding: value ??
            EdgeInsets.only(
              top: top ?? vertical ?? all ?? 0.0,
              bottom: bottom ?? vertical ?? all ?? 0.0,
              left: left ?? horizontal ?? all ?? 0.0,
              right: right ?? horizontal ?? all ?? 0.0,
            ),
        sliver: this,
      );

  /// Sliver 上内间距
  Widget sliverPaddingTop(double val) => sliverPadding(top: val);

  /// Sliver 下内间距
  Widget sliverPaddingBottom(double val) => sliverPadding(bottom: val);

  /// Sliver 左内间距
  Widget sliverPaddingLeft(double val) => sliverPadding(left: val);

  /// Sliver 右内间距
  Widget sliverPaddingRight(double val) => sliverPadding(right: val);

  /// Sliver 水平内间距
  Widget sliverPaddingHorizontal(double val) => sliverPadding(horizontal: val);

  /// Sliver 垂直内间距
  Widget sliverPaddingVertical(double val) => sliverPadding(vertical: val);

  /// SliverToBoxAdapter
  Widget sliverToBoxAdapter({Key? key}) =>
      SliverToBoxAdapter(key: key, child: this);

  // ==================== 装饰 ====================

  /// 背景颜色
  Widget backgroundColor(Color color, {Key? key}) => DecoratedBox(
        key: key,
        decoration: BoxDecoration(color: color),
        child: this,
      );

  /// 背景图片
  Widget backgroundImage(DecorationImage image, {Key? key}) => DecoratedBox(
        key: key,
        decoration: BoxDecoration(image: image),
        child: this,
      );

  /// 边框
  Widget border({
    Key? key,
    double? all,
    double? left,
    double? right,
    double? top,
    double? bottom,
    Color color = const Color(0xFF000000),
    BorderStyle style = BorderStyle.solid,
  }) {
    final decoration = BoxDecoration(
      border: Border(
        left: (left ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: left ?? all ?? 0, style: style),
        right: (right ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: right ?? all ?? 0, style: style),
        top: (top ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: top ?? all ?? 0, style: style),
        bottom: (bottom ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: bottom ?? all ?? 0, style: style),
      ),
    );
    return DecoratedBox(key: key, decoration: decoration, child: this);
  }

  /// 圆角装饰（仅装饰，不裁剪内容）
  Widget borderRadius({
    Key? key,
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? all ?? 0.0),
        topRight: Radius.circular(topRight ?? all ?? 0.0),
        bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
        bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
      ),
    );
    return DecoratedBox(key: key, decoration: decoration, child: this);
  }

  /// 阴影
  Widget boxShadow({
    Key? key,
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    double spreadRadius = 0.0,
  }) {
    final decoration = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
      ],
    );
    return DecoratedBox(key: key, decoration: decoration, child: this);
  }

  /// 自定义装饰
  Widget decorated({
    Key? key,
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
    DecorationPosition position = DecorationPosition.background,
  }) {
    final decoration = BoxDecoration(
      color: color,
      image: image,
      border: border,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      gradient: gradient,
      backgroundBlendMode: backgroundBlendMode,
      shape: shape,
    );
    return DecoratedBox(
      key: key,
      decoration: decoration,
      position: position,
      child: this,
    );
  }

  /// Material 高度阴影
  Widget elevation(
    double elevation, {
    Key? key,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    Color shadowColor = const Color(0xFF000000),
  }) =>
      Material(
        key: key,
        color: Colors.transparent,
        elevation: elevation,
        borderRadius: borderRadius,
        shadowColor: shadowColor,
        child: this,
      );

  // ==================== 裁剪 ====================

  /// 椭圆裁剪
  Widget clipOval({Key? key}) => ClipOval(key: key, child: this);

  /// 矩形裁剪
  Widget clipRect({
    Key? key,
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      ClipRect(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
        child: this,
      );

  /// 圆角裁剪
  Widget clipRRect({
    Key? key,
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipRRect(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft ?? all ?? 0.0),
          topRight: Radius.circular(topRight ?? all ?? 0.0),
          bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
          bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
        ),
        child: this,
      );

  // ==================== 可见性 ====================

  /// 透明度
  Widget opacity(
    double opacity, {
    Key? key,
    bool alwaysIncludeSemantics = false,
  }) =>
      Opacity(
        key: key,
        opacity: opacity,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
        child: this,
      );

  /// 偏移隐藏
  Widget offstage({Key? key, bool offstage = true}) => Offstage(
        key: key,
        offstage: offstage,
        child: this,
      );

  /// 条件显示
  Widget visible(bool visible) => visible ? this : const SizedBox.shrink();

  // ==================== 定位 ====================

  /// Stack 定位
  Widget positioned({
    Key? key,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) =>
      Positioned(
        key: key,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        width: width,
        height: height,
        child: this,
      );

  /// 填充 Stack
  Widget positionedFill({Key? key}) => Positioned.fill(key: key, child: this);

  // ==================== 变换 ====================

  /// 缩放
  Widget scale({
    Key? key,
    double? all,
    double? x,
    double? y,
    Offset? origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
  }) =>
      Transform(
        key: key,
        transform: Matrix4.diagonal3Values(x ?? all ?? 1, y ?? all ?? 1, 1.0),
        alignment: alignment,
        origin: origin,
        transformHitTests: transformHitTests,
        child: this,
      );

  /// 平移
  Widget translate({
    Key? key,
    required Offset offset,
    bool transformHitTests = true,
  }) =>
      Transform.translate(
        key: key,
        offset: offset,
        transformHitTests: transformHitTests,
        child: this,
      );

  /// 旋转
  Widget rotate({
    Key? key,
    required double angle,
    Offset? origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
  }) =>
      Transform.rotate(
        key: key,
        angle: angle,
        origin: origin,
        alignment: alignment,
        transformHitTests: transformHitTests,
        child: this,
      );

  /// 自定义变换
  Widget transform({
    Key? key,
    required Matrix4 transform,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
  }) =>
      Transform(
        key: key,
        transform: transform,
        alignment: alignment,
        origin: origin,
        transformHitTests: transformHitTests,
        child: this,
      );

  // ==================== 手势 ====================

  /// 点击手势
  Widget onTap(
    GestureTapCallback? onTap, {
    Key? key,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      GestureDetector(
        key: key,
        onTap: onTap,
        behavior: behavior ?? HitTestBehavior.opaque,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        child: this,
      );

  /// 长按手势
  Widget onLongPress(
    GestureLongPressCallback? onLongPress, {
    Key? key,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      GestureDetector(
        key: key,
        onLongPress: onLongPress,
        behavior: behavior ?? HitTestBehavior.opaque,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        child: this,
      );

  /// 双击手势
  Widget onDoubleTap(
    GestureTapCallback? onDoubleTap, {
    Key? key,
    HitTestBehavior? behavior,
  }) =>
      GestureDetector(
        key: key,
        onDoubleTap: onDoubleTap,
        behavior: behavior ?? HitTestBehavior.opaque,
        child: this,
      );

  /// 完整手势
  Widget gestures({
    Key? key,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCallback? onTap,
    GestureTapCancelCallback? onTapCancel,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureDragDownCallback? onVerticalDragDown,
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragCancelCallback? onVerticalDragCancel,
    GestureDragDownCallback? onHorizontalDragDown,
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragCancelCallback? onHorizontalDragCancel,
    GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      GestureDetector(
        key: key,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTap: onTap,
        onTapCancel: onTapCancel,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onLongPressStart: onLongPressStart,
        onLongPressMoveUpdate: onLongPressMoveUpdate,
        onLongPressUp: onLongPressUp,
        onLongPressEnd: onLongPressEnd,
        onVerticalDragDown: onVerticalDragDown,
        onVerticalDragStart: onVerticalDragStart,
        onVerticalDragUpdate: onVerticalDragUpdate,
        onVerticalDragEnd: onVerticalDragEnd,
        onVerticalDragCancel: onVerticalDragCancel,
        onHorizontalDragDown: onHorizontalDragDown,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragEnd: onHorizontalDragEnd,
        onHorizontalDragCancel: onHorizontalDragCancel,
        onPanDown: onPanDown,
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        onPanCancel: onPanCancel,
        onScaleStart: onScaleStart,
        onScaleUpdate: onScaleUpdate,
        onScaleEnd: onScaleEnd,
        behavior: behavior ?? HitTestBehavior.opaque,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        child: this,
      );

  /// 墨水纹效果
  Widget inkWell({
    Key? key,
    VoidCallback? onTap,
    double? borderRadius,
  }) =>
      Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            borderRadius: borderRadius != null
                ? BorderRadius.all(Radius.circular(borderRadius))
                : null,
            onTap: onTap ?? () {},
            child: this,
          ),
        ),
      );

  // ==================== 滚动 ====================

  /// 单子滚动视图
  Widget scrollable({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    EdgeInsetsGeometry? padding,
  }) =>
      SingleChildScrollView(
        key: key,
        scrollDirection: scrollDirection,
        reverse: reverse,
        primary: primary,
        physics: physics,
        controller: controller,
        dragStartBehavior: dragStartBehavior,
        padding: padding,
        child: this,
      );

  // ==================== 安全区域 ====================

  /// 安全区域
  Widget safeArea({
    Key? key,
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) =>
      SafeArea(
        key: key,
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: this,
      );

  // ==================== 语义 ====================

  /// 语义标签
  Widget semanticsLabel(String label, {Key? key}) => Semantics.fromProperties(
        key: key,
        properties: SemanticsProperties(label: label),
        child: this,
      );

  // ==================== 溢出 ====================

  /// 溢出盒子
  Widget overflow({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) =>
      OverflowBox(
        key: key,
        alignment: alignment,
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: this,
      );
}

/// List<Widget> 扩展方法
extension WidgetListExtension on List<Widget> {
  /// 转换为 Row
  Widget toRow({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) =>
      Row(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: this,
      );

  /// 转换为 Column
  Widget toColumn({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) =>
      Column(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: this,
      );

  /// 转换为 Stack
  Widget toStack({
    Key? key,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      Stack(
        key: key,
        alignment: alignment,
        textDirection: textDirection,
        fit: fit,
        clipBehavior: clipBehavior,
        children: this,
      );

  /// 转换为 Wrap
  Widget toWrap({
    Key? key,
    Axis direction = Axis.horizontal,
    WrapAlignment alignment = WrapAlignment.start,
    double spacing = 0.0,
    WrapAlignment runAlignment = WrapAlignment.start,
    double runSpacing = 0.0,
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    Clip clipBehavior = Clip.none,
  }) =>
      Wrap(
        key: key,
        direction: direction,
        alignment: alignment,
        spacing: spacing,
        runAlignment: runAlignment,
        runSpacing: runSpacing,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        clipBehavior: clipBehavior,
        children: this,
      );

  /// 转换为 ListView
  Widget toListView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      ListView(
        key: key,
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: controller,
        primary: primary,
        physics: physics,
        shrinkWrap: shrinkWrap,
        padding: padding,
        itemExtent: itemExtent,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        cacheExtent: cacheExtent,
        semanticChildCount: semanticChildCount,
        dragStartBehavior: dragStartBehavior,
        keyboardDismissBehavior: keyboardDismissBehavior,
        restorationId: restorationId,
        clipBehavior: clipBehavior,
        children: this,
      );
}
