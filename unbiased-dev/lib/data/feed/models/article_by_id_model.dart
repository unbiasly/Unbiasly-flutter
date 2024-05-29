// To parse this JSON data, do
//
//     final articleByIdResponse = articleByIdResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'article_by_id_model.freezed.dart';
part 'article_by_id_model.g.dart';

ArticleByIdResponse articleByIdResponseFromJson(String str) =>
    ArticleByIdResponse.fromJson(json.decode(str));

String articleByIdResponseToJson(ArticleByIdResponse data) =>
    json.encode(data.toJson());

@freezed
class ArticleByIdResponse with _$ArticleByIdResponse {
  const factory ArticleByIdResponse({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "article_id") String? articleId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "body") String? body,
    @JsonKey(name: "body_short") String? bodyShort,
    @JsonKey(name: "thumbnail_url") String? thumbnailUrl,
    @JsonKey(name: "thumbnail_type") String? thumbnailType,
    @JsonKey(name: "author_name") String? authorName,
    @JsonKey(name: "link") String? link,
    @JsonKey(name: "date") DateTime? date,
    @JsonKey(name: "likes") int? likes,
    @JsonKey(name: "dislikes") int? dislikes,
    @JsonKey(name: "views") int? views,
    @JsonKey(name: "bookmarks") int? bookmarks,
    @JsonKey(name: "share") int? share,
    @JsonKey(name: "language") String? language,
    @JsonKey(name: "category") List<Category>? category,
    @JsonKey(name: "tags") List<Category>? tags,
    @JsonKey(name: "source") Source? source,
    @JsonKey(name: "is_deleted") bool? isDeleted,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "ownCategories") List<OwnCategory>? ownCategories,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
  }) = _ArticleByIdResponse;

  factory ArticleByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleByIdResponseFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
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
