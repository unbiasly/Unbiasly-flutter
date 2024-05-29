// To parse this JSON data, do
//
//     final getCategoryResponse = getCategoryResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

GetCategoryResponse getCategoryResponseFromJson(String str) =>
    GetCategoryResponse.fromJson(json.decode(str));

String getCategoryResponseToJson(GetCategoryResponse data) =>
    json.encode(data.toJson());

@freezed
class GetCategoryResponse with _$GetCategoryResponse {
  const factory GetCategoryResponse({
    @JsonKey(name: "articleCategory") List<ArticleCategory>? articleCategory,
  }) = _GetCategoryResponse;

  factory GetCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryResponseFromJson(json);
}

@freezed
class ArticleCategory with _$ArticleCategory {
  const factory ArticleCategory({
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
  }) = _ArticleCategory;

  factory ArticleCategory.fromJson(Map<String, dynamic> json) =>
      _$ArticleCategoryFromJson(json);
}
