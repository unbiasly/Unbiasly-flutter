// To parse this JSON data, do
//
//     final actionPerformedResponse = actionPerformedResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'actions_performed_model.freezed.dart';
part 'actions_performed_model.g.dart';

ActionPerformedResponse actionPerformedResponseFromJson(String str) =>
    ActionPerformedResponse.fromJson(json.decode(str));

String actionPerformedResponseToJson(ActionPerformedResponse data) =>
    json.encode(data.toJson());

@freezed
class ActionPerformedResponse with _$ActionPerformedResponse {
  const factory ActionPerformedResponse({
    @JsonKey(name: "is_liked") bool? isLiked,
    @JsonKey(name: "is_disliked") bool? isDisliked,
    @JsonKey(name: "is_bookmarked") bool? isBookmarked,
    @JsonKey(name: "is_viewed") bool? isViewed,
    @JsonKey(name: "is_shared") bool? isShared,
    @JsonKey(name: "shared_count") int? sharedCount,
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "article_id") String? articleId,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
  }) = _ActionPerformedResponse;

  factory ActionPerformedResponse.fromJson(Map<String, dynamic> json) =>
      _$ActionPerformedResponseFromJson(json);
}
