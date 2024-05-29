// ignore_for_file: avoid_bool_literals_in_conditional_expressions, must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unbiased/core/constants.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/utils/utils.dart';

class LanguageSelectionView extends StatefulWidget {
  LanguageSelectionView({super.key});

  @override
  State<LanguageSelectionView> createState() => _LanguageSelectionViewState();
}

class _LanguageSelectionViewState extends State<LanguageSelectionView>
    with BaseScreenView {
  String getfileName = "";
  int selectedIndex = 0;
  bool isDarkMode = false;
  List<Map<String, String>> languages = [
    {
      "image": "assets/images_normal/eng.png",
      "title": "English",
    },
    {
      "image": "assets/images_normal/hindi.png",
      "title": "Hindi",
    }
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (AppConstants.language == "hi") {
      selectedIndex = 1;
    } else {
      selectedIndex = 0;
      AppConstants.language = "en";
      SharedPreferenceService.setString(
        AppConstants.languagePref,
        AppConstants.language,
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getfileName = Theme.of(context).brightness == Brightness.dark
        ? "images_light"
        : "images_dark";
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: InkWell(
          onTap: () {
            context.pushNamed(
              AppRoute.chooseInterestView.name,
              pathParameters: {'isInitial': "0"},
            );
            // navigateToScreen(AppRoute.bottomNavigationView);
          },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            child: Text(
              "Next",
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            gapH40,
            Image.asset(Theme.of(context).brightness == Brightness.light
                ? "assets/images_light/language_header.png"
                : "assets/images_dark/language_header.png"),
            gapH16,
            Center(
              child: Text(
                "Choose Your Language",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: largeText.sp,
                  fontFamily: "Century",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gapH16,
            ...List.generate(
              languages.length,
              (index) => InkWell(
                onTap: () {
                  selectedIndex = index;
                  setState(() {});
                  if (selectedIndex == 0) {
                    AppConstants.language = "en";

                    context.setLocale(const Locale('en'));
                    SharedPreferenceService.setString(
                      AppConstants.languagePref,
                      "en",
                    );
                  }
                  if (selectedIndex == 1) {
                    AppConstants.language = "hi";

                    context.setLocale(const Locale('hi'));
                    SharedPreferenceService.setString(
                      AppConstants.languagePref,
                      "hi",
                    );
                  }
                },
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: isDarkMode
                            ? const Color(0xFF292524)
                            : const Color(0xFFF7F7F9),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            languages[index]["image"]!,
                            height: 22.h,
                            width: 22.h,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            languages[index]["title"]!,
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: mediumText.sp,
                              fontFamily: "Century",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: selectedIndex == index,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 26,
                          bottom: 16,
                        ),
                        child: Icon(
                          Icons.check_circle_outline,
                          size: 26,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            gapH32,
          ],
        ),
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
