// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserPreferenceResponseImpl _$$GetUserPreferenceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserPreferenceResponseImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetUserPreferenceResponseImplToJson(
        _$GetUserPreferenceResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
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
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'article_category': instance.articleCategory,
      'article_tag': instance.articleTag,
      'source': instance.source,
      'notification': instance.notification,
      '_id': instance.id,
      'user_id': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'language': instance.language,
    };
