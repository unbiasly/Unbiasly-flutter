import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unbiased/core/api_client.dart';
import 'package:unbiased/core/core.dart';
import 'package:unbiased/core/exceptions.dart';
import 'package:unbiased/data/auth/auth_repo_impl.dart';
import 'package:unbiased/data/auth/models/delete_account_model.dart';
import 'package:unbiased/data/auth/models/feedback_model.dart';
import 'package:unbiased/data/auth/models/sign_in_model.dart';
import 'package:unbiased/data/auth/models/update_preference_model.dart';
import 'package:unbiased/data/auth/models/update_username_model.dart';
import 'package:unbiased/data/auth/models/user_preference_model.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiClient _apiClient;
  AuthRepoImpl(this._apiClient);
  Map<String, dynamic>? userData = {};
  Future<Map<String, dynamic>?> getJson(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }

  // ignore: avoid_void_async
  void clearKey(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future<Either<ApiException, LoginResponse>> socialSignin(
    LoginRequest loginRequest,
  ) async {
    try {
      final response = await _apiClient.post(
        "${AppConstants.baseUrl}/auth",
        loginRequestToJson(loginRequest),
      );
      print("*-*-*-*---*--*-*--* ${response.data}");
      userData = await getJson('user_data');
      // updateUserName(
      //   UpdateUsernameRequest(
      //     name: userData?['name'],
      //   ),
      // ).then((value) {
      //   // clearKey('user_data');
      //   // isEdit = false;
      //   // setState(() {});
      // });
      return Right(LoginResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, LoginResponse>> getUserDetails() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}/userDetails",
      );
      return Right(LoginResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, UpdateUsernameResponse>> updateUserName(
    UpdateUsernameRequest updateUsernameRequest,
  ) async {
    try {
      final response = await _apiClient.patch(
        "${AppConstants.baseUrl}/userDetails",
        updateUsernameRequestToJson(updateUsernameRequest),
      );
      return Right(UpdateUsernameResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, GetUserPreferenceResponse>>
      getUserPreference() async {
    try {
      final response =
          await _apiClient.get("${AppConstants.baseUrl}/user-preferences");
      return Right(GetUserPreferenceResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, UpdatePreferenceResponse>>
      updatePreference() async {
    try {
      List<String> cat = [];
      // List<String> sou = [];s
      cat.addAll(AppConstants.selectedIndexCategory);
      // sou.addAll(AppConstants.selectedIndexSources);

      final UpdatePreferenceRequest updatePreferenceRequest =
          UpdatePreferenceRequest(
        articleCategory: cat,
        language: AppConstants.language == "hi" ? "hindi" : "english",
        source: [],
      );
      print(updatePreferenceRequest);
      final response = await _apiClient.patch(
        "${AppConstants.baseUrl}/user-preferences",
        updatePreferenceRequestToJson(updatePreferenceRequest),
      );
      return Right(UpdatePreferenceResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, FeedBackResponse>> addFeedback(
    FeedBackRequest feedBackRequest,
  ) async {
    try {
      final response = await _apiClient.post(
        "${AppConstants.baseUrl}/feedback",
        feedBackRequestToJson(feedBackRequest),
      );
      return Right(FeedBackResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, DeleteAccountResponse>> deleteAccount() async {
    try {
      final response = await _apiClient.delete(
        "${AppConstants.baseUrl}/deleteAccount",
      );
      return Right(DeleteAccountResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
