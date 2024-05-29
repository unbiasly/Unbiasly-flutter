import 'package:dartz/dartz.dart';
import 'package:unbiased/core/exceptions.dart';
import 'package:unbiased/data/auth/models/delete_account_model.dart';
import 'package:unbiased/data/auth/models/feedback_model.dart';
import 'package:unbiased/data/auth/models/sign_in_model.dart';
import 'package:unbiased/data/auth/models/update_preference_model.dart';
import 'package:unbiased/data/auth/models/update_username_model.dart';
import 'package:unbiased/data/auth/models/user_preference_model.dart';

abstract class AuthRepo {
  Future<Either<ApiException, LoginResponse>> socialSignin(
    LoginRequest loginRequest,
  );
  Future<Either<ApiException, LoginResponse>> getUserDetails();
  Future<Either<ApiException, UpdateUsernameResponse>> updateUserName(
    UpdateUsernameRequest updateUsernameRequest,
  );
  Future<Either<ApiException, GetUserPreferenceResponse>> getUserPreference();
  Future<Either<ApiException, UpdatePreferenceResponse>> updatePreference();
  Future<Either<ApiException, FeedBackResponse>> addFeedback(
      FeedBackRequest feedBackRequest);
  Future<Either<ApiException, DeleteAccountResponse>> deleteAccount();
}
