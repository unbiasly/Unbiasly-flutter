// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unbiased/core/core.dart';
import 'package:unbiased/services/shared_preference_service.dart';

import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/auth/auth_view_model.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> with BaseScreenView {
  String getfileName = "";
  late AuthViewModel _viewModel;

  bool isDarkMode = false;
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);

    Future.delayed(const Duration(milliseconds: 200), getNavigation);
  }

  Future<void> getNavigation() async {
    final String? lang =
        SharedPreferenceService.getString(AppConstants.languagePref);
    final String? token =
        SharedPreferenceService.getString(AppConstants.authTokenPref);
    final String? userId =
        SharedPreferenceService.getString(AppConstants.userIdPref);
    final bool isGuestLogin =
        SharedPreferenceService.getBool(AppConstants.isGuestPref) ?? false;
    AppConstants.language = lang ?? "en";
    AppConstants.isGuest = isGuestLogin;

    // Using setState to update the UI after setting the necessary flags
    setState(() {});

    context.setLocale(Locale(AppConstants.language));
    if (isGuestLogin) {
      // Direct navigation without additional condition
      context.pushReplacementNamed(
        AppRoute.bottomNavigationView.name,
        pathParameters: {'index': "1"},
      );
    } else if (token != null) {
      AppConstants.token = token;
      AppConstants.userId = userId ?? "";

      await _viewModel.getUserDetails(context).then((value) {
        context.pushReplacementNamed(
          AppRoute.bottomNavigationView.name,
          pathParameters: {'index': "1"},
        );
      });
    } else {
      navigateToScreen(AppRoute.authView);
    }
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(authViewModel);
    getfileName = Theme.of(context).brightness == Brightness.dark
        ? "images_light"
        : "images_dark";
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset(
                "assets/images_normal/signin_header.png",
                height: 120.h,
                width: 250.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    // TODO: implement navigateToScreen
    context.pushReplacementNamed(
      appRoute.name,
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}
