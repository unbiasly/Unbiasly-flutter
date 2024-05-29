// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationListResponseImpl _$$NotificationListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationListResponseImpl(
      articleAction: (json['articleAction'] as List<dynamic>?)
          ?.map((e) => ArticleAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NotificationListResponseImplToJson(
        _$NotificationListResponseImpl instance) =>
    <String, dynamic>{
      'articleAction': instance.articleAction,
    };

_$ArticleActionImpl _$$ArticleActionImplFromJson(Map<String, dynamic> json) =>
    _$ArticleActionImpl(
      id: json['_id'] as String?,
      article: json['article'] == null
          ? null
          : Article.fromJson(json['article'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$$ArticleActionImplToJson(_$ArticleActionImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'article': instance.article,
      'user': instance.user,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
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
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
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

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['_id'] as String?,
      userId: json['user_id'] as String?,
      deviceToken: (json['device_token'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'device_token': instance.deviceToken,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
