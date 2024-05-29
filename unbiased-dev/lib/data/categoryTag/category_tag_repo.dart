import 'package:dartz/dartz.dart';
import 'package:unbiased/core/exceptions.dart';
import 'package:unbiased/data/categoryTag/models/category_model.dart';
import 'package:unbiased/data/categoryTag/models/tag_model.dart';

abstract class CategoryTagRepo {
  Future<Either<ApiException, GetCategoryResponse>> getCategory();
  Future<Either<ApiException, GetTagResponse>> getTag();
}
