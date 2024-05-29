// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unbiased/core/constants.dart';
import 'package:unbiased/core/translation.dart';
import 'package:unbiased/data/auth/models/update_username_model.dart';
import 'package:unbiased/domain/providers/providers.dart';
import 'package:unbiased/helpers/locator.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/services/user_detail_service.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/auth/auth_view_model.dart';
import 'package:unbiased/view/screens/chooseInterest/choose_interest_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView>
    with BaseScreenView, WidgetsBindingObserver {
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  late AuthViewModel _viewModel;
  String getfileName = "";
  bool isDarkMode = false;
  int selectedIndex = 0;
  String selectedValue = "English";
  TextEditingController _usernameController = TextEditingController();
  bool isEdit = false;
  bool isNotification = false;
  Map<String, dynamic>? userData = {};

  Future<Map<String, dynamic>?> getJson(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }

  // List<String> sizes = ["aA", "Medium", "large"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    AppConstants.language == "en"
        ? selectedValue = "English"
        : selectedValue = "Hindi";

    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);

    Future.delayed(const Duration(milliseconds: 200)).then((value) async {
      isNotification = await Permission.notification.isGranted ? true : false;
      setState(() {});
      // await Permission.notification.isDenied.then((value) {
      //   if (value) {
      //     isNotification = value;
      //   } else {
      //     isNotification = true;
      //   }
      // });
      await _viewModel.getUserDetails(context);
      if (AppConstants.isGuest == true) {
        _usernameController.text = "Guest Login";
      } else {
        // ignore: unused_local_variable
        final String? modeText = await getModeText();
        _usernameController.text = modeText ?? '';
        // _userDetailService.userDetailResponse?.user?.name ?? "Update Name";
      }
      // WidgetsBindingObserver.add
    });
  }

  // ignore: avoid_void_async
  void clearKey(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    // ignore: use_build_context_synchronously
    // await _viewModel
    //     .updateUserName(
    //       UpdateUsernameRequest(name: userData?['name']),
    //       context,
    //     )
    //     .then((value) => {debugger()});
  }

  Future<String?> getModeText() async {
    try {
      // Retrieve user data asynchronously
      final userData = await getJson('user_data');
      // clearKey('user_data');

      // Update user name asynchronously
      // // ignore: use_build_context_synchronously
      // await _viewModel.updateUserName(
      //   UpdateUsernameRequest(name: userData?['name']),
      //   context,
      // );

      // Check if user name is available from _userDetailService
      final userDetailName = _userDetailService.userDetailResponse?.user?.name;
      if (userDetailName != null) {
        return userDetailName;
      }

      // If user name is not available from _userDetailService, check userData
      final userDataName = userData?['name'];
      if (userDataName != null) {
        // ignore: avoid_dynamic_calls
        return userDataName?.toString().capitalize();
      }

      // If neither userDetailName nor userDataName is available, return a default value
      return 'Update Name';
    } catch (e) {
      // Handle any errors that occur during asynchronous operations
      print('Error: $e');
      return null;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        Future.delayed(const Duration(milliseconds: 200)).then((value) async {
          isNotification =
              await Permission.notification.isGranted ? true : false;
          setState(() {});
        });

        // isNotification = Permission.notification.isGranted ? true : false;

        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    getfileName = Theme.of(context).brightness == Brightness.dark
        ? "images_light"
        : "images_dark";
    _viewModel = ref.watch(authViewModel);
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    Widget spinkit = SpinKitFadingFour(
      color: isDarkMode ? Colors.white : Colors.black,
      size: 50.0,
    );
    return Scaffold(
      backgroundColor:
          !isDarkMode ? const Color(0xFFf7f7f9) : const Color(0xFF1A1A16),
      body: _usernameController.text == ""
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: spinkit,
                ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 170.h,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 97.h,
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? const Color(0xFF292524)
                                  : Colors.black,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 110.h,
                          width: 110.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: !isDarkMode
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: _usernameController.text == ""
                                ? Text(
                                    "",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50.h,
                                      fontFamily: "Century",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    _usernameController.text[0],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50.h,
                                      fontFamily: "Century",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isEdit)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 16,
                                  top: 8,
                                  bottom: 8,
                                ),
                                fillColor: isDarkMode
                                    ? const Color(0xFF292524)
                                    : Colors.white,
                                filled: true,
                                // prefixIcon: const Icon(Icons.search),
                                // prefixIconColor: const Color(0xFF868686),
                                hintText: "Enter new username",
                                hintStyle: TextStyle(
                                  color: const Color(0xFF868686),
                                  fontSize: smallText.sp,
                                  fontFamily: "Century",
                                  fontWeight: FontWeight.w200,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _viewModel
                                  .updateUserName(
                                      UpdateUsernameRequest(
                                        name: _usernameController.text,
                                      ),
                                      context)
                                  .then((value) {
                                isEdit = false;
                                setState(() {});
                              });

                              // navigateToScreen(AppRoute.chooseInterestView);
                            },
                            child: Container(
                              // width: double.infinity,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 26,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              child: Text(
                                Translation.SUBMIT,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      !isDarkMode ? Colors.white : Colors.black,
                                  fontSize: extrasmallText.sp,
                                  fontFamily: "Century",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _usernameController.text,
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: largeText.h,
                            fontFamily: "Century",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        gapW4,
                        if (AppConstants.isGuest)
                          const SizedBox.shrink()
                        else
                          InkWell(
                            onTap: () {
                              isEdit = true;
                              setState(() {});
                            },
                            child: Image.asset(
                              "assets/profile_icons/edit.png",
                              color: !isDarkMode ? Colors.black : Colors.white,
                              height: 24.h,
                            ),
                          ),
                      ],
                    ),
                  Visibility(
                    visible: !AppConstants.isGuest,
                    child: InkWell(
                      onTap: () {
                        navigateToScreen(AppRoute.bookmarkFeedsView);
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: isDarkMode
                              ? const Color(0xFF292524)
                              : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/$getfileName/bookmark_big.png",
                                  // color: !isDarkMode ? Colors.black : Colors.white,
                                  height: 30.h,
                                ),
                                gapW8,
                                Text(
                                  Translation.BOOKMARKNEWS,
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: smallText.h,
                                    fontFamily: "Century",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color:
                          isDarkMode ? const Color(0xFF292524) : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/profile_icons/select_language.png",
                              color: !isDarkMode ? Colors.black : Colors.white,
                              height: 20.h,
                            ),
                            gapW8,
                            Text(
                              Translation.CHOOSELANGUAGE,
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: smallText.h,
                                fontFamily: "Century",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        DropdownButton(
                          dropdownColor: isDarkMode
                              ? const Color(0xFF1A1A16)
                              : const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(16),
                          value: selectedValue,
                          // value: AppConstants.languagePref == "en"
                          //     ? "English"
                          //     : "Hindi",
                          items: [
                            DropdownMenuItem(
                              value: "English",
                              child: Text(
                                "English",
                                style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontSize: smallText.h,
                                  fontFamily: "Century",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "Hindi",
                              child: Text(
                                "Hindi",
                                style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontSize: smallText.h,
                                  fontFamily: "Century",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (val) {
                            if (val == "English") {
                              AppConstants.language = "en";
                              context.setLocale(const Locale('en'));
                              SharedPreferenceService.setString(
                                AppConstants.languagePref,
                                "en",
                              );
                              setState(() {
                                selectedValue = val!;
                              });
                              _viewModel.updatePreference(context);
                            }
                            if (val == "Hindi") {
                              AppConstants.language = "hi";

                              context.setLocale(const Locale('hi'));
                              SharedPreferenceService.setString(
                                AppConstants.languagePref,
                                "hi",
                              );
                              _viewModel.updatePreference(context);

                              setState(() {
                                selectedValue = val!;
                              });
                            }
                          },
                          underline: Container(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color:
                          isDarkMode ? const Color(0xFF292524) : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/profile_icons/theme.png",
                              color: !isDarkMode ? Colors.black : Colors.white,
                              height: 20.h,
                            ),
                            gapW8,
                            Text(
                              Translation.DARKTHEME,
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: smallText.h,
                                fontFamily: "Century",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeTrackColor: Colors.black,
                          activeColor: Colors.white,
                          value: isDarkMode,
                          onChanged: (val) {
                            setState(() {
                              ref.read(themeProvider).toggleThemeMode();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color:
                          isDarkMode ? const Color(0xFF292524) : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/profile_icons/notification.png",
                              color: !isDarkMode ? Colors.black : Colors.white,
                              height: 20.h,
                            ),
                            gapW8,
                            Text(
                              Translation.NOTFICATIONPROFILE,
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: smallText.h,
                                fontFamily: "Century",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeTrackColor: Colors.black,
                          activeColor: Colors.white,
                          value: isNotification,
                          onChanged: (val) async {
                            if (isNotification == false) {
                              AppSettings.openAppSettings(
                                type: AppSettingsType.notification,
                              ).then((value) => setState(() {}));
                            } else {
                              AppSettings.openAppSettings(
                                type: AppSettingsType.notification,
                              ).then((value) => setState(() {}));
                            }

                            // ref.read(themeProvider).toggleThemeMode();

                            print(await Permission.notification.status);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 16,
                  //     vertical: 10,
                  //   ),
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(60),
                  //     color:
                  //         isDarkMode ? const Color(0xFF292524) : Colors.white,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           gapH8,

                  //           Row(
                  //             children: [
                  //               Image.asset(
                  //                 "assets/profile_icons/text_size.png",
                  //                 color:
                  //                     !isDarkMode ? Colors.black : Colors.white,
                  //                 height: 20.h,
                  //               ),
                  //               gapW8,
                  //               Text(
                  //                 Translation.TEXTSIZE,
                  //                 style: TextStyle(
                  //                   color: isDarkMode
                  //                       ? Colors.white
                  //                       : Colors.black,
                  //                   fontSize: smallText.h,
                  //                   fontFamily: "Century",
                  //                   fontWeight: FontWeight.w300,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           gapH10,

                  //           //TODO:
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               ...List.generate(
                  //                 3,
                  //                 (index2) => InkWell(
                  //                   onTap: () {
                  //                     setState(() {
                  //                       selectedIndex = index2;
                  //                     });
                  //                   },
                  //                   child: Container(
                  //                     margin: const EdgeInsets.symmetric(
                  //                       horizontal: 10,
                  //                     ),
                  //                     height: 22.h,
                  //                     width: 80.w,
                  //                     decoration: BoxDecoration(
                  //                       border: Border.all(
                  //                         color: isDarkMode
                  //                             ? selectedIndex == index2
                  //                                 ? Colors.transparent
                  //                                 : Colors.transparent
                  //                             : selectedIndex == index2
                  //                                 ? Colors.black
                  //                                 : Colors.transparent,
                  //                       ),
                  //                       borderRadius: BorderRadius.circular(30),
                  //                       color: isDarkMode
                  //                           ? selectedIndex == index2
                  //                               ? Colors.white
                  //                               : Colors.black
                  //                           : selectedIndex == index2
                  //                               ? const Color(0xFF1A1A16)
                  //                                   .withOpacity(0.1)
                  //                               : const Color(0xFFF7F7F9),
                  //                     ),
                  //                     child: Center(
                  //                       child: Text(
                  //                         "aA",
                  //                         style: TextStyle(
                  //                           color: isDarkMode
                  //                               ? selectedIndex == index2
                  //                                   ? Colors.black
                  //                                   : Colors.white
                  //                               : Colors.black,
                  //                           fontSize: index2 == 0
                  //                               ? smallText.sp
                  //                               : index2 == 1
                  //                                   ? (smallText + 2).sp
                  //                                   : index2 == 2
                  //                                       ? (smallText + 4).sp
                  //                                       : smallText.sp,
                  //                           fontFamily: "Century",
                  //                           fontWeight: FontWeight.w200,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      navigateToScreen(AppRoute.feedbackView);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color:
                            isDarkMode ? const Color(0xFF292524) : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/profile_icons/feedback.png",
                                color:
                                    !isDarkMode ? Colors.black : Colors.white,
                                height: 20.h,
                              ),
                              gapW8,
                              Text(
                                Translation.FEEDBACKPROFILE,
                                style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
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
                  // Container(
                  //   margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 16,
                  //     vertical: 12,
                  //   ),
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(60),
                  //     color:
                  //         isDarkMode ? const Color(0xFF292524) : Colors.white,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Image.asset(
                  //             "assets/profile_icons/share_app.png",
                  //             color: !isDarkMode ? Colors.black : Colors.white,
                  //             height: 20.h,
                  //           ),
                  //           gapW8,
                  //           Text(
                  //             Translation.SHAREAPP,
                  //             style: TextStyle(
                  //               color: isDarkMode ? Colors.white : Colors.black,
                  //               fontSize: smallText.h,
                  //               fontFamily: "Century",
                  //               fontWeight: FontWeight.w300,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  InkWell(
                    onTap: () async {
                      // final InAppReview inAppReview = InAppReview.instance;
                      if (Platform.isIOS) {
                        launchUrl(Uri.parse(
                            "https://apps.apple.com/in/app/unbiasly/id6477892005"));
                      } else {
                        launchUrl(Uri.parse(
                            "https://play.google.com/store/apps/details?id=com.unbiasly.app"));
                      }

                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color:
                            isDarkMode ? const Color(0xFF292524) : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/profile_icons/rate.png",
                                color:
                                    !isDarkMode ? Colors.black : Colors.white,
                                height: 20.h,
                              ),
                              gapW8,
                              Text(
                                Translation.RATEAPP,
                                style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
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
                    onTap: () async {
                      if (!await launchUrl(
                          Uri.parse("https://unbiasly.vercel.app/"),
                          mode: LaunchMode.inAppBrowserView)) {
                        throw Exception(
                            'Could not launch https://unbiasly.vercel.app/');
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color:
                            isDarkMode ? const Color(0xFF292524) : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/profile_icons/about.png",
                                color:
                                    !isDarkMode ? Colors.black : Colors.white,
                                height: 18.h,
                              ),
                              gapW8,
                              Text(
                                Translation.ABOUTAPP,
                                style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
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
                    onTap: () async {
                      if (!await launchUrl(
                          Uri.parse("https://unbiasly.vercel.app/privacy"),
                          mode: LaunchMode.inAppBrowserView)) {
                        throw Exception(
                            'Could not launch https://unbiasly.vercel.app/privacy');
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color:
                            isDarkMode ? const Color(0xFF292524) : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              gapW4,
                              Image.asset(
                                "assets/profile_icons/privacy.png",
                                color:
                                    !isDarkMode ? Colors.black : Colors.white,
                                height: 18.h,
                              ),
                              gapW8,
                              Text(
                                Translation.PRIVACYPOLICY,
                                style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
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
                    onTap: () async {
                      if (!await launchUrl(
                          Uri.parse("https://unbiasly.vercel.app/terms"),
                          mode: LaunchMode.inAppBrowserView)) {
                        throw Exception(
                            'Could not launch https://unbiasly.vercel.app/terms');
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color:
                            isDarkMode ? const Color(0xFF292524) : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              gapW4,
                              Image.asset(
                                "assets/profile_icons/terms.png",
                                color:
                                    !isDarkMode ? Colors.black : Colors.white,
                                height: 18.h,
                              ),
                              gapW8,
                              Text(
                                Translation.TERMSANDCONDITION,
                                style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
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
                  gapH16,
                  InkWell(
                    onTap: () {
                      navigateToScreen(AppRoute.accountsView);
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color:
                            isDarkMode ? const Color(0xFF292524) : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              gapW4,
                              Image.asset(
                                "assets/profile_icons/account.png",
                                color:
                                    !isDarkMode ? Colors.black : Colors.white,
                                height: 18.h,
                              ),
                              gapW8,
                              Text(
                                Translation.ACCOUNT,
                                style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
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
                  gapH16,
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
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
