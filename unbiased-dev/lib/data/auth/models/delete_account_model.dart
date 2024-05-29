// To parse this JSON data, do
//
//     final deleteAccountResponse = deleteAccountResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'delete_account_model.freezed.dart';
part 'delete_account_model.g.dart';

DeleteAccountResponse deleteAccountResponseFromJson(String str) =>
    DeleteAccountResponse.fromJson(json.decode(str));

String deleteAccountResponseToJson(DeleteAccountResponse data) =>
    json.encode(data.toJson());

@freezed
class DeleteAccountResponse with _$DeleteAccountResponse {
  const factory DeleteAccountResponse() = _DeleteAccountResponse;

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountResponseFromJson(json);
}
