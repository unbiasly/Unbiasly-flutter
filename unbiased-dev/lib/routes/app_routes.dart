import 'package:unbiased/view/screens/accounts/accounts_view.dart';
import 'package:unbiased/view/screens/auth/auth_view.dart';
import 'package:unbiased/view/screens/bottomNavigation/bottom_navigation_view.dart';
import 'package:unbiased/view/screens/chooseInterest/choose_interest_view.dart';
import 'package:unbiased/view/screens/deleteApp/delete_app_view.dart';
import 'package:unbiased/view/screens/feedback/feedback_view.dart';
import 'package:unbiased/view/screens/feeds/bookmark_feeds_view.dart';
import 'package:unbiased/view/screens/feeds/feeds_list_view.dart';
import 'package:unbiased/view/screens/feeds/reading_mode_view.dart';
import 'package:unbiased/view/screens/feeds/single_feed_view.dart';
import 'package:unbiased/view/screens/language_selection/language_selection_view.dart';
import 'package:unbiased/view/screens/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  splash,
  authView,
  languageSelectionView,
  chooseInterestView,
  bottomNavigationView,
  accountsView,
  deleteAppView,
  feedbackView,
  bookmarkFeedsView,
  feedsListView,
  readingModeView,
  singleFeedView
}

// flutter packages pub run build_runner build --delete-conflicting-outputs
final routers = [
  GoRoute(
    path: '/',
    name: AppRoute.splash.name,
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: '/authView',
    name: AppRoute.authView.name,
    builder: (context, state) => const AuthView(),
  ),
  GoRoute(
    path: '/languageSelectionView',
    name: AppRoute.languageSelectionView.name,
    builder: (context, state) => LanguageSelectionView(),
  ),
  GoRoute(
    path: '/chooseInterestView/:isInitial',
    name: AppRoute.chooseInterestView.name,
    builder: (context, state) => ChooseInterestView(
      isInitial: state.pathParameters['isInitial'].toString(),
    ),
  ),
  GoRoute(
    path: '/bottomNavigationView/:index',
    name: AppRoute.bottomNavigationView.name,
    builder: (context, state) =>
        BottomNavigationView(index: state.pathParameters['index'].toString()),
  ),
  GoRoute(
    path: '/accountsView',
    name: AppRoute.accountsView.name,
    builder: (context, state) => const AccountsView(),
  ),
  GoRoute(
    path: '/deleteAppView',
    name: AppRoute.deleteAppView.name,
    builder: (context, state) => const DeleteAppView(),
  ),
  GoRoute(
    path: '/feedbackView',
    name: AppRoute.feedbackView.name,
    builder: (context, state) => const FeedbackView(),
  ),
  GoRoute(
    path: '/bookmarkFeedsView',
    name: AppRoute.bookmarkFeedsView.name,
    builder: (context, state) => const BookmarkFeedsView(),
  ),
  GoRoute(
    path: '/feedsListView',
    name: AppRoute.feedsListView.name,
    builder: (context, state) => const FeedsListView(),
  ),
  GoRoute(
    path: '/readingModeView/:articleId',
    name: AppRoute.readingModeView.name,
    builder: (context, state) => ReadingModeView(
      articleId: state.pathParameters['articleId'].toString(),
    ),
  ),
  GoRoute(
    path: '/singleFeedView/:articleId',
    name: AppRoute.singleFeedView.name,
    builder: (context, state) => SingleFeedView(
      articleId: state.pathParameters['articleId'].toString(),
    ),
  ),
];
