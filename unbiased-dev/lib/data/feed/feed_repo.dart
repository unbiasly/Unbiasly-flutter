import 'package:dartz/dartz.dart';
import 'package:unbiased/core/exceptions.dart';
import 'package:unbiased/data/categoryTag/models/category_model.dart';
import 'package:unbiased/data/feed/models/actions_performed_model.dart';
import 'package:unbiased/data/feed/models/article_by_id_model.dart';
import 'package:unbiased/data/feed/models/feed_actions_model.dart';
import 'package:unbiased/data/feed/models/feed_model.dart';
import 'package:unbiased/data/feed/models/notification_list_model.dart';
import 'package:unbiased/data/feed/models/report_model.dart';

abstract class FeedRepo {
  Future<Either<ApiException, GetFeedResponse>> getFeeds(int? number);
  Future<Either<ApiException, FeedActionResponse>> getFeedsActions();
  // Future<bool> getFeedIsolate(List args);
  Future<Either<ApiException, ActionPerformedResponse>> performAction(
      String articleId, String action);
  Future<Either<ApiException, ArticleByIdResponse>> articleById(String id);
  Future<Either<ApiException, NotificationListResponse>> getNotificationList();
  Future<Either<ApiException, ReportResponse>> reportFeed(
      ReportRequest reportRequest);
}
