// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCategoryResponseImpl _$$GetCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCategoryResponseImpl(
      articleCategory: (json['articleCategory'] as List<dynamic>?)
          ?.map((e) => ArticleCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetCategoryResponseImplToJson(
        _$GetCategoryResponseImpl instance) =>
    <String, dynamic>{
      'articleCategory': instance.articleCategory,
    };

_$ArticleCategoryImpl _$$ArticleCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticleCategoryImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$$ArticleCategoryImplToJson(
        _$ArticleCategoryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'image': instance.image,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
