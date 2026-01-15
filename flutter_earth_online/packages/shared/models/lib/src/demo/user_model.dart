import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// 用户模型 - 示例
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    String? email,
    String? avatar,
    @Default(false) bool isVip,
    DateTime? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

/// API 响应模型 - 通用分页
@freezed
class PageResponse<T> with _$PageResponse<T> {
  const factory PageResponse({
    required List<T> list,
    required int total,
    required int page,
    required int pageSize,
    @Default(false) bool hasMore,
  }) = _PageResponse<T>;
}

/// API 响应模型 - 通用包装
@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required int code,
    String? message,
    T? data,
  }) = _ApiResponse<T>;
}
