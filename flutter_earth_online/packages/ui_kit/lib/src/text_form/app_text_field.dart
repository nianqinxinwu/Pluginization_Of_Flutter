import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 输入框类型
enum AppInputType {
  /// 基础输入框
  text,

  /// 带边框输入框
  outlined,

  /// 填充输入框
  filled,

  /// 搜索框
  search,
}

/// 输入框组件
///
/// 提供多种输入框样式封装
///
/// 使用示例：
/// ```dart
/// AppInput.text(
///   controller: _controller,
///   hintText: '请输入内容',
///   onChanged: (value) => print(value),
/// )
///
/// AppInput.search(
///   hintText: '搜索',
///   onSubmitted: (value) => _search(value),
/// )
/// ```
class AppInput extends StatelessWidget {
  /// 输入框类型
  final AppInputType type;

  /// 控制器
  final TextEditingController? controller;

  /// 焦点节点
  final FocusNode? focusNode;

  /// 提示文字
  final String? hintText;

  /// 标签文字
  final String? labelText;

  /// 前缀图标
  final Widget? prefixIcon;

  /// 后缀图标
  final Widget? suffixIcon;

  /// 是否密码输入
  final bool obscureText;

  /// 是否只读
  final bool readOnly;

  /// 是否启用
  final bool enabled;

  /// 键盘类型
  final TextInputType? keyboardType;

  /// 键盘确认按钮类型
  final TextInputAction? textInputAction;

  /// 最大行数
  final int maxLines;

  /// 最小行数
  final int minLines;

  /// 最大长度
  final int? maxLength;

  /// 字体大小
  final double? fontSize;

  /// 圆角
  final double? borderRadius;

  /// 填充颜色
  final Color? fillColor;

  /// 边框颜色
  final Color? borderColor;

  /// 聚焦边框颜色
  final Color? focusedBorderColor;

  /// 内容内边距
  final EdgeInsetsGeometry? contentPadding;

  /// 输入格式化
  final List<TextInputFormatter>? inputFormatters;

  /// 值变化回调
  final ValueChanged<String>? onChanged;

  /// 提交回调
  final ValueChanged<String>? onSubmitted;

  /// 点击回调
  final VoidCallback? onTap;

  /// 验证器
  final FormFieldValidator<String>? validator;

  /// 自动校验模式
  final AutovalidateMode? autovalidateMode;

  const AppInput({
    super.key,
    this.type = AppInputType.text,
    this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.fontSize,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.contentPadding,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.autovalidateMode,
  });

  /// 基础文本输入框
  const AppInput.text({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.fontSize,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.contentPadding,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.autovalidateMode,
  }) : type = AppInputType.text;

  /// 带边框输入框
  const AppInput.outlined({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.fontSize,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.contentPadding,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.autovalidateMode,
  }) : type = AppInputType.outlined;

  /// 填充输入框
  const AppInput.filled({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.fontSize,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.contentPadding,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.autovalidateMode,
  }) : type = AppInputType.filled;

  /// 搜索框
  const AppInput.search({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText = '搜索',
    this.suffixIcon,
    this.readOnly = false,
    this.enabled = true,
    this.fontSize,
    this.borderRadius = 20,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.contentPadding,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.autovalidateMode,
  })  : type = AppInputType.search,
        prefixIcon = const Icon(Icons.search, size: 20),
        labelText = null,
        obscureText = false,
        keyboardType = TextInputType.text,
        textInputAction = TextInputAction.search,
        maxLines = 1,
        minLines = 1,
        maxLength = null;

  /// 密码输入框
  ///
  /// 返回一个带密码显示/隐藏切换的输入框组件
  static Widget password({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? hintText,
    String? labelText,
    Widget? prefixIcon,
    bool readOnly = false,
    bool enabled = true,
    TextInputAction? textInputAction,
    double? fontSize,
    double? borderRadius,
    Color? fillColor,
    Color? borderColor,
    Color? focusedBorderColor,
    EdgeInsetsGeometry? contentPadding,
    List<TextInputFormatter>? inputFormatters,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onTap,
    FormFieldValidator<String>? validator,
    AutovalidateMode? autovalidateMode,
  }) {
    return _PasswordInput(
      key: key,
      controller: controller,
      focusNode: focusNode,
      hintText: hintText ?? '请输入密码',
      labelText: labelText,
      prefixIcon: prefixIcon ?? const Icon(Icons.lock_outline, size: 20),
      readOnly: readOnly,
      enabled: enabled,
      textInputAction: textInputAction,
      fontSize: fontSize,
      borderRadius: borderRadius,
      fillColor: fillColor,
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
      contentPadding: contentPadding,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
      validator: validator,
      autovalidateMode: autovalidateMode,
    );
  }

  /// 获取圆角
  double get _borderRadius => borderRadius ?? 8;

  /// 获取边框
  InputBorder _getBorder(BuildContext context, {bool focused = false}) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (type) {
      case AppInputType.text:
        return InputBorder.none;

      case AppInputType.outlined:
      case AppInputType.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
          borderSide: BorderSide(
            color: focused
                ? (focusedBorderColor ?? colorScheme.primary)
                : (borderColor ?? colorScheme.outline.withValues(alpha: 0.3)),
          ),
        );

      case AppInputType.search:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
          borderSide: BorderSide.none,
        );
    }
  }

  /// 获取填充色
  Color? _getFillColor(BuildContext context) {
    if (fillColor != null) return fillColor;

    final colorScheme = Theme.of(context).colorScheme;

    switch (type) {
      case AppInputType.text:
      case AppInputType.outlined:
        return null;
      case AppInputType.filled:
      case AppInputType.search:
        return colorScheme.surfaceContainerHighest.withValues(alpha: 0.5);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      validator: validator,
      autovalidateMode: autovalidateMode,
      style: TextStyle(
        fontSize: fontSize ?? 15,
        color: colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize ?? 15,
          color: colorScheme.onSurface.withValues(alpha: 0.4),
        ),
        labelText: labelText,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 0,
        ),
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 0,
        ),
        filled: _getFillColor(context) != null,
        fillColor: _getFillColor(context),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        isDense: true,
        border: _getBorder(context),
        enabledBorder: _getBorder(context),
        focusedBorder: _getBorder(context, focused: true),
        errorBorder: _getBorder(context),
        focusedErrorBorder: _getBorder(context, focused: true),
        disabledBorder: _getBorder(context),
      ),
    );
  }
}

/// 密码输入框（带显示/隐藏切换）
class _PasswordInput extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final bool readOnly;
  final bool enabled;
  final TextInputAction? textInputAction;
  final double? fontSize;
  final double? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;

  const _PasswordInput({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.readOnly = false,
    this.enabled = true,
    this.textInputAction,
    this.fontSize,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.contentPadding,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.autovalidateMode,
  });

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppInput.outlined(
      controller: widget.controller,
      focusNode: widget.focusNode,
      hintText: widget.hintText,
      labelText: widget.labelText,
      prefixIcon: widget.prefixIcon,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          size: 20,
        ),
        onPressed: () => setState(() => _obscureText = !_obscureText),
      ),
      obscureText: _obscureText,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      textInputAction: widget.textInputAction,
      fontSize: widget.fontSize,
      borderRadius: widget.borderRadius,
      fillColor: widget.fillColor,
      borderColor: widget.borderColor,
      focusedBorderColor: widget.focusedBorderColor,
      contentPadding: widget.contentPadding,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
    );
  }
}

/// 便捷别名
typedef AppTextField = AppInput;
