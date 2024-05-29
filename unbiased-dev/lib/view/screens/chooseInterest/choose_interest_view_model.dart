import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unbiased/core/constants.dart';
import 'package:unbiased/data/auth/auth_repo_impl.dart';
import 'package:unbiased/data/categoryTag/category_tag_repo.dart';
import 'package:unbiased/data/categoryTag/models/category_model.dart';
import 'package:unbiased/data/categoryTag/models/tag_model.dart';
import 'package:unbiased/domain/providers/repository_provider.dart';
import 'package:unbiased/helpers/base_view_model.dart';
import 'package:unbiased/helpers/locator.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/services/user_detail_service.dart';
import 'package:unbiased/utils/utils.dart';

final chooseInterestViewModel = ChangeNotifierProvider.autoDispose(
  (ref) => ChooseInterestViewModel(
    ref.read(categoryTagRepositoryProvider),
    ref.read(authRepositoryProvider),
  ),
);

class ChooseInterestViewModel extends BaseViewModel<BaseScreenView> {
  final CategoryTagRepo _categoryTagRepo;
  final AuthRepo _authRepo;

  ChooseInterestViewModel(
    this._categoryTagRepo,
    this._authRepo,
  );
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  GetCategoryResponse? _getCategoryResponse;
  GetCategoryResponse? get categoryResponse => _getCategoryResponse;
  GetTagResponse? _getTagResponse;
  GetTagResponse? get getTagResponse => _getTagResponse;
  List<ArticleCategory> allList = [];
  Future<void> getCategoryList() async {
    await _categoryTagRepo.getCategory().then(
          (value) => value.fold((l) {
            // view?.showSnackbar(l.message);
          }, (r) async {
            _getCategoryResponse = r;
            allList.addAll(_getCategoryResponse?.articleCategory ?? []);
            notifyListeners();
          }),
        );
  }

  Future<void> getTagsList() async {
    await _categoryTagRepo.getTag().then(
          (value) => value.fold((l) {
            // view?.showSnackbar(l.message);
          }, (r) async {
            _getTagResponse = r;
            notifyListeners();
          }),
        );
  }

  Future<void> getUserPreference(
    BuildContext context, {
    bool navigate = false,
    bool isChooseInterest = false,
  }) async {
    toggleLoading();
    await _authRepo.getUserPreference().then(
          (value) => value.fold((l) {}, (r) async {
            if (r.data?.isNotEmpty ?? true) {
              print(r);
              AppConstants.language =
                  r.data?.first.language == "english" ? "en" : "hi";
              await context.setLocale(Locale(AppConstants.language));
              await SharedPreferenceService.setString(
                AppConstants.languagePref,
                AppConstants.language,
              );
              AppConstants.selectedIndexCategory.clear();
              AppConstants.selectedIndexCategory
                  .addAll(r.data?.first.articleCategory ?? []);
              // r.data?.first.articleCategory ?? [];
              if (!AppConstants.selectedIndexCategory
                  .contains(AppConstants.prefilledCategory)) {
                AppConstants.selectedIndexCategory
                    .addAll(AppConstants.prefilledCategory);
              }
              await SharedPreferenceService.setStringList(
                AppConstants.selectedIndexCategoryPref,
                AppConstants.selectedIndexCategory,
              );
              // AppConstants.selectedIndexSources = r.data?.first.source ?? [];
              // await SharedPreferenceService.setStringList(
              //   AppConstants.selectedIndexSourcesPref,
              //   AppConstants.selectedIndexSources,
              // );
              print(r);
              print("++++++++++++++ ${r.data?.first.language}");
              if (navigate) {
                if (r.data?.first.language == "") {
                  navigateToLanguageSelection();
                  // navigateTochooseInterest(context);
                } else if (r.data?.first.articleCategory?.isEmpty ?? true) {
                  navigateTochooseInterest(context);
                } else {
                  context.pushReplacementNamed(
                    AppRoute.bottomNavigationView.name,
                    pathParameters: {'index': "1"},
                  );
                  // navigateTodashboard();
                }
              } else if (isChooseInterest) {
                // navigateToLanguageSelection();
                context.pushReplacementNamed(
                  AppRoute.bottomNavigationView.name,
                  pathParameters: {'index': "1"},
                );
              } else {}

              // Logger.write(r.toString());
              // _userDetailService.setuserDetail(r);
              notifyListeners();
            } else {
              // navigateToLanguageSelection();
              print("data Data Data Data Data Data data Data Data Data");
            }
          }),
        );
    toggleLoading();
  }

  void navigateToLanguageSelection() {
    view!.navigateToScreen(AppRoute.languageSelectionView);
  }

  void navigateTochooseInterest(BuildContext context) {
    context.pushReplacementNamed(
      AppRoute.chooseInterestView.name,
      pathParameters: {'isInitial': "0"},
    );
    // view!.navigateToScreen(AppRoute.chooseInterestView);
  }

  void navigateTodashboard(BuildContext context) {
    context.pushReplacementNamed(
      AppRoute.bottomNavigationView.name,
      pathParameters: {'index': "0"},
    );
  }

  Future<void> updatePreference(
    BuildContext context, {
    bool shouldNavigate = false,
    bool isChooseInterest = false,
  }) async {
    if (AppConstants.isGuest) return;
    toggleLoading();
    await _authRepo.updatePreference().then(
          (value) => value.fold((l) {}, (r) async {
            Logger.write(r.toString());

            getUserPreference(
              context,
              navigate: shouldNavigate,
              isChooseInterest: isChooseInterest,
            );
            notifyListeners();
          }),
        );
    toggleLoading();
  }
}
