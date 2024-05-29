// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
import 'package:unbiased/core/constants.dart';
import 'package:unbiased/core/translation.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/auth/auth_view_model.dart';

class DeleteAppView extends ConsumerStatefulWidget {
  const DeleteAppView({super.key});

  @override
  ConsumerState<DeleteAppView> createState() => _DeleteAppViewState();
}

class _DeleteAppViewState extends ConsumerState<DeleteAppView>
    with BaseScreenView {
  bool isDarkMode = false;
  String getfileName = "";
  late AuthViewModel _viewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(authViewModel);
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    getfileName = Theme.of(context).brightness != Brightness.dark
        ? "images_light"
        : "images_dark";
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => showDeleteDialog(),
            );
            // navigateToScreen(AppRoute.chooseInterestView);
          },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xffFF2728),
            ),
            child: Text(
              Translation.DELETEACCOUNT,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: !isDarkMode ? Colors.white : Colors.black,
                fontSize: buttonText.sp,
                fontFamily: "Century",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        backgroundColor:
            !isDarkMode ? const Color(0xFFf7f7f9) : const Color(0xFF1A1A16),
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
                    Translation.DELETEACCOUNT,
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
            gapH16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                Translation.DELETEACCOUNTHEADER,
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: mediumText.sp,
                  fontFamily: "Century",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gapH16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 7, right: 8),
                          height: 6,
                          width: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFF868686),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            Translation.DELETEACCOUNTPOINTONE,
                            style: TextStyle(
                              color: const Color(0xFF868686),
                              fontSize: smallText.sp,
                              fontFamily: "Century",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  gapH8,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 7, right: 8),
                          height: 6,
                          width: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFF868686),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            Translation.DELETEACCOUNTPOINTTWO,
                            style: TextStyle(
                              color: const Color(0xFF868686),
                              fontSize: smallText.sp,
                              fontFamily: "Century",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  gapH8,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 7, right: 8),
                          height: 6,
                          width: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFF868686),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            Translation.DELETEACCOUNTPOINTTHREE,
                            style: TextStyle(
                              color: const Color(0xFF868686),
                              fontSize: smallText.sp,
                              fontFamily: "Century",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showDeleteDialog() {
    return AlertDialog(
      surfaceTintColor: isDarkMode ? const Color(0xFF292524) : Colors.white,
      backgroundColor: isDarkMode ? const Color(0xFF292524) : Colors.white,
      title: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFFF2728),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              "assets/profile_icons/delete.png",
              color: isDarkMode ? Colors.black : Colors.white,
              height: 18.h,
            ),
          ),
          gapH8,
          Text(
            Translation.DELETEACCOUNT,
            style: TextStyle(
              color: !isDarkMode ? Colors.black : Colors.white,
              fontSize: smallText.h,
              fontFamily: "Century",
              fontWeight: FontWeight.bold,
            ),
          ),
          gapH4,
          Text(
            Translation.DELETEACCOUNTSUBTITLE,
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
                  if (AppConstants.isGuest) {
                    SharedPreferenceService.clearAll();
                    context.pushReplacementNamed(AppRoute.splash.name);
                  } else {
                    _viewModel.deleteAccount(context);
                  }
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
                    color: const Color(0xFFFF2728),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      Translation.DELETE,
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
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}
