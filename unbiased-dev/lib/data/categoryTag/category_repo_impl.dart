import 'package:dartz/dartz.dart';
import 'package:unbiased/core/core.dart';
import 'package:unbiased/data/categoryTag/category_tag_repo.dart';
import 'package:unbiased/data/categoryTag/models/category_model.dart';
import 'package:unbiased/data/categoryTag/models/tag_model.dart';

class CategoryTagRepoImpl implements CategoryTagRepo {
  final ApiClient _apiClient;

  CategoryTagRepoImpl(this._apiClient);

  @override
  Future<Either<ApiException, GetCategoryResponse>> getCategory() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}/article-category",
      );
      return Right(GetCategoryResponse.fromJson(response.data!));
      // getCategoryResponseFromJson(response.data!.toString()));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<ApiException, GetTagResponse>> getTag() async {
    try {
      final response = await _apiClient.get(
        "${AppConstants.baseUrl}/source",
      );
      return Right(GetTagResponse.fromJson(response.data!));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
