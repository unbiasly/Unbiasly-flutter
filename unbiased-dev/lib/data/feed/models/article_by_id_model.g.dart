// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleByIdResponseImpl _$$ArticleByIdResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticleByIdResponseImpl(
      id: json['_id'] as String?,
      articleId: json['article_id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      bodyShort: json['body_short'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      thumbnailType: json['thumbnail_type'] as String?,
      authorName: json['author_name'] as String?,
      link: json['link'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      likes: json['likes'] as int?,
      dislikes: json['dislikes'] as int?,
      views: json['views'] as int?,
      bookmarks: json['bookmarks'] as int?,
      share: json['share'] as int?,
      language: json['language'] as String?,
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      isDeleted: json['is_deleted'] as bool?,
      status: json['status'] as String?,
      ownCategories: (json['ownCategories'] as List<dynamic>?)
          ?.map((e) => OwnCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$$ArticleByIdResponseImplToJson(
        _$ArticleByIdResponseImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'article_id': instance.articleId,
      'title': instance.title,
      'body': instance.body,
      'body_short': instance.bodyShort,
      'thumbnail_url': instance.thumbnailUrl,
      'thumbnail_type': instance.thumbnailType,
      'author_name': instance.authorName,
      'link': instance.link,
      'date': instance.date?.toIso8601String(),
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'views': instance.views,
      'bookmarks': instance.bookmarks,
      'share': instance.share,
      'language': instance.language,
      'category': instance.category,
      'tags': instance.tags,
      'source': instance.source,
      'is_deleted': instance.isDeleted,
      'status': instance.status,
      'ownCategories': instance.ownCategories,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

_$OwnCategoryImpl _$$OwnCategoryImplFromJson(Map<String, dynamic> json) =>
    _$OwnCategoryImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      sources: json['sources'] as List<dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$OwnCategoryImplToJson(_$OwnCategoryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'sources': instance.sources,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'count': instance.count,
    };

_$SourceImpl _$$SourceImplFromJson(Map<String, dynamic> json) => _$SourceImpl(
      id: json['_id'] as String?,
      sourceId: json['source_id'] as String?,
      sourceUrl: json['source_url'] as String?,
      sourceIcon: json['source_icon'] as String?,
      sourcePriority: json['source_priority'] as int?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$$SourceImplToJson(_$SourceImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'source_id': instance.sourceId,
      'source_url': instance.sourceUrl,
      'source_icon': instance.sourceIcon,
      'source_priority': instance.sourcePriority,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
