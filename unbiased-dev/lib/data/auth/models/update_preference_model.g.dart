// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_preference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdatePreferenceRequestImpl _$$UpdatePreferenceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePreferenceRequestImpl(
      articleCategory: (json['article_category'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      source:
          (json['source'] as List<dynamic>?)?.map((e) => e as String).toList(),
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$UpdatePreferenceRequestImplToJson(
        _$UpdatePreferenceRequestImpl instance) =>
    <String, dynamic>{
      'article_category': instance.articleCategory,
      'source': instance.source,
      'language': instance.language,
    };

_$UpdatePreferenceResponseImpl _$$UpdatePreferenceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePreferenceResponseImpl(
      articleCategory: (json['article_category'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      articleTag: json['article_tag'] as List<dynamic>?,
      source:
          (json['source'] as List<dynamic>?)?.map((e) => e as String).toList(),
      notification: json['notification'] as bool?,
      id: json['_id'] as String?,
      userId: json['user_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$UpdatePreferenceResponseImplToJson(
        _$UpdatePreferenceResponseImpl instance) =>
    <String, dynamic>{
      'article_category': instance.articleCategory,
      'article_tag': instance.articleTag,
      'source': instance.source,
      'notification': instance.notification,
      '_id': instance.id,
      'user_id': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'language': instance.language,
    };
