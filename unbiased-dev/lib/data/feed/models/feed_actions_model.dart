// To parse this JSON data, do
//
//     final feedActionResponse = feedActionResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'feed_actions_model.freezed.dart';
part 'feed_actions_model.g.dart';

FeedActionResponse feedActionResponseFromJson(String str) =>
    FeedActionResponse.fromJson(json.decode(str));

String feedActionResponseToJson(FeedActionResponse data) =>
    json.encode(data.toJson());

@freezed
class FeedActionResponse with _$FeedActionResponse {
  const factory FeedActionResponse({
    @JsonKey(name: "articleAction") List<ArticleAction>? articleAction,
  }) = _FeedActionResponse;

  factory FeedActionResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedActionResponseFromJson(json);
}

@freezed
class ArticleAction with _$ArticleAction {
  const factory ArticleAction({
    @JsonKey(name: "is_liked") bool? isLiked,
    @JsonKey(name: "is_disliked") bool? isDisliked,
    @JsonKey(name: "is_bookmarked") bool? isBookmarked,
    @JsonKey(name: "is_viewed") bool? isViewed,
    @JsonKey(name: "is_shared") bool? isShared,
    @JsonKey(name: "shared_count") int? sharedCount,
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "article_id") ArticleId? articleId,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
  }) = _ArticleAction;

  factory ArticleAction.fromJson(Map<String, dynamic> json) =>
      _$ArticleActionFromJson(json);
}

@freezed
class ArticleId with _$ArticleId {
  const factory ArticleId({
    @JsonKey(name: "date") DateTime? date,
    @JsonKey(name: "likes") int? likes,
    @JsonKey(name: "dislikes") int? dislikes,
    @JsonKey(name: "views") int? views,
    @JsonKey(name: "bookmarks") int? bookmarks,
    @JsonKey(name: "share") int? share,
    @JsonKey(name: "category") List<Category>? category,
    @JsonKey(name: "tags") List<Category>? tags,
    @JsonKey(name: "is_deleted") bool? isDeleted,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "article_id") String? articleId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "body") String? body,
    @JsonKey(name: "body_short") String? bodyShort,
    @JsonKey(name: "source") Source? source,
    @JsonKey(name: "thumbnail_url") String? thumbnailUrl,
    @JsonKey(name: "thumbnail_type") String? thumbnailType,
    @JsonKey(name: "language") String? language,
    @JsonKey(name: "author_name") String? authorName,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "ownCategories") List<OwnCategory>? ownCategories,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
  }) = _ArticleId;

  factory ArticleId.fromJson(Map<String, dynamic> json) =>
      _$ArticleIdFromJson(json);
}

@freezed
class OwnCategory with _$OwnCategory {
  const factory OwnCategory({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "sources") List<dynamic>? sources,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
    @JsonKey(name: "count") int? count,
  }) = _OwnCategory;

  factory OwnCategory.fromJson(Map<String, dynamic> json) =>
      _$OwnCategoryFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    @JsonKey(name: "source_priority") int? sourcePriority,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "source_id") String? sourceId,
    @JsonKey(name: "source_url") String? sourceUrl,
    @JsonKey(name: "source_icon") String? sourceIcon,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
