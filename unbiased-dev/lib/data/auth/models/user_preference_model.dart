// To parse this JSON data, do
//
//     final getUserPreferenceResponse = getUserPreferenceResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_preference_model.freezed.dart';
part 'user_preference_model.g.dart';

GetUserPreferenceResponse getUserPreferenceResponseFromJson(String str) =>
    GetUserPreferenceResponse.fromJson(json.decode(str));

String getUserPreferenceResponseToJson(GetUserPreferenceResponse data) =>
    json.encode(data.toJson());

@freezed
class GetUserPreferenceResponse with _$GetUserPreferenceResponse {
  const factory GetUserPreferenceResponse({
    @JsonKey(name: "data") List<Datum>? data,
  }) = _GetUserPreferenceResponse;

  factory GetUserPreferenceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserPreferenceResponseFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    @JsonKey(name: "article_category") List<String>? articleCategory,
    @JsonKey(name: "article_tag") List<dynamic>? articleTag,
    @JsonKey(name: "source") List<String>? source,
    @JsonKey(name: "notification") bool? notification,
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "updatedAt") DateTime? updatedAt,
    @JsonKey(name: "language") String? language,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
