// ignore_for_file: must_be_immutable, avoid_bool_literals_in_conditional_expressions

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:unbiased/core/constants.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/auth/auth_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  ConsumerState<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView> with BaseScreenView {
  String getfileName = "";
  late AuthViewModel _viewModel;

  bool isDarkMode = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String? language = "";
    language = SharedPreferenceService.getString(AppConstants.languagePref);
    AppConstants.language = language ?? "";
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(authViewModel);
    getfileName = Theme.of(context).brightness == Brightness.dark
        ? "images_light"
        : "images_dark";
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Image.asset(
                  "assets/images_normal/signin_header.png",
                  height: 120.h,
                  width: 250.w,
                  color: !isDarkMode ? Colors.black : Colors.white,
                ),
              ),
            ),
            Text(
              "Let's Get Started !",
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: largeText.sp,
                fontFamily: "Century",
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH10,
            Column(
              children: [
                Text(
                  "By Proceeding you are agreeing to",
                  style: TextStyle(
                    color: const Color(0xFF868686),
                    fontSize: smallText.sp,
                    fontFamily: "Century",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                gapH2,
                InkWell(
                  onTap: () async {
                    if (!await launchUrl(
                        Uri.parse("https://unbiasedly.vercel.app/terms"),
                        mode: LaunchMode.inAppBrowserView)) {
                      throw Exception(
                          'Could not launch https://unbiasedly.vercel.app/terms');
                    }
                  },
                  child: Text(
                    "Unbiasly Terms & Conditions",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: smallText.sp,
                      fontFamily: "Century",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                gapH32,
                if (Platform.isIOS)
                  InkWell(
                    onTap: () {
                      _viewModel.signInWithApple(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:
                            isDarkMode ? Colors.white : const Color(0xFFF7F7F9),
                      ),
                      child: _viewModel.loading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images_normal/apple.webp",
                                  height: 24.h,
                                  width: 24.w,
                                ),
                                gapW12,
                                Text(
                                  "Sign in with apple",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: buttonText.sp,
                                    fontFamily: "Century",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  )
                else
                  InkWell(
                    onTap: () {
                      _viewModel.signInWithGoogle(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:
                            isDarkMode ? Colors.white : const Color(0xFFF7F7F9),
                      ),
                      child: _viewModel.loading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images_normal/google.png",
                                  height: 24.h,
                                  width: 24.w,
                                ),
                                gapW12,
                                Text(
                                  "Sign in with google",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: buttonText.sp,
                                    fontFamily: "Century",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                gapH32,
                InkWell(
                  onTap: () {
                    _viewModel.guestLogin();
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: const Color(0xff868686),
                        fontSize: smallText.sp,
                        fontFamily: "Century",
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        const TextSpan(text: "Don’t have an account?"),
                        TextSpan(
                          text: "  Login as Guest",
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: smallText.sp,
                            fontFamily: "Century",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    // TODO: implement navigateToScreen
    context.pushReplacementNamed(appRoute.name);
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message.toString()),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // TODO: implement showSnackbar
  }
}
