// ignore_for_file: avoid_bool_literals_in_conditional_expressions, avoid_positional_boolean_parameters

import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:unbiased/core/core.dart';
import 'package:unbiased/core/translation.dart';
import 'package:unbiased/data/categoryTag/models/category_model.dart';
import 'package:unbiased/data/categoryTag/models/tag_model.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/auth/auth_view_model.dart';
import 'package:unbiased/view/screens/chooseInterest/choose_interest_view_model.dart';

class ChooseInterestView extends ConsumerStatefulWidget {
  final String isInitial;
  const ChooseInterestView({
    this.isInitial = "1",
    super.key,
  });

  @override
  ConsumerState<ChooseInterestView> createState() => _ChooseInterestViewState();
}

class _ChooseInterestViewState extends ConsumerState<ChooseInterestView>
    with BaseScreenView {
  String getfileName = "";
  bool isCategor = true;
  List<String> selectedIndexCategory = [];
  List<String> selectedIndexSources = [];
  late ChooseInterestViewModel _viewModel;
  // late AuthViewModel _viewModel2;
  TextEditingController _searchController = TextEditingController();
  int val = 1;
  bool isDarkMode = false;
  List<ArticleCategory> filteredList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel = ref.read(chooseInterestViewModel);
    // _viewModel2 = ref.read(authViewModel);
    _viewModel.attachView(this);
    // _viewModel2.attachView(this);

    Future.delayed(const Duration(milliseconds: 200)).then((value) async {
      // _viewModel.getUserPreference(context, navigate: false);

      _viewModel.toggleLoading();
      if (AppConstants.isGuest) {
        selectedIndexCategory = SharedPreferenceService.getStringList(
              AppConstants.selectedIndexCategoryPref,
            ) ??
            [];
        selectedIndexSources = [];
        if (!AppConstants.selectedIndexCategory
            .contains(AppConstants.prefilledCategory)) {
          AppConstants.selectedIndexCategory
              .addAll(AppConstants.prefilledCategory);
        }
      } else {
        if (!AppConstants.selectedIndexCategory
            .contains(AppConstants.prefilledCategory)) {
          AppConstants.selectedIndexCategory
              .addAll(AppConstants.prefilledCategory);
        }
        selectedIndexCategory.addAll(AppConstants.selectedIndexCategory);
        // selectedIndexSources.addAll(AppConstants.selectedIndexSources);
      }
      print(widget.isInitial);

      Future.wait([
        _viewModel.getCategoryList(),

        // _viewModel.getTagsList(),
      ]);
      setState(() {
        _viewModel.allList
            .addAll(_viewModel.categoryResponse?.articleCategory ?? []);
      });

      filteredList = _viewModel.allList;
      print(filteredList);

      // _searchController.addListener(filteredList);
      _viewModel.toggleLoading();
    });
  }

  _filterList() {
    final List<ArticleCategory> tempList = [];
    tempList.addAll(_viewModel.allList.where((item) => item.name!
        .toLowerCase()
        .contains(_searchController.text.toLowerCase())));
    setState(() {
      filteredList = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(chooseInterestViewModel);

    getfileName = Theme.of(context).brightness == Brightness.dark
        ? "images_light"
        : "images_dark";
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: InkWell(
          onTap: () async {
            if (widget.isInitial == "0") {
              await SharedPreferenceService.setStringList(
                AppConstants.selectedIndexCategoryPref,
                selectedIndexCategory,
              );
              // await SharedPreferenceService.setStringList(
              //   AppConstants.selectedIndexSourcesPref,
              //   selectedIndexSources,
              // );
              // AppConstants.selectedIndexCategory = selectedIndexSources;
              // AppConstants.selectedIndexSources = selectedIndexSources;
              setState(() {});
              AppConstants.selectedIndexCategory
                  .addAll(SharedPreferenceService.getStringList(
                        AppConstants.selectedIndexCategoryPref,
                      ) ??
                      []);
              if (!AppConstants.selectedIndexCategory
                  .contains(AppConstants.prefilledCategory)) {
                AppConstants.selectedIndexCategory
                    .addAll(AppConstants.prefilledCategory);
              }
              // AppConstants.selectedIndexSources =
              //     SharedPreferenceService.getStringList(
              //           AppConstants.selectedIndexSourcesPref,
              //         ) ??
              //         [];
              // navigateToScreen(AppRoute.bottomNavigationView);
              if (AppConstants.isGuest) {
                context.pushReplacementNamed(
                  AppRoute.bottomNavigationView.name,
                  pathParameters: {'index': "1"},
                );
              } else {
                _viewModel.updatePreference(context, shouldNavigate: false);
                context.pushReplacementNamed(
                  AppRoute.bottomNavigationView.name,
                  pathParameters: {'index': "1"},
                );
              }
            }
            await SharedPreferenceService.setStringList(
              AppConstants.selectedIndexCategoryPref,
              selectedIndexCategory,
            );
            // await SharedPreferenceService.setStringList(
            //   AppConstants.selectedIndexSourcesPref,
            //   selectedIndexSources,
            // );
            AppConstants.selectedIndexCategory
                .addAll(SharedPreferenceService.getStringList(
                      AppConstants.selectedIndexCategoryPref,
                    ) ??
                    []);
            if (!AppConstants.selectedIndexCategory
                .contains(AppConstants.prefilledCategory)) {
              AppConstants.selectedIndexCategory
                  .addAll(AppConstants.prefilledCategory);
            }
            // AppConstants.selectedIndexSources =
            //     SharedPreferenceService.getStringList(
            //           AppConstants.selectedIndexSourcesPref,
            //         ) ??
            //         [];

            setState(() {});
            if (!AppConstants.isGuest) {
              _viewModel.updatePreference(context, isChooseInterest: true);
            }
            showSnackbar("Category updated successfully");
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                left: 16, right: 16, bottom: widget.isInitial != "1" ? 30 : 26),
            // margin: const EdgeInsets.all(double.infinity),
            padding: const EdgeInsets.only(bottom: 14, top: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            child: Text(
              widget.isInitial == "1" ? Translation.UPDATE : Translation.NEXT,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: !isDarkMode ? Colors.white : Colors.black,
                fontSize: buttonText.sp,
                fontFamily: "Merriweather",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        backgroundColor: isDarkMode ? const Color(0xFF1a1a16) : Colors.white,
        body: Column(
          crossAxisAlignment: widget.isInitial == "1"
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            if (widget.isInitial == "1") gapH32 else gapH60,
            if (widget.isInitial == "1")
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  Translation.CHOOSEINTEREST,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: mediumText.sp,
                    fontFamily: "Merriweather",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            else
              Center(
                child: Text(
                  Translation.CHOOSEINTEREST,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: largeText.sp,
                    fontFamily: "Merriweather",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            gapH16,
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            //   child: CustomSlidingSegmentedControl<int>(
            //     initialValue: 1,

            //     isStretch: true,
            //     // fixedWidth: double.infinity,
            //     children: {
            //       1: Text(
            //         Translation.CATEGORIES,
            //         style: TextStyle(
            //           color: getColorSelected(1, val),
            //           fontSize: smallText.sp,
            //           fontFamily: "Merriweather",
            //           fontWeight: val == 1 ? FontWeight.bold : FontWeight.w200,
            //         ),
            //       ),
            //       2: Text(
            //         Translation.SOURCE,
            //         style: TextStyle(
            //           color: getColorSelected(2, val),
            //           fontSize: smallText.sp,
            //           fontFamily: "Merriweather",
            //           fontWeight: val == 2 ? FontWeight.bold : FontWeight.w200,
            //         ),
            //       ),
            //     },
            //     decoration: BoxDecoration(
            //       color: isDarkMode
            //           ? const Color(0xFF292524)
            //           : const Color(0xFFF7F7F9),
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //     thumbDecoration: BoxDecoration(
            //       color: !isDarkMode ? Colors.black : Colors.white,
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //     duration: const Duration(milliseconds: 300),
            //     curve: Curves.easeInToLinear,
            //     onValueChanged: (v) {
            //       // print(v);

            //       setState(() {
            //         val = v;
            //       });
            //     },
            //   ),
            // ),
            // gapH8,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (val) {
                      _filterList();
                    },
                    controller: _searchController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      fillColor: isDarkMode
                          ? const Color(0xFF292524)
                          : const Color(0xFFf7f7f9),
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: const Color(0xFF868686),
                      hintText: Translation.SEARCHCATEGORY,
                      hintStyle: TextStyle(
                        color: const Color(0xFF868686),
                        fontSize: smallText.sp,
                        fontFamily: "Merriweather",
                        fontWeight: FontWeight.w200,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                  gapH16,
                  // if (val == 1)
                  chipWidgets(
                    context,
                    selectedIndexCategory,
                    true,
                    categoryList: filteredList,
                  )
                  // else
                  //   chipWidgets(
                  //     context,
                  //     selectedIndexSources,
                  //     false,
                  //     tagList: _viewModel.getTagResponse?.source ?? [],
                  //   ),
                ],
              ),
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget chipWidgets(
    BuildContext context,
    List<String> indexForSelection,
    bool isCategory, {
    List<ArticleCategory>? categoryList,
    List<Source>? tagList,
  }) {
    isCategor = isCategory;
    setState(() {});
    return Column(
      children: [
        if (categoryList?.length == 0)
          Container()
        else
          InkWell(
            onTap: () {
              if (indexForSelection.length ==
                  (isCategory
                      ? (categoryList?.length ?? 0)
                      : (tagList?.length ?? 0))) {
                indexForSelection.clear();
                setState(() {});
              } else {
                indexForSelection.clear();
                indexForSelection.addAll(
                  List.generate(
                    isCategory
                        ? (categoryList?.length ?? 0)
                        : (tagList?.length ?? 0),
                    (index) => isCategory
                        ? (categoryList?[index].id ?? "")
                        : (tagList?[index].id ?? ""),
                  ),
                );
                setState(() {});
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Translation.SELECTALL,
                  style: TextStyle(
                    color: const Color(0xFF868686),
                    fontSize: smallText.sp,
                    fontFamily: "Merriweather",
                    fontWeight: indexForSelection.length ==
                            (isCategory
                                ? (categoryList?.length ?? 0)
                                : (tagList?.length ?? 0))
                        ? FontWeight.bold
                        : FontWeight.w200,
                  ),
                ),
                Image.asset(
                  indexForSelection.length ==
                          (isCategory
                              ? (categoryList?.length ?? 0)
                              : (tagList?.length ?? 0))
                      ? "assets/images_normal/Tick.png"
                      : "assets/images_normal/Untick.png",
                  height: 18.h,
                  color: const Color(0xFF868686),
                ),
              ],
            ),
          ),
        gapH16,
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.3,
          child: ListView(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Wrap(
                // runAlignment: WrapAlignment.start,

                children: [
                  ...List.generate(
                    isCategory
                        ? categoryList?.length ?? 0
                        : tagList?.length ?? 0,
                    (index) => InkWell(
                      onTap: () {
                        if (AppConstants.prefilledCategory
                            .contains(categoryList?[index].id)) {
                        } else {
                          setState(() {
                            if (!indexForSelection.contains(
                              isCategory
                                  ? (categoryList?[index].id ?? "")
                                  : (tagList?[index].id ?? ""),
                            )) {
                              indexForSelection.add(
                                isCategory
                                    ? (categoryList?[index].id ?? "")
                                    : (tagList?[index].id ?? ""),
                              );
                            } else {
                              indexForSelection.remove(
                                isCategory
                                    ? (categoryList?[index].id ?? "")
                                    : (tagList?[index].id ?? ""),
                              );
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: MediaQuery.of(context).size.width / 2 - 32,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isDarkMode
                                ? indexForSelection.contains(
                                    isCategory
                                        ? (categoryList?[index].id ?? "")
                                        : tagList?[index].id ?? "",
                                  )
                                    ? Colors.transparent
                                    : Colors.transparent
                                : indexForSelection.contains(
                                    isCategory
                                        ? (categoryList?[index].id ?? "")
                                        : tagList?[index].id ?? "",
                                  )
                                    ? Colors.black
                                    : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          color: isDarkMode
                              ? indexForSelection.contains(
                                  isCategory
                                      ? (categoryList?[index].id ?? "")
                                      : (tagList?[index].id ?? ""),
                                )
                                  ? Colors.white
                                  : const Color(0xFF292524).withOpacity(0.8)
                              : indexForSelection.contains(
                                  isCategory
                                      ? (categoryList?[index].id ?? "")
                                      : (tagList?[index].id ?? ""),
                                )
                                  ? const Color(0xFF1A1A16).withOpacity(0.1)
                                  : const Color(0xFFF7F7F9),
                        ),
                        child: Center(
                          child: Text(
                            isCategory
                                ? categoryList![index].name?.capitalize() ?? ""
                                : tagList![index].sourceId?.capitalize() ?? "",
                            style: TextStyle(
                              color: isDarkMode
                                  ? indexForSelection.contains(
                                      isCategory
                                          ? (categoryList?[index].id ?? "")
                                          : (tagList?[index].id ?? ""),
                                    )
                                      ? Colors.black
                                      : Colors.white
                                  : Colors.black,
                              fontSize: smallText.sp,
                              fontFamily: "Merriweather",
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color getColorSelected(int currentIndex, int selectedIndex) {
    if (isDarkMode && (selectedIndex == currentIndex)) {
      return Colors.black;
    } else if (isDarkMode && (selectedIndex != currentIndex)) {
      return Colors.white;
    } else if (!isDarkMode && (selectedIndex == currentIndex)) {
      return Colors.white;
    } else if (!isDarkMode && (selectedIndex != currentIndex)) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    // TODO: implement navigateToScreen
    context.pushReplacementNamed(appRoute.name);
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: color,
      content: Text(message.toString()),
      // action: SnackBarAction(
      //   label: 'Close',
      //   onPressed: () {
      //     ScaffoldMessenger.of(context).clearSnackBars();
      //     // Some code to undo the change.
      //   },
      // ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // TODO: implement showSnackbar
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
