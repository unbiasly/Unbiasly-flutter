// To parse this JSON data, do
//
//     final getTagResponse = getTagResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

GetTagResponse getTagResponseFromJson(String str) =>
    GetTagResponse.fromJson(json.decode(str));

String getTagResponseToJson(GetTagResponse data) => json.encode(data.toJson());

@freezed
class GetTagResponse with _$GetTagResponse {
  const factory GetTagResponse({
    @JsonKey(name: "source") List<Source>? source,
  }) = _GetTagResponse;

  factory GetTagResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTagResponseFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    @JsonKey(name: "source_priority") int? sourcePriority,
    @JsonKey(name: "_id") String? id,
    @JsonKey(name: "source_id") String? sourceId,
    @JsonKey(name: "source_url") String? sourceUrl,
    @JsonKey(name: "source_icon") String? sourceIcon,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
