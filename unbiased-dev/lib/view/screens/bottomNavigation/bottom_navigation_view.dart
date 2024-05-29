// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:unbiased/core/translation.dart';
import 'package:unbiased/domain/providers/firebase_messaging_provider.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/chooseInterest/choose_interest_view.dart';
import 'package:unbiased/view/screens/feeds/feeds_list_view.dart';
import 'package:unbiased/view/screens/feeds/feeds_view.dart';
import 'package:unbiased/view/screens/notifications/notification_view.dart';
import 'package:unbiased/view/screens/profile/profile_view.dart';

class BottomNavigationView extends StatefulWidget {
  final String index;
  const BottomNavigationView({super.key, this.index = "0"});
  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int _currentIndex = 0;
  bool isDarkMode = false;
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _navigateToSingleFeedView(message);
      _showNotification(message);
    });

    setState(() {
      _currentIndex = int.parse(widget.index);
    });
  }

  void _navigateToSingleFeedView(RemoteMessage message) {
    final articleId = message.data["id"]?.toString() ?? "";
    if (articleId.isNotEmpty && articleId != "") {
      context.pushNamed(
        AppRoute.singleFeedView.name,
        pathParameters: {'articleId': articleId},
      );
    }
  }

// Show the notification's body if available
  void _showNotification(RemoteMessage message) {
    if (message.notification != null) {
      print(
          '*****************  Message contained a notification: ${message.notification?.body ?? ""}');
      FirebaseMessagingProvider.showNotification(
          message, message.notification!);
    }
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    return Scaffold(
        bottomNavigationBar: DecoratedBox(
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF292524) : Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // backgroundColor: Colors.transparent,
            currentIndex: _currentIndex,
            // backgroundColor: colorScheme.surface,
            selectedItemColor: isDarkMode ? Colors.white : Colors.black,
            unselectedItemColor: const Color(0xFF868686),
            selectedLabelStyle: isDarkMode
                ? TextStyle(
                    color: Colors.white,
                    fontSize: extrasmallText.sp,
                    fontFamily: "Century",
                    fontWeight: FontWeight.bold,
                  )
                : TextStyle(
                    color: Colors.black,
                    fontSize: extrasmallText.sp,
                    fontFamily: "Century",
                    fontWeight: FontWeight.bold,
                  ),
            unselectedLabelStyle: TextStyle(
              color: const Color(0xFF868686),
              fontSize: extrasmallText.sp,
              fontFamily: "Century",
              fontWeight: FontWeight.bold,
            ),
            onTap: (value) {
              // Respond to item press.
              setState(() => _currentIndex = value);
            },
            items: [
              BottomNavigationBarItem(
                label: Translation.DISCOVER,
                icon: Image.asset(
                  "assets/images_normal/discover.png",
                  height: 20.h,
                  color: isDarkMode
                      ? _currentIndex == 0
                          ? Colors.white
                          : const Color(0xFF868686)
                      : _currentIndex == 0
                          ? Colors.black
                          : const Color(0xFF868686),
                ),
              ),
              BottomNavigationBarItem(
                label: Translation.MYFEED,
                icon: Image.asset(
                  "assets/images_normal/feed.png",
                  height: 20.h,
                  color: isDarkMode
                      ? _currentIndex == 1
                          ? Colors.white
                          : const Color(0xFF868686)
                      : _currentIndex == 1
                          ? Colors.black
                          : const Color(0xFF868686),
                ),
              ),
              BottomNavigationBarItem(
                label: Translation.NOTIFICATIONS,
                icon: Image.asset(
                  "assets/images_normal/notification.png",
                  height: 20.h,
                  color: isDarkMode
                      ? _currentIndex == 2
                          ? Colors.white
                          : const Color(0xFF868686)
                      : _currentIndex == 2
                          ? Colors.black
                          : const Color(0xFF868686),
                ),
              ),
              BottomNavigationBarItem(
                label: Translation.PROFILE,
                icon: Image.asset(
                  "assets/images_normal/profile.png",
                  height: 20.h,
                  color: isDarkMode
                      ? _currentIndex == 3
                          ? Colors.white
                          : const Color(0xFF868686)
                      : _currentIndex == 3
                          ? Colors.black
                          : const Color(0xFF868686),
                ),
              ),
            ],
          ),
        ),
        body: getView(_currentIndex));
  }

  Widget getView(int index) {
    switch (index) {
      case 0:
        return const ChooseInterestView();
      case 1:
        return const FeedsListView();
      case 2:
        return const NotificationView();
      case 3:
        return const ProfileView();

      default:
        return const ProfileView();
    }
  }
}
