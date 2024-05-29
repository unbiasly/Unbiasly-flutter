// To parse this JSON data, do
//
//     final feedBackResponse = feedBackResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

FeedBackResponse feedBackResponseFromJson(String str) =>
    FeedBackResponse.fromJson(json.decode(str));

String feedBackResponseToJson(FeedBackResponse data) =>
    json.encode(data.toJson());

@freezed
class FeedBackResponse with _$FeedBackResponse {
  const factory FeedBackResponse({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
  }) = _FeedBackResponse;

  factory FeedBackResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedBackResponseFromJson(json);
}

FeedBackRequest feedBackRequestFromJson(String str) =>
    FeedBackRequest.fromJson(json.decode(str));

String feedBackRequestToJson(FeedBackRequest data) =>
    json.encode(data.toJson());

@freezed
class FeedBackRequest with _$FeedBackRequest {
  const factory FeedBackRequest({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
  }) = _FeedBackRequest;

  factory FeedBackRequest.fromJson(Map<String, dynamic> json) =>
      _$FeedBackRequestFromJson(json);
}
