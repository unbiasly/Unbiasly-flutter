// To parse this JSON data, do
//
//     final updatePreferenceRequest = updatePreferenceRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_preference_model.freezed.dart';
part 'update_preference_model.g.dart';

UpdatePreferenceRequest updatePreferenceRequestFromJson(String str) =>
    UpdatePreferenceRequest.fromJson(json.decode(str));

String updatePreferenceRequestToJson(UpdatePreferenceRequest data) =>
    json.encode(data.toJson());

@freezed
class UpdatePreferenceRequest with _$UpdatePreferenceRequest {
  const factory UpdatePreferenceRequest({
    @JsonKey(name: "article_category") List<String>? articleCategory,
    @JsonKey(name: "source") List<String>? source,
    @JsonKey(name: "language") String? language,
  }) = _UpdatePreferenceRequest;

  factory UpdatePreferenceRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePreferenceRequestFromJson(json);
}

UpdatePreferenceResponse updatePreferenceResponseFromJson(String str) =>
    UpdatePreferenceResponse.fromJson(json.decode(str));

String updatePreferenceResponseToJson(UpdatePreferenceResponse data) =>
    json.encode(data.toJson());

@freezed
class UpdatePreferenceResponse with _$UpdatePreferenceResponse {
  const factory UpdatePreferenceResponse({
    @JsonKey(name: "article_category") List<String>? articleCategory,
    @JsonKey(name: "article_tag") List<dynamic>? articleTag,
    @JsonKey(name: "source") List<String>? source,
    @JsonKey(name: "notification") bool? notification,
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "__v") int? v,
    @JsonKey(name: "language") String? language,
  }) = _UpdatePreferenceResponse;

  factory UpdatePreferenceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePreferenceResponseFromJson(json);
}
