import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:unbiased/core/core.dart';
import 'package:unbiased/data/categoryTag/category_repo_impl.dart';
import 'package:unbiased/data/categoryTag/models/category_model.dart';
import 'package:unbiased/data/categoryTag/models/tag_model.dart';
import 'package:unbiased/data/feed/feed_repo.dart';
import 'package:unbiased/data/feed/models/actions_performed_model.dart';
import 'package:unbiased/data/feed/models/article_by_id_model.dart';
import 'package:unbiased/data/feed/models/feed_actions_model.dart';
import 'package:unbiased/data/feed/models/feed_model.dart';
import 'package:unbiased/data/feed/models/notification_list_model.dart';
import 'package:unbiased/data/feed/models/report_model.dart';
import 'package:unbiased/services/shared_preference_service.dart';

class FeedRepoImpl implements FeedRepo {
  final ApiClient _apiClient;

  FeedRepoImpl(this._apiClient);

  @override
  Future<Either<ApiException, GetFeedResponse>> getFeeds(int? number) async {
    try {
      final String lang = AppConstants.language == "en" ? "english" : "hindi";
      // final FeedListRequest feedListRequest = FeedListRequest(
      //     categoryIds: AppConstants.selectedIndexCategory,
      //     sourceIds: [],
      //     page: number ?? 1,
      //     language: lang);

      final String? userId =
          SharedPreferenceService.getString(AppConstants.userIdPref);
      final jsonData = {
        "userId": userId,
        "categoryIds": AppConstants.selectedIndexCategory,
        "sourceIds": [],
        "page": number ?? 1,
        "language": lang
      };

      final response = await _apiClient.post(
          "${AppConstants.baseUrl}/getArticles", jsonData);
      // print(
      // '__ PASSING DATA TO GET ARTICLE ${feedListRequestToJson(feedListRequest)}');
      log("++++++*********$response");
      return Right(GetFeedResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, FeedActionResponse>> getFeedsActions() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}/article-action",
      );
      print("-====== response of getFeedsActions ${response.data}");
      print("-====== token is ${AppConstants.token}");
      return Right(FeedActionResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, ActionPerformedResponse>> performAction(
      String articleId, String action) async {
    try {
      final response = await _apiClient.patch(
          "${AppConstants.baseUrl}/article-action/$articleId/$action", {});

      print("------- ARTICLE ID IS ${articleId} --- ACTION IS $action");
      print("------- REPONSE OF PERFORM ACTION APIS -----${response.data}");
      return Right(ActionPerformedResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, ArticleByIdResponse>> articleById(
      String id) async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}/article/${id}",
      );
      print("//////////////// $response");
      return Right(ArticleByIdResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, NotificationListResponse>>
      getNotificationList() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}/notification",
      );
      return Right(NotificationListResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, ReportResponse>> reportFeed(
      ReportRequest reportRequest) async {
    try {
      final response =
          await _apiClient.post("${AppConstants.baseUrl}/report", {});
      return Right(ReportResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
