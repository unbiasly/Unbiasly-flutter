// To parse this JSON data, do
//
//     final updateUsernameRequest = updateUsernameRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_username_model.freezed.dart';
part 'update_username_model.g.dart';

UpdateUsernameRequest updateUsernameRequestFromJson(String str) =>
    UpdateUsernameRequest.fromJson(json.decode(str));

String updateUsernameRequestToJson(UpdateUsernameRequest data) =>
    json.encode(data.toJson());

@freezed
class UpdateUsernameRequest with _$UpdateUsernameRequest {
  const factory UpdateUsernameRequest({
    @JsonKey(name: "name") String? name,
  }) = _UpdateUsernameRequest;

  factory UpdateUsernameRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUsernameRequestFromJson(json);
}

UpdateUsernameResponse updateUsernameResponseFromJson(String str) =>
    UpdateUsernameResponse.fromJson(json.decode(str));

String updateUsernameResponseToJson(UpdateUsernameResponse data) =>
    json.encode(data.toJson());

@freezed
class UpdateUsernameResponse with _$UpdateUsernameResponse {
  const factory UpdateUsernameResponse({
    @JsonKey(name: "success") bool? success,
  }) = _UpdateUsernameResponse;

  factory UpdateUsernameResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUsernameResponseFromJson(json);
}
