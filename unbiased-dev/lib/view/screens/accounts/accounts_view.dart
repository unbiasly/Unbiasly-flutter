// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unbiased/core/core.dart';
import 'package:unbiased/core/translation.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/utils/app_sizes.dart';
import 'package:unbiased/utils/utils.dart';

import '../auth/auth_view_model.dart';

class AccountsView extends ConsumerStatefulWidget {
  const AccountsView({super.key});

  @override
  ConsumerState<AccountsView> createState() => _AccountsViewState();
}

class _AccountsViewState extends ConsumerState<AccountsView>
    with BaseScreenView {
  bool isDarkMode = false;
  String getfileName = "";

  late AuthViewModel _viewModel;

  @override
  void initState() {
    // TODO: implement initState
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    getfileName = Theme.of(context).brightness != Brightness.dark
        ? "images_light"
        : "images_dark";
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            !isDarkMode ? const Color(0xFFf7f7f9) : Color(0xFF1A1A16),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      "assets/$getfileName/arrow.png",
                      height: 30.h,
                    ),
                  ),
                  gapW10,
                  Text(
                    Translation.ACCOUNT,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: mediumText.sp,
                      fontFamily: "Century",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            gapH10,
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => showLogoutDialog(),
                );
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: isDarkMode ? const Color(0xFF292524) : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        gapW4,
                        Image.asset(
                          "assets/profile_icons/logout.png",
                          color: !isDarkMode ? Colors.black : Colors.white,
                          height: 18.h,
                        ),
                        gapW8,
                        Text(
                          Translation.LOGOUT,
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: smallText.h,
                            fontFamily: "Century",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                navigateToScreen(AppRoute.deleteAppView);
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: isDarkMode ? const Color(0xFF292524) : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        gapW4,
                        Image.asset(
                          "assets/profile_icons/delete.png",
                          color: !isDarkMode ? Colors.black : Colors.white,
                          height: 18.h,
                        ),
                        gapW8,
                        Text(
                          Translation.DELETEACCOUNT,
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: smallText.h,
                            fontFamily: "Century",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showLogoutDialog() {
    return AlertDialog(
      surfaceTintColor: isDarkMode ? Color(0xFF292524) : Colors.white,
      backgroundColor: isDarkMode ? Color(0xFF292524) : Colors.white,
      title: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: !isDarkMode ? Colors.black : Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              "assets/profile_icons/logout.png",
              color: isDarkMode ? Colors.black : Colors.white,
              height: 18.h,
            ),
          ),
          gapH8,
          Text(
            Translation.LOGOUT,
            style: TextStyle(
              color: !isDarkMode ? Colors.black : Colors.white,
              fontSize: smallText.h,
              fontFamily: "Century",
              fontWeight: FontWeight.bold,
            ),
          ),
          gapH4,
          Text(
            Translation.LOGOUTSUBTITLE,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF868686),
              fontSize: smallText.h,
              fontFamily: "Century",
              fontWeight: FontWeight.w400,
            ),
          ),
          gapH16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 70,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      Translation.CANCEL,
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: smallText.h,
                        fontFamily: "Century",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  SharedPreferenceService.clearAll();
                  context.setLocale(Locale("en"));
                  AppConstants.language = "en";
                  setState(() {});

                  _viewModel.signOut();

                  context.goNamed(
                    AppRoute.splash.name,
                  );

                  // context.pushReplacementNamed(AppRoute.splash.name);

                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(
                  //     builder: (context) => const SplashView(),
                  //   ),
                  //   (route) => false,
                  // );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 70,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white : Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      Translation.LOGOUT,
                      style: TextStyle(
                        color: !isDarkMode ? Colors.white : Colors.black,
                        fontSize: smallText.h,
                        fontFamily: "Century",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    // TODO: implement navigateToScreen

    context.pushNamed(appRoute.name);
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}
