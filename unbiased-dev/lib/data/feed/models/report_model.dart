// To parse this JSON data, do
//
//     final reportResponse = reportResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'report_model.freezed.dart';
part 'report_model.g.dart';
// To parse this JSON data, do

ReportRequest reportRequestFromJson(String str) =>
    ReportRequest.fromJson(json.decode(str));

String reportRequestToJson(ReportRequest data) => json.encode(data.toJson());

@freezed
class ReportRequest with _$ReportRequest {
  const factory ReportRequest({
    @JsonKey(name: "article_id") String? articleId,
    @JsonKey(name: "reason") String? reason,
  }) = _ReportRequest;

  factory ReportRequest.fromJson(Map<String, dynamic> json) =>
      _$ReportRequestFromJson(json);
}

ReportResponse reportResponseFromJson(String str) =>
    ReportResponse.fromJson(json.decode(str));

String reportResponseToJson(ReportResponse data) => json.encode(data.toJson());

@freezed
class ReportResponse with _$ReportResponse {
  const factory ReportResponse({
    @JsonKey(name: "reason") String? reason,
  }) = _ReportResponse;

  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);
}
