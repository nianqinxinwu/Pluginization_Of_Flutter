import 'package:flutter/material.dart';

/// 表单验证工具类
///
/// 提供常用的表单验证方法
///
/// 使用示例：
/// ```dart
/// TextFormField(
///   validator: Validators.compose([
///     Validators.required('请输入密码'),
///     Validators.minLength(6, '密码至少6位'),
///     Validators.maxLength(20, '密码最多20位'),
///   ]),
/// )
/// ```
class Validators {
  Validators._();

  /// 必填验证
  static FormFieldValidator<String> required(String message) => (v) {
        if (v == null || v.trim().isEmpty) return message;
        return null;
      };

  /// 最小长度验证
  static FormFieldValidator<String> minLength(int min, String message) => (v) {
        if (v == null || v.isEmpty) return null;
        if (v.length < min) return message;
        return null;
      };

  /// 最大长度验证
  static FormFieldValidator<String> maxLength(int max, String message) => (v) {
        if (v == null || v.isEmpty) return null;
        if (v.length > max) return message;
        return null;
      };

  /// 长度范围验证
  static FormFieldValidator<String> lengthRange(
          int min, int max, String message) =>
      (v) {
        if (v == null || v.isEmpty) return null;
        if (v.length < min || v.length > max) return message;
        return null;
      };

  /// 密码验证（长度范围）
  static FormFieldValidator<String> password(
      int min, int max, String message) {
    return lengthRange(min, max, message);
  }

  /// 邮箱验证
  static FormFieldValidator<String> email(String message) => (v) {
        if (v == null || v.isEmpty) return null;
        final emailRegex = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        );
        if (!emailRegex.hasMatch(v)) return message;
        return null;
      };

  /// 手机号验证（中国大陆）
  static FormFieldValidator<String> phone(String message) => (v) {
        if (v == null || v.isEmpty) return null;
        final phoneRegex = RegExp(r'^1[3-9]\d{9}$');
        if (!phoneRegex.hasMatch(v)) return message;
        return null;
      };

  /// 数字验证
  static FormFieldValidator<String> numeric(String message) => (v) {
        if (v == null || v.isEmpty) return null;
        if (double.tryParse(v) == null) return message;
        return null;
      };

  /// 整数验证
  static FormFieldValidator<String> integer(String message) => (v) {
        if (v == null || v.isEmpty) return null;
        if (int.tryParse(v) == null) return message;
        return null;
      };

  /// 正则表达式验证
  static FormFieldValidator<String> pattern(RegExp regex, String message) =>
      (v) {
        if (v == null || v.isEmpty) return null;
        if (!regex.hasMatch(v)) return message;
        return null;
      };

  /// URL 验证
  static FormFieldValidator<String> url(String message) => (v) {
        if (v == null || v.isEmpty) return null;
        final uri = Uri.tryParse(v);
        if (uri == null || !uri.hasScheme || !uri.hasAuthority) return message;
        return null;
      };

  /// 确认密码验证
  static FormFieldValidator<String> confirmPassword(
    TextEditingController passwordController,
    String message,
  ) =>
      (v) {
        if (v == null || v.isEmpty) return null;
        if (v != passwordController.text) return message;
        return null;
      };

  /// 组合多个验证器
  ///
  /// 按顺序执行验证，返回第一个失败的错误信息
  static FormFieldValidator<String> compose(
      List<FormFieldValidator<String>> validators) {
    return (v) {
      for (final validator in validators) {
        final result = validator(v);
        if (result != null) return result;
      }
      return null;
    };
  }

  /// 自定义验证
  static FormFieldValidator<String> custom(
    bool Function(String?) predicate,
    String message,
  ) =>
      (v) {
        if (!predicate(v)) return message;
        return null;
      };
}
