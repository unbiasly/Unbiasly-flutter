// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:unbiased/core/constants.dart';
import 'package:unbiased/core/translation.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/feeds/feed_view_model.dart';

class NotificationView extends ConsumerStatefulWidget {
  const NotificationView({super.key});

  @override
  ConsumerState<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends ConsumerState<NotificationView>
    with BaseScreenView {
  bool isDarkMode = false;
  List<String> days = [Translation.TODAY, Translation.YESTERDAY];
  late FeedViewModel _viewModel;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _viewModel = ref.read(feedViewModel);
    _viewModel.attachView(this);
    Future.delayed(const Duration(milliseconds: 200)).then((value) async {
      _viewModel.toggleLoading();
      if (!AppConstants.isGuest) {
        await _viewModel.getNotificationList();
      }

      _viewModel.toggleLoading();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(feedViewModel);

    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: !isDarkMode ? Colors.white : const Color(0xFF1A1A16),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH16,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  Translation.NOTIFICATIONHEADING,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: mediumText.sp,
                    fontFamily: "Century",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              gapH16,
              getView()
            ],
          ),
        ),
      ),
    );
  }

  Widget getView() {
    Widget spinkit = SpinKitFadingFour(
      color: isDarkMode ? Colors.white : Colors.black,
      size: 50.0,
    );
    if (_viewModel.loading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: spinkit,
          ),
        ],
      );
    } else if (_viewModel.notificationListResponse == null &&
        !AppConstants.isGuest) {
      return Container();
    } else if (_viewModel.notificationListResponse?.articleAction?.isEmpty ??
        true && !AppConstants.isGuest) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images_normal/no_notification.png",
                height: 245.73,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              Translation.NONOTIFICATIONYET,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: largeText + 8,
                  color: isDarkMode ? Colors.white : Colors.black,
                  shadows: [Shadow(color: Colors.black)]),
            ),
          ),
          gapH8,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              Translation.NONOTIFICATIONYETSUBTITLE,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: mediumText,
                  color: Color(0xFF868686),
                  shadows: [Shadow(color: Colors.black)]),
            ),
          ),
        ],
      );
    } else if (AppConstants.isGuest) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images_normal/no_notification.png",
                height: 245.73,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              Translation.SIGNINTOGETNOTIFICATION,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: largeText + 8,
                  color: isDarkMode ? Colors.white : Colors.black,
                  shadows: [Shadow(color: Colors.black)]),
            ),
          ),
          gapH8,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              Translation.SIGNINTOGETNOTIFICATIONSUBTITLE,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: mediumText,
                  color: Color(0xFF868686),
                  shadows: [Shadow(color: Colors.black)]),
            ),
          ),
          gapH16,
          InkWell(
            onTap: () async {
              showDialog(
                context: context,
                builder: (context) => showLoginDialog(),
              );
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              padding: const EdgeInsets.only(bottom: 12, top: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              child: Text(
                Translation.SIGNIN,
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
        ],
      );
    } else {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            // context.pushNamed(
            context.pushNamed(
              AppRoute.singleFeedView.name,
              pathParameters: {
                'articleId': _viewModel.notificationListResponse
                        ?.articleAction?[index].article?.id
                        .toString() ??
                    ""
              },
            );
            // AppRoute.readingModeView.name,
            // pathParameters: {
            //   'articleId': _viewModel.notificationListResponse
            //           ?.articleAction?[index].article?.id
            //           .toString() ??
            //       "",
            // },
            // );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 53.w - 40,
                      ),
                      child: Text(
                        _viewModel.notificationListResponse
                                ?.articleAction?[index].article?.bodyShort ??
                            "",
                        maxLines: 2,
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: smallText.sp,
                          fontFamily: "Century",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      timeago.format(
                        _viewModel.notificationListResponse
                                ?.articleAction?[index].article?.updatedAt ??
                            DateTime.now(),
                      ),
                      maxLines: 2,
                      style: TextStyle(
                        color:
                            isDarkMode ? Colors.white : const Color(0xFF868686),
                        fontSize: extrasmallText.sp,
                        fontFamily: "Century",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (_viewModel.notificationListResponse?.articleAction?[index]
                        .article?.source?.sourceIcon ==
                    "")
                  Container()
                else
                  Container(
                    height: 53.h,
                    width: 53.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: _viewModel
                                    .notificationListResponse
                                    ?.articleAction?[index]
                                    .article
                                    ?.source
                                    ?.sourceIcon ==
                                null
                            ? AssetImage(
                                "assets/images_normal/no_notification.png")
                            : Image.network(
                                _viewModel
                                        .notificationListResponse
                                        ?.articleAction?[index]
                                        .article
                                        ?.source
                                        ?.sourceIcon ??
                                    "",
                                height: 53.h,
                                width: 53.w,
                              ).image,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        itemCount:
            _viewModel.notificationListResponse?.articleAction?.length ?? 0,
      );
    }
  }

  Widget showLoginDialog() {
    return AlertDialog(
      surfaceTintColor: isDarkMode ? const Color(0xFF292524) : Colors.white,
      backgroundColor: isDarkMode ? const Color(0xFF292524) : Colors.white,
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
            Translation.SIGNINDIALOGTITLE,
            style: TextStyle(
              color: !isDarkMode ? Colors.black : Colors.white,
              fontSize: smallText.h,
              fontFamily: "Century",
              fontWeight: FontWeight.bold,
            ),
          ),
          gapH4,
          Text(
            Translation.SIGNINDIALOGSUBTITLE,
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
                  context.setLocale(const Locale("en"));
                  AppConstants.language = "en";
                  setState(() {});
                  context.pushReplacementNamed(AppRoute.splash.name);
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
                      Translation.SIGNIN,
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
