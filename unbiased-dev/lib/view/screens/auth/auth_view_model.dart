import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:unbiased/core/core.dart';
import 'package:unbiased/data/auth/auth_repo_impl.dart';
import 'package:unbiased/data/auth/models/feedback_model.dart';
import 'package:unbiased/data/auth/models/sign_in_model.dart';
import 'package:unbiased/data/auth/models/update_username_model.dart';
import 'package:unbiased/domain/providers/repository_provider.dart';
import 'package:unbiased/helpers/base_view_model.dart';
import 'package:unbiased/helpers/locator.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/services/user_detail_service.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authViewModel = ChangeNotifierProvider.autoDispose(
  (ref) => AuthViewModel(
    ref.read(authRepositoryProvider),
  ),
);

Future<void> saveJson(String key, Map<String, dynamic> jsonData) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String jsonString = jsonEncode(jsonData);
  await prefs.setString(key, jsonString);
}

class AuthViewModel extends BaseViewModel<BaseScreenView> {
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  Map<String, dynamic> userInfo = {};
  final AuthRepo _authRepo;

  AuthViewModel(
    this._authRepo,
  );
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  LoginResponse? _loginResponse;
  LoginResponse? get loginResponse => _loginResponse;

  Future<void> signInWithGoogle(BuildContext context) async {
    toggleLoading();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final _user = userCredential.user;

      final firebaseToken =
          await FirebaseAuth.instance.currentUser?.getIdToken();
      Logger.write(firebaseToken.toString());

      print("-_____firebaseToken :-----  ${firebaseToken}");
      userInfo = {'name': _user?.displayName};
      // ignore: await_only_futures
      await saveJson('user_data', userInfo);
      // updateUserName(
      //   UpdateUsernameRequest(
      //     name: _user?.displayName,
      //   ),
      //   context,
      // ).then((value) {
      //   // isEdit = false;
      //   // setState(() {});
      // });

      // ignore: use_build_context_synchronously
      await socialSignin(
        LoginRequest(
          token: firebaseToken ?? "",
          deviceToken: AppConstants.fcmToken,
        ),
        context,
      );
    } catch (e) {
      print("eeeeeeeeeeeeeeeeeeeeeee$e");
      view?.showSnackbar("Google Signin cannot be completed");
    }
    toggleLoading();
  }

  Future<void> signInWithApple(BuildContext context) async {
    // FirebaseAuth auth = FirebaseAuth.instance;
    // // User? user;
    // final GoogleSignIn _googleSignIn = GoogleSignIn();
    toggleLoading();

    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      print(credential);
      final rawNonce = generateNonce();
      sha256ofString(rawNonce);

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: credential.identityToken,
        rawNonce: rawNonce,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      final firebaseToken =
          await FirebaseAuth.instance.currentUser?.getIdToken();
      log(firebaseToken.toString());
      await socialSignin(
        LoginRequest(
          token: firebaseToken ?? "",
          deviceToken: AppConstants.fcmToken,
        ),
        context,
      );
    } catch (e) {
      view?.showSnackbar("Apple Signin cannot be completed");
    }
    toggleLoading();
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  signOut() {
    _googleSignIn.signOut();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> socialSignin(
    LoginRequest loginRequest,
    BuildContext context,
  ) async {
    await _authRepo.socialSignin(loginRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
            print(".....message........  ${l.message}");
            print("+-+-+-+-+- loginRequestToJson :-   ${loginRequest}");
          }, (r) async {
            print("-------- RESPONSE OF SOCIAL LOGIN ${r.toJson()}");
            _loginResponse = r;
            AppConstants.token = r.jwtToken ?? "";
            AppConstants.userId = r.user?.id ?? "";
            notifyListeners();
            await SharedPreferenceService.setString(
              AppConstants.authTokenPref,
              AppConstants.token,
            );
            await SharedPreferenceService.setString(
              AppConstants.userIdPref,
              AppConstants.userId,
            );
            AppConstants.isGuest = false;
            await SharedPreferenceService.setBool(
              AppConstants.isGuestPref,
              AppConstants.isGuest,
            );

            notifyListeners();
            Logger.write(r.toString());
            getUserPreference(context, navigate: true);
          }),
        );
  }

  Future<void> getUserDetails(BuildContext context) async {
    if (AppConstants.isGuest) return;
    toggleLoading();
    await _authRepo.getUserDetails().then(
          (value) => value.fold((l) {
            if (!AppConstants.isGuest) {
              context.pushReplacementNamed(AppRoute.authView.name);
            }
          }, (r) async {
            AppConstants.token = r.jwtToken ?? "";
            AppConstants.userId = r.user?.id ?? "";
            print("User Id ============ ${r.user?.id}");
            print(r);
            await SharedPreferenceService.setString(
              AppConstants.authTokenPref,
              AppConstants.token,
            );
            await SharedPreferenceService.setString(
              AppConstants.userIdPref,
              AppConstants.userId,
            );
            Logger.write(r.toString());
            _userDetailService.setuserDetail(r);
            notifyListeners();
          }),
        );
    toggleLoading();
  }

  Future<void> getUserPreference(
    BuildContext context, {
    bool navigate = false,
    bool isChooseInterest = false,
  }) async {
    toggleLoading();
    await _authRepo.getUserPreference().then(
          (value) => value.fold((l) {}, (r) async {
            if (r.data?.isNotEmpty ?? true) {
              print(r);
              AppConstants.language =
                  r.data?.first.language == "english" ? "en" : "hi";
              await context.setLocale(Locale(AppConstants.language));
              await SharedPreferenceService.setString(
                AppConstants.languagePref,
                AppConstants.language,
              );
              AppConstants.selectedIndexCategory
                  .addAll(r.data?.first.articleCategory ?? []);
              // r.data?.first.articleCategory ?? [];
              if (!AppConstants.selectedIndexCategory
                  .contains(AppConstants.prefilledCategory)) {
                AppConstants.selectedIndexCategory
                    .addAll(AppConstants.prefilledCategory);
              }
              await SharedPreferenceService.setStringList(
                AppConstants.selectedIndexCategoryPref,
                AppConstants.selectedIndexCategory,
              );
              // AppConstants.selectedIndexSources = r.data?.first.source ?? [];
              // await SharedPreferenceService.setStringList(
              //   AppConstants.selectedIndexSourcesPref,
              //   AppConstants.selectedIndexSources,
              // );
              print("------->>>>>> JSON ${r.data?.first.toJson()}");
              print("++++++++++++++ ${r.data?.first.language}");
              if (navigate) {
                if (r.data?.first.language == "") {
                  navigateToLanguageSelection();
                } else if (r.data?.first.articleCategory?.isEmpty ?? true) {
                  navigateTochooseInterest(context);
                } else {
                  context.pushReplacementNamed(
                    AppRoute.bottomNavigationView.name,
                    pathParameters: {'index': "1"},
                  );
                  // navigateTodashboard();
                }
              } else {
                // navigateToLanguageSelection();
              }

              if (isChooseInterest) {
                context.pushReplacementNamed(
                  AppRoute.bottomNavigationView.name,
                  pathParameters: {'index': "1"},
                );
              } else {
                context.pushReplacementNamed(
                  AppRoute.bottomNavigationView.name,
                  pathParameters: {'index': "1"},
                );
              }

              // Logger.write(r.toString());
              // _userDetailService.setuserDetail(r);
              notifyListeners();
            } else {
              navigateToLanguageSelection();
              print("A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ");
            }
          }),
        );
    toggleLoading();
  }

  Future<void> updatePreference(
    BuildContext context, {
    bool shouldNavigate = false,
    bool isChooseInterest = false,
  }) async {
    if (AppConstants.isGuest) return;
    toggleLoading();
    await _authRepo.updatePreference().then(
          (value) => value.fold((l) {}, (r) async {
            Logger.write(r.toString());

            getUserPreference(
              context,
              navigate: shouldNavigate,
              isChooseInterest: isChooseInterest,
            );
            notifyListeners();
          }),
        );
    toggleLoading();
  }

  Future<void> updateUserName(
      UpdateUsernameRequest updateUsernameRequest, BuildContext context) async {
    if (AppConstants.isGuest) return;
    toggleLoading();
    await _authRepo.updateUserName(updateUsernameRequest).then(
          (value) => value.fold((l) {}, (r) async {
            Logger.write(r.toString());

            await getUserDetails(context);
            notifyListeners();
          }),
        );
    toggleLoading();
  }

  Future<void> addFeedback(
      FeedBackRequest feedBackRequest, BuildContext context) async {
    toggleLoading();
    await _authRepo.addFeedback(feedBackRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) async {
            Logger.write(r.toString());
            context.pop();
            // view!.navigateToScreen(AppRoute.accountsView);
            view!.showSnackbar("Feedback added Successfully");
            // await getUserDetails();
            notifyListeners();
          }),
        );
    toggleLoading();
  }

  Future<void> deleteAccount(BuildContext context) async {
    toggleLoading();
    await _authRepo.deleteAccount().then(
          (value) => value.fold((l) {
            // view?.showSnackbar(l.message);
            SharedPreferenceService.clearAll();
            context.setLocale(const Locale("en"));
            AppConstants.language = "en";
            // setState(() {});
            context.pushReplacementNamed(AppRoute.splash.name);
            toggleLoading();
          }, (r) async {
            Logger.write(r.toString());
            SharedPreferenceService.clearAll();
            context.pushReplacementNamed(AppRoute.splash.name);

            // await getUserDetails();
            notifyListeners();
          }),
        );
    toggleLoading();
  }

  void guestLogin() {
    AppConstants.isGuest = true;
    notifyListeners();
    SharedPreferenceService.setBool(
      AppConstants.isGuestPref,
      AppConstants.isGuest,
    );
    navigateToLanguageSelection();
  }

  void navigateToLanguageSelection() {
    view!.navigateToScreen(AppRoute.languageSelectionView);
  }

  void navigateTochooseInterest(BuildContext context) {
    context.pushReplacementNamed(
      AppRoute.chooseInterestView.name,
      pathParameters: {'isInitial': "0"},
    );
    // view!.navigateToScreen(AppRoute.chooseInterestView);
  }

  void navigateTodashboard(BuildContext context) {
    context.pushReplacementNamed(
      AppRoute.bottomNavigationView.name,
      pathParameters: {'index': "0"},
    );
  }
}
