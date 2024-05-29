import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:unbiased/core/core.dart';
import 'package:unbiased/data/categoryTag/category_tag_repo.dart';
import 'package:unbiased/data/categoryTag/models/category_model.dart';
import 'package:unbiased/data/categoryTag/models/tag_model.dart';
import 'package:unbiased/data/feed/feed_repo.dart';
import 'package:unbiased/data/feed/models/article_by_id_model.dart';
import 'package:unbiased/data/feed/models/feed_actions_model.dart';
import 'package:unbiased/data/feed/models/feed_model.dart';
import 'package:unbiased/data/feed/models/notification_list_model.dart' as noti;
import 'package:unbiased/data/feed/models/report_model.dart';
import 'package:unbiased/domain/providers/repository_provider.dart';
import 'package:unbiased/helpers/base_view_model.dart';
import 'package:unbiased/helpers/locator.dart';
import 'package:unbiased/services/user_detail_service.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/feeds/article_action_new.dart';

final feedViewModel = ChangeNotifierProvider.autoDispose(
  (ref) => FeedViewModel(
    ref.read(feedRepositoryProvider),
  ),
);

class FeedViewModel extends BaseViewModel<BaseScreenView> {
  final FeedRepo _feedRepo;
  FeedViewModel(
    this._feedRepo,
  );
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  GetFeedResponse? _getFeedResponse;
  GetFeedResponse? get getFeedResponse => _getFeedResponse;
  List<Article> articleList = [];
  List<Article> bookmarkedFeeds = [];
  List<ArticleActionNew> articleActionNewList = [];
  List<ArticleActionNew> bookmarkedAction = [];
  noti.NotificationListResponse? _notificationListResponse;
  noti.NotificationListResponse? get notificationListResponse =>
      _notificationListResponse;
  ArticleByIdResponse? _articleByIdResponse;
  ArticleByIdResponse? get articleByIdResponse => _articleByIdResponse;
  FeedActionResponse? _feedActionResponse;
  FeedActionResponse? get feedActionResponse => _feedActionResponse;

  Future<void> getFeeds() async {
    await _feedRepo.getFeeds(1).then(
          (value) => value.fold((l) {
            print("this is hindi feed" + l.message.toString());
            // view?.showSnackbar(l.message);
          }, (r) async {
            articleList.clear();
            // _getFeedResponse = null;
            _getFeedResponse = r;
            articleList.addAll(_getFeedResponse?.articles ?? []);
            print("this is hindi feed 978ruyser $articleList");
            articleActionNewList.clear();
            // ignore: unused_local_variable
            articleList.sort((a, b) {
              // Handling null values
              if (a.updatedAt == null && b.createdAt == null) {
                return 0;
              } else if (a.updatedAt == null) {
                return 1; // Null is considered greater than any non-null value
              } else if (b.updatedAt == null) {
                return -1; // Null is considered greater than any non-null value
              }

              // Compare non-null createdOn values
              return b.updatedAt!.compareTo(a.updatedAt!);
            });
            // log(newList);
            for (final element in articleList) {
              ArticleActionNew articleActionNew = ArticleActionNew();
              articleActionNew = ArticleActionNew.fromJson(
                  element.articleActionNew?.toJson() ?? {});
              articleActionNew.likes = element.likes ?? 0;
              articleActionNew.dislikes = element.dislikes ?? 0;
              articleActionNew.bookmarks = element.bookmarks ?? 0;
              articleActionNewList.add(articleActionNew);
            }
            bookmarkedFeeds.clear();
            articleList
                .where(
                    (element) => element.articleActionNew?.isBookmarked == true)
                .forEach((element) {
              print("--- BOOKMARK ADDING ** ");
              bookmarkedFeeds.add(element);
            });

            bookmarkedAction.clear();
            for (final element in bookmarkedFeeds) {
              ArticleActionNew articleActionNew = ArticleActionNew();
              articleActionNew = ArticleActionNew.fromJson(
                  element.articleActionNew?.toJson() ?? {});
              articleActionNew.likes = element.likes ?? 0;
              articleActionNew.dislikes = element.dislikes ?? 0;
              articleActionNew.bookmarks = element.bookmarks ?? 0;
              bookmarkedAction.add(articleActionNew);
            }

            print("---------bookmarkedAction ${bookmarkedAction.length}");
            print("---------bookmarkedFeeds ${bookmarkedFeeds.length}");

            notifyListeners();
          }),
        );
  }

  Future<void> addPageToFeed(int number) async {
    notifyListeners();
    await _feedRepo.getFeeds(number).then(
          (value) => value.fold((l) {
            // view?.showSnackbar(l.message);
          }, (r) async {
            if (r.articles != null) {
              print(r.toString());
              if (!articleList.contains(r.articles!.first)) {
                articleList.addAll(r.articles ?? []);

                print("add page");

                notifyListeners();
              }
            }
          }),
        );
  }

  Future<void> getArticleById(String id) async {
    await _feedRepo.articleById(id).then(
          (value) => value.fold((l) {
            // view?.showSnackbar(l.message);
          }, (r) async {
            _articleByIdResponse = r;
            notifyListeners();
          }),
        );
  }

  Future<void> getNotificationList() async {
    await _feedRepo.getNotificationList().then(
          (value) => value.fold((l) {
            // view?.showSnackbar(l.message);
          }, (r) async {
            _notificationListResponse = r;
            notifyListeners();
          }),
        );
  }

  Future<void> report(BuildContext context, ReportRequest reportRequest) async {
    await _feedRepo.reportFeed(reportRequest).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) async {
            context.pop();
            view?.showSnackbar("post reported Successfully");

            notifyListeners();
          }),
        );
  }

  Future<void> getFeedActions({bool addBookmarks = false}) async {
    // if (AppConstants.isGuest) return;
    // await _feedRepo.getFeedsActions().then(
    //       (value) => value.fold((l) {
    //         // view?.showSnackbar(l.message);
    //       }, (r) async {
    //         // _feedActionResponse = r;
    //         // if (addBookmarks && _feedActionResponse!.articleAction != null) {
    //         //   bookmarkedFeeds.clear();
    //         //   bookmarkedFeeds.addAll(_feedActionResponse!.articleAction!
    //         //       .where((element) => element.isBookmarked == true));
    //           notifyListeners();
    //         }
    //       }),
    //     );
  }

  Future<void> performAction(String articleId, String action,
      {bool addBookmarks = false, Function? callBack}) async {
    await _feedRepo.performAction(articleId, action).then(
          (value) => value.fold((l) {
            view?.showSnackbar(l.message);
          }, (r) async {
            // getFeeds();
            if (callBack != null) {
              callBack();
            }
            // notifyListeners();
            // if (addBookmarks) {
            //   getFeedActions(addBookmarks: true);
            //   print("");
            //   notifyListeners();
            // } else {
            //   getFeedActions(addBookmarks: false);
            notifyListeners();
            // }

            // _feedActionResponse = r;
          }),
        );
  }
}
