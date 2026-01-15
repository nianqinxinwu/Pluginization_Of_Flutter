// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmojiCategoryImpl _$$EmojiCategoryImplFromJson(Map<String, dynamic> json) =>
    _$EmojiCategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      emojis: (json['emojis'] as List<dynamic>)
          .map((e) => EmojiItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCustom: json['isCustom'] as bool? ?? false,
    );

Map<String, dynamic> _$$EmojiCategoryImplToJson(_$EmojiCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'emojis': instance.emojis,
      'isCustom': instance.isCustom,
    };

_$EmojiItemImpl _$$EmojiItemImplFromJson(Map<String, dynamic> json) =>
    _$EmojiItemImpl(
      code: json['code'] as String,
      emoji: json['emoji'] as String,
      name: json['name'] as String?,
      isCustom: json['isCustom'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$EmojiItemImplToJson(_$EmojiItemImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'emoji': instance.emoji,
      'name': instance.name,
      'isCustom': instance.isCustom,
      'imageUrl': instance.imageUrl,
    };

_$RecentEmojisImpl _$$RecentEmojisImplFromJson(Map<String, dynamic> json) =>
    _$RecentEmojisImpl(
      emojis:
          (json['emojis'] as List<dynamic>?)
              ?.map((e) => EmojiItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      maxCount: (json['maxCount'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$$RecentEmojisImplToJson(_$RecentEmojisImpl instance) =>
    <String, dynamic>{'emojis': instance.emojis, 'maxCount': instance.maxCount};
