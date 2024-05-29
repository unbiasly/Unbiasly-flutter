// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetFeedResponseImpl _$$GetFeedResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetFeedResponseImpl(
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetFeedResponseImplToJson(
        _$GetFeedResponseImpl instance) =>
    <String, dynamic>{
      'articles': instance.articles,
    };

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) {
  print(":-------- ${json['action']}");

  return _$ArticleImpl(
    id: json['_id'] as String?,
    articleId: json['article_id'] as String?,
    title: json['title'] as String?,
    body: json['body'] as String?,
    bodyShort: json['body_short'] as String?,
    thumbnailUrl: json['thumbnail_url'] as String?,
    thumbnailType: json['thumbnail_type'] as String?,
    link: json['link'] as String?,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    likes: json['likes'] as int?,
    dislikes: json['dislikes'] as int?,
    views: json['views'] as int?,
    bookmarks: json['bookmarks'] as int?,
    share: json['share'] as int?,
    language: json['language'] as String?,
    category: (json['category'] as List<dynamic>?)
        ?.map((e) => OwnCategoryElement.fromJson(e as Map<String, dynamic>))
        .toList(),
    tags: json['tags'] as List<dynamic>?,
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
    isDeleted: json['is_deleted'] as bool?,
    status: json['status'] as String?,
    createdBy: json['created_by'] as String?,
    updatedBy: json['updated_by'] as String?,
    verifiedSource: json['verifiedSource'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as int?,
    authorName: json['author_name'] as String?,
    sentiment: json['sentiment'] as String?,
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => TagsInfoElement.fromJson(e as Map<String, dynamic>))
        .toList(),
    tagsInfo: (json['tagsInfo'] as List<dynamic>?)
        ?.map((e) => TagsInfoElement.fromJson(e as Map<String, dynamic>))
        .toList(),
    sourceInfo: json['sourceInfo'] == null
        ? null
        : SourceInfo.fromJson(json['sourceInfo'] as Map<String, dynamic>),
    ownCategories: (json['ownCategories'] as List<dynamic>?)
        ?.map((e) => OwnCategoryElement.fromJson(e as Map<String, dynamic>))
        .toList(),
    notification: json['notification'] as bool?,
    articleActionNew: json['action'] == null
        ? null
        : ArticleActionNew.fromJson(json['action'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'article_id': instance.articleId,
      'title': instance.title,
      'body': instance.body,
      'body_short': instance.bodyShort,
      'thumbnail_url': instance.thumbnailUrl,
      'thumbnail_type': instance.thumbnailType,
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
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'verifiedSource': instance.verifiedSource,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'author_name': instance.authorName,
      'sentiment': instance.sentiment,
      'categories': instance.categories,
      'tagsInfo': instance.tagsInfo,
      'sourceInfo': instance.sourceInfo,
      'ownCategories': instance.ownCategories,
      'notification': instance.notification,
      'action': instance.articleActionNew,
    };

_$TagsInfoElementImpl _$$TagsInfoElementImplFromJson(
        Map<String, dynamic> json) =>
    _$TagsInfoElementImpl(
      id: json['_id'] as String?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$TagsInfoElementImplToJson(
        _$TagsInfoElementImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
    };

_$OwnCategoryElementImpl _$$OwnCategoryElementImplFromJson(
        Map<String, dynamic> json) =>
    _$OwnCategoryElementImpl(
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

Map<String, dynamic> _$$OwnCategoryElementImplToJson(
        _$OwnCategoryElementImpl instance) =>
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

_$SourceInfoImpl _$$SourceInfoImplFromJson(Map<String, dynamic> json) =>
    _$SourceInfoImpl(
      id: json['_id'] as String?,
      sourceId: json['source_id'] as String?,
      sourceUrl: json['source_url'] as String?,
      sourceIcon: json['source_icon'] as String?,
      sourcePriority: json['source_priority'] as int?,
    );

Map<String, dynamic> _$$SourceInfoImplToJson(_$SourceInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'source_id': instance.sourceId,
      'source_url': instance.sourceUrl,
      'source_icon': instance.sourceIcon,
      'source_priority': instance.sourcePriority,
    };

_$FeedListRequestImpl _$$FeedListRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedListRequestImpl(
      categoryIds: (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sourceIds: (json['sourceIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      language: json['language'] as String?,
      page: json['page'] as int?,
    );

Map<String, dynamic> _$$FeedListRequestImplToJson(
        _$FeedListRequestImpl instance) =>
    <String, dynamic>{
      'categoryIds': instance.categoryIds,
      'sourceIds': instance.sourceIds,
      'language': instance.language,
      'page': instance.page,
    };
