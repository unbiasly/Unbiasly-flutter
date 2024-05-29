// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_actions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedActionResponseImpl _$$FeedActionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedActionResponseImpl(
      articleAction: (json['articleAction'] as List<dynamic>?)
          ?.map((e) => ArticleAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FeedActionResponseImplToJson(
        _$FeedActionResponseImpl instance) =>
    <String, dynamic>{
      'articleAction': instance.articleAction,
    };

_$ArticleActionImpl _$$ArticleActionImplFromJson(Map<String, dynamic> json) =>
    _$ArticleActionImpl(
      isLiked: json['is_liked'] as bool?,
      isDisliked: json['is_disliked'] as bool?,
      isBookmarked: json['is_bookmarked'] as bool?,
      isViewed: json['is_viewed'] as bool?,
      isShared: json['is_shared'] as bool?,
      sharedCount: json['shared_count'] as int?,
      id: json['_id'] as String?,
      userId: json['user_id'] as String?,
      articleId: json['article_id'] == null
          ? null
          : ArticleId.fromJson(json['article_id'] as Map<String, dynamic>),
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
      'is_liked': instance.isLiked,
      'is_disliked': instance.isDisliked,
      'is_bookmarked': instance.isBookmarked,
      'is_viewed': instance.isViewed,
      'is_shared': instance.isShared,
      'shared_count': instance.sharedCount,
      '_id': instance.id,
      'user_id': instance.userId,
      'article_id': instance.articleId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

_$ArticleIdImpl _$$ArticleIdImplFromJson(Map<String, dynamic> json) =>
    _$ArticleIdImpl(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      likes: json['likes'] as int?,
      dislikes: json['dislikes'] as int?,
      views: json['views'] as int?,
      bookmarks: json['bookmarks'] as int?,
      share: json['share'] as int?,
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      isDeleted: json['is_deleted'] as bool?,
      status: json['status'] as String?,
      id: json['_id'] as String?,
      articleId: json['article_id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      bodyShort: json['body_short'] as String?,
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      thumbnailUrl: json['thumbnail_url'] as String?,
      thumbnailType: json['thumbnail_type'] as String?,
      language: json['language'] as String?,
      authorName: json['author_name'] as String?,
      link: json['link'] as String?,
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

Map<String, dynamic> _$$ArticleIdImplToJson(_$ArticleIdImpl instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'views': instance.views,
      'bookmarks': instance.bookmarks,
      'share': instance.share,
      'category': instance.category,
      'tags': instance.tags,
      'is_deleted': instance.isDeleted,
      'status': instance.status,
      '_id': instance.id,
      'article_id': instance.articleId,
      'title': instance.title,
      'body': instance.body,
      'body_short': instance.bodyShort,
      'source': instance.source,
      'thumbnail_url': instance.thumbnailUrl,
      'thumbnail_type': instance.thumbnailType,
      'language': instance.language,
      'author_name': instance.authorName,
      'link': instance.link,
      'ownCategories': instance.ownCategories,
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

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['_id'] as String?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
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
      'slug': instance.slug,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

_$SourceImpl _$$SourceImplFromJson(Map<String, dynamic> json) => _$SourceImpl(
      sourcePriority: json['source_priority'] as int?,
      status: json['status'] as String?,
      id: json['_id'] as String?,
      sourceId: json['source_id'] as String?,
      sourceUrl: json['source_url'] as String?,
      sourceIcon: json['source_icon'] as String?,
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
      'source_priority': instance.sourcePriority,
      'status': instance.status,
      '_id': instance.id,
      'source_id': instance.sourceId,
      'source_url': instance.sourceUrl,
      'source_icon': instance.sourceIcon,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
