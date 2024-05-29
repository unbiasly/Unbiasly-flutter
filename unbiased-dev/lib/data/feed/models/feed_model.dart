// To parse this JSON data, do
//
//     final getFeedResponse = getFeedResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:unbiased/view/screens/feeds/article_action_new.dart';

part 'feed_model.freezed.dart';
part 'feed_model.g.dart';

GetFeedResponse getFeedResponseFromJson(String str) =>
    GetFeedResponse.fromJson(json.decode(str));

String getFeedResponseToJson(GetFeedResponse data) =>
    json.encode(data.toJson());

@freezed
class GetFeedResponse with _$GetFeedResponse {
  const factory GetFeedResponse({
    @JsonKey(name: "articles") List<Article>? articles,
  }) = _GetFeedResponse;

  factory GetFeedResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFeedResponseFromJson(json);
}

@freezed
class Article with _$Article {
  const factory Article({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "article_id") String? articleId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "body") String? body,
    @JsonKey(name: "body_short") String? bodyShort,
    @JsonKey(name: "thumbnail_url") String? thumbnailUrl,
    @JsonKey(name: "thumbnail_type") String? thumbnailType,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "date") DateTime? date,
    @JsonKey(name: "likes") int? likes,
    @JsonKey(name: "dislikes") int? dislikes,
    @JsonKey(name: "views") int? views,
    @JsonKey(name: "bookmarks") int? bookmarks,
    @JsonKey(name: "share") int? share,
    @JsonKey(name: "language") String? language,
    @JsonKey(name: "category") List<OwnCategoryElement>? category,
    @JsonKey(name: "tags") List<dynamic>? tags,
    @JsonKey(name: "source") Source? source,
    @JsonKey(name: "is_deleted") bool? isDeleted,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "created_by") String? createdBy,
    @JsonKey(name: "updated_by") String? updatedBy,
    @JsonKey(name: "verifiedSource") String? verifiedSource,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
    @JsonKey(name: "author_name") String? authorName,
    @JsonKey(name: "sentiment") String? sentiment,
    @JsonKey(name: "categories") List<TagsInfoElement>? categories,
    @JsonKey(name: "tagsInfo") List<TagsInfoElement>? tagsInfo,
    @JsonKey(name: "sourceInfo") SourceInfo? sourceInfo,
    @JsonKey(name: "ownCategories") List<OwnCategoryElement>? ownCategories,
    @JsonKey(name: "notification") bool? notification,
    @JsonKey(name: "action") ArticleActionNew? articleActionNew,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@freezed
class TagsInfoElement with _$TagsInfoElement {
  const factory TagsInfoElement({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "name") String? name,
  }) = _TagsInfoElement;

  factory TagsInfoElement.fromJson(Map<String, dynamic> json) =>
      _$TagsInfoElementFromJson(json);
}

@freezed
class OwnCategoryElement with _$OwnCategoryElement {
  const factory OwnCategoryElement({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "sources") List<dynamic>? sources,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
    @JsonKey(name: "count") int? count,
  }) = _OwnCategoryElement;

  factory OwnCategoryElement.fromJson(Map<String, dynamic> json) =>
      _$OwnCategoryElementFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "source_id") String? sourceId,
    @JsonKey(name: "source_url") String? sourceUrl,
    @JsonKey(name: "source_icon") String? sourceIcon,
    @JsonKey(name: "source_priority") int? sourcePriority,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

@freezed
class SourceInfo with _$SourceInfo {
  const factory SourceInfo({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "source_id") String? sourceId,
    @JsonKey(name: "source_url") String? sourceUrl,
    @JsonKey(name: "source_icon") String? sourceIcon,
    @JsonKey(name: "source_priority") int? sourcePriority,
  }) = _SourceInfo;

  factory SourceInfo.fromJson(Map<String, dynamic> json) =>
      _$SourceInfoFromJson(json);
}

FeedListRequest feedListRequestFromJson(String str) =>
    FeedListRequest.fromJson(json.decode(str));

String feedListRequestToJson(FeedListRequest data) =>
    json.encode(data.toJson());

@freezed
class FeedListRequest with _$FeedListRequest {
  const factory FeedListRequest({
    @JsonKey(name: "categoryIds") List<String>? categoryIds,
    @JsonKey(name: "sourceIds") List<String>? sourceIds,
    @JsonKey(name: "language") String? language,
    @JsonKey(name: "page") int? page,
  }) = _FeedListRequest;

  factory FeedListRequest.fromJson(Map<String, dynamic> json) =>
      _$FeedListRequestFromJson(json);
}
