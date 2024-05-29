// To parse this JSON data, do
//
//     final notificationListResponse = notificationListResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'notification_list_model.freezed.dart';
part 'notification_list_model.g.dart';

NotificationListResponse notificationListResponseFromJson(String str) =>
    NotificationListResponse.fromJson(json.decode(str));

String notificationListResponseToJson(NotificationListResponse data) =>
    json.encode(data.toJson());

@freezed
class NotificationListResponse with _$NotificationListResponse {
  const factory NotificationListResponse({
    @JsonKey(name: "articleAction") List<ArticleAction>? articleAction,
  }) = _NotificationListResponse;

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseFromJson(json);
}

@freezed
class ArticleAction with _$ArticleAction {
  const factory ArticleAction({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "article") Article? article,
    @JsonKey(name: "user") User? user,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
  }) = _ArticleAction;

  factory ArticleAction.fromJson(Map<String, dynamic> json) =>
      _$ArticleActionFromJson(json);
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
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
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
class User with _$User {
  const factory User({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "device_token") List<String>? deviceToken,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
