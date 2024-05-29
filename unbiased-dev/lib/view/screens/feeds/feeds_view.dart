// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:unbiased/core/core.dart';
import 'package:unbiased/core/translation.dart';
import 'package:unbiased/data/feed/models/feed_model.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/feeds/feed_view_model.dart';

class FeedsView extends ConsumerStatefulWidget {
  const FeedsView({super.key});

  @override
  ConsumerState<FeedsView> createState() => _FeedsViewState();
}

class _FeedsViewState extends ConsumerState<FeedsView> with BaseScreenView {
  bool isDarkMode = false;
  AppinioSwiperController? controller = AppinioSwiperController();
  late FeedViewModel _viewModel;
  int currentIndex2 = 0;
  bool showSource = false;
  String getfileName = "";

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _viewModel = ref.read(feedViewModel);
    _viewModel.attachView(this);
    Future.delayed(const Duration(milliseconds: 10)).then((value) async {
      _viewModel.toggleLoading();
      await _viewModel.getFeeds();
      if (AppConstants.isGuest == false) {
        await _viewModel.getFeedActions();
      }
      _viewModel.toggleLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(feedViewModel);
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    Widget spinkit = SpinKitFadingFour(
      color: isDarkMode ? Colors.white : Colors.black,
      size: 50.0,
    );
    getfileName = !(Theme.of(context).brightness == Brightness.dark)
        ? "images_light"
        : "images_dark";
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? const Color(0xFF1a1a16) : const Color(0xFFf7f7f9),
        body: _viewModel.loading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: spinkit,
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  if (_viewModel.getFeedResponse == null)
                    Container()
                  else if (_viewModel.getFeedResponse?.articles?.isEmpty ??
                      true)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/$getfileName/all_caught_up.png",
                            height: 200,
                          ),
                        ),
                      ],
                    )
                  else
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.28,
                      width: double.infinity,
                      // height: MediaQuery.of(context).size.height,
                      child: Swiper(
                        allowImplicitScrolling: true,
                        // curve: Curves.elasticIn,
                        physics: const BouncingScrollPhysics(),
                        itemWidth: MediaQuery.of(context).size.width,
                        layout: SwiperLayout.STACK,
                        // allowUnSwipe: true,

                        // backgroundCardScale: 0.9,
                        // allowUnlimitedUnSwipe: false,
                        // backgroundCardCount: 3,
                        // loop: true,
                        // swipeOptions: const SwipeOptions.only(
                        //     down: true, up: true, left: false, right: false),
                        // defaultDirection: AxisDirection.up,
                        // onSwipeBegin: (previousIndex, targetIndex, activity) {
                        //   // const double distance = 30;
                        //   if (targetIndex >= 0) {
                        //     if (activity.direction.name ==
                        //         AxisDirection.down.name) {
                        //       controller?.unswipe();
                        //     }
                        //   } else {}
                        //   showSource = false;
                        //   setState(() {});
                        // },
                        // onSwipeEnd: (previousIndex, targetIndex, activity) {
                        //   switch (activity) {
                        //     case Swipe():
                        //       print(
                        //           'The card was swiped to the : ${activity.direction}');
                        //       print(
                        //           'previous index: $previousIndex, target index: $targetIndex');
                        //       break;
                        //     case Unswipe():
                        //       print(
                        //           'A ${activity.direction.name} swipe was undone.');
                        //       print(
                        //           'previous index: $previousIndex, target index: $targetIndex');
                        //       break;
                        //     case CancelSwipe():
                        //       print('A swipe was cancelled');
                        //       break;
                        //     case DrivenActivity():
                        //       print('Driven Activity');
                        //       break;
                        //   }
                        // },
                        // isDisabled: true,
                        // padding: EdgeInsets.zero,
                        // defaultDirection: AxisDirection.up,
                        // swipeOptions: SwipeOptions.only(up: true, down: true),
                        // onSwipeBegin: (AppinioSwiperDirection direction) {
                        //   // debugPrint(direction.toString());
                        //   if (direction.name == 'left') {
                        //     controller?.unswipe();
                        //   }
                        // },
                        // unswipe: (unswiped) {},

                        // loop: true,
                        // swipeOptions: const AppinioSwipeOptions.only(
                        //     left: true, right: true),
                        // onSwipe: ,
                        // allowUnswipe: true,
                        // unlimitedUnswipe: true,
                        // onSwiping: (AppinioSwiperDirection direction) {
                        //   // debugPrint(direction.toString());
                        //   if (direction.name == 'left' ||
                        //       direction == AppinioSwiperDirection.left) {
                        //     controller?.unswipe();
                        //   }
                        // },

                        // direction: AppinioSwiperDirection.top,
                        // onSwipe: (int index,
                        //     AppinioSwiperDirection direction) async {
                        //   debugPrint(direction.name);
                        //   debugPrint("indexxs $index");

                        //   if (direction.name == 'left' ||
                        //       direction == AppinioSwiperDirection.left) {
                        //     controller?.unswipe();
                        //   }
                        // },

                        // controller: controller,

                        itemCount:
                            _viewModel.getFeedResponse?.articles?.length ?? 0,

                        itemBuilder: (context, index) => newsCard(
                          context,
                          _viewModel.getFeedResponse!.articles![index],
                        ),
                      ),
                    ),
              
                ],
              ),
      ),
    );
  }

  Widget newsCard(BuildContext context, Article article) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      // height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isDarkMode ? const Color(0xFF292524) : Colors.white,
        border: Border.all(color: isDarkMode ? Colors.white : Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: InkWell(
              onTap: () {
                _viewModel.performAction(
                  article.id ?? "",
                  ArticleActions.view.name,
                );

                context.pushNamed(
                  AppRoute.feedsListView.name,
                  // pathParameters: {'articleId': article.id ?? ""},
                );
                // navigateToScreen(AppRoute.feedsListView);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: article.thumbnailUrl ?? "",
                    imageBuilder: (context, imageProvider) => Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3.7,
                          width: double.infinity,
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: imageProvider,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 26.h,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 14,
                                ),
                                margin:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 16),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF171717).withOpacity(0.45),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images_normal/visible.png",
                                      height: 11.h,
                                      color: Colors.white,
                                    ),
                                    gapW4,
                                    Text(
                                      article.views.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: extrasmallText.sp,
                                        fontFamily: "Century",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 16,
                          ),
                          margin: const EdgeInsets.fromLTRB(30, 0, 0, 2),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              width: 2,
                              color: !isDarkMode
                                  ? Colors.white
                                  : const Color(0xFF292524),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            article.category?.first.name?.capitalize() ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: extrasmallText.sp,
                              fontFamily: "Century",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    placeholder: (context, url) => Container(
                      height: MediaQuery.of(context).size.height / 3.7,
                      width: double.infinity,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3.7,
                          width: double.infinity,
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                "assets/$getfileName/place_holder.png",
                              ).image,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 26.h,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 14,
                                ),
                                margin:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 16),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images_normal/visible.png",
                                      height: 11.h,
                                      color: Colors.white,
                                    ),
                                    gapW4,
                                    Text(
                                      article.views.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: extrasmallText.sp,
                                        fontFamily: "Century",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 8,
                          ),
                          margin: const EdgeInsets.fromLTRB(30, 0, 0, 2),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              width: 2,
                              color: !isDarkMode
                                  ? Colors.white
                                  : const Color(0xFF292524),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            article.category?.first.name?.capitalize() ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: extrasmallText.sp,
                              fontFamily: "Century",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    article.title ?? "",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: mediumText.sp,
                                      fontFamily: "Century",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                gapH8,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    article.bodyShort ?? "",
                                    maxLines: 12,
                                    // softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: mediumText.sp,
                                      fontFamily: "Century",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            gapH8,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Tap to read more by ${article.authorName}",
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: extrasmallText.sp,
                                      fontFamily: "Century",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  gapW8,
                                  Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  gapW8,
                                  Text(
                                    timeago
                                        .format(article.date ?? DateTime.now()),
                                    style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: extrasmallText.sp,
                                      fontFamily: "Century",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // gapH8,
                          ],
                        ),
                      ),
                      Visibility(
                        visible: showSource,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: isDarkMode
                                        ? Colors.white.withOpacity(0.1)
                                        : Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    offset: const Offset(
                                      5,
                                      6,
                                    ),
                                    blurRadius: 2,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16),
                                color: isDarkMode
                                    ? Colors.black
                                    : const Color(0xFFF7F7F9),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Image.asset(
                                      "assets/images_normal/newspaper.png",
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      height: 9.h,
                                    ),
                                  ),
                                  gapW8,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.source?.sourceId
                                                ?.toUpperCase() ??
                                            "",
                                        style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: extrasmallText.sp,
                                          fontFamily: "Century",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      gapH4,
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.7,
                                        ),
                                        child: Text(
                                          article.link ?? "",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: extrasmallText.sp,
                                            fontFamily: "Century",
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showSource = false;
                                setState(() {});
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 24, top: 8),
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                child: Icon(
                                  Icons.close,
                                  size: 16,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Container(
                  //   height: MediaQuery.of(context).size.height / 1.2 -
                  //       MediaQuery.of(context).size.height / 3.2 -
                  //       5,
                  //   color: Colors.yellow,
                  // )

                  // gapH8
                ],
              ),
            ),
          ),
          gapH16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (!AppConstants.isGuest &&
                        _viewModel.feedActionResponse != null)
                      _viewModel.feedActionResponse!.articleAction!.any(
                        (element) =>
                            element.articleId?.id == article.id &&
                            element.isLiked == true,
                      )
                          ? Image.asset(
                              "assets/images_normal/like_filled.png",
                              height: 20.h,
                              color: isDarkMode ? Colors.white : Colors.black,
                            )
                          : InkWell(
                              onTap: () {
                                AppConstants.isGuest
                                    ? showDialog(
                                        context: context,
                                        builder: (context) => showLoginDialog(),
                                      )
                                    : setState(() {
                                        _viewModel.performAction(
                                          article.id ?? "",
                                          ArticleActions.like.name,
                                        );
                                      });
                              },
                              child: Image.asset(
                                "assets/images_normal/like.png",
                                height: 20.h,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            )
                    else
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => showLoginDialog(),
                          );
                        },
                        child: Image.asset(
                          "assets/images_normal/like.png",
                          height: 20.h,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    gapW8,
                    Text(
                      (article.likes ?? 0).toString(),
                      style: TextStyle(
                        color: const Color(0xFF868686),
                        fontSize: extrasmallText.sp,
                        fontFamily: "Century",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (!AppConstants.isGuest &&
                        _viewModel.feedActionResponse != null)
                      (_viewModel.feedActionResponse!.articleAction!.any(
                        (element) =>
                            (element.articleId?.id == article.id) &&
                            (element.isDisliked == true),
                      ))
                          ? Image.asset(
                              "assets/images_normal/dislike_filled.png",
                              height: 20.h,
                              color: isDarkMode ? Colors.white : Colors.black,
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  _viewModel.performAction(
                                    article.id ?? "",
                                    ArticleActions.dislike.name,
                                  );
                                });
                              },
                              child: Image.asset(
                                "assets/images_normal/dislike.png",
                                height: 20.h,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            )
                    else
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => showLoginDialog(),
                          );
                        },
                        child: Image.asset(
                          "assets/images_normal/dislike.png",
                          height: 20.h,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    // Image.asset(
                    //   "assets/images_normal/dislike.png",
                    //   height: 20.h,
                    //   color: isDarkMode ? Colors.white : Colors.black,
                    // ),
                    gapW8,
                    Text(
                      (article.dislikes ?? 0).toString(),
                      style: TextStyle(
                        color: const Color(0xFF868686),
                        fontSize: extrasmallText.sp,
                        fontFamily: "Century",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images_normal/share.png",
                      height: 20.h,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    gapW8,
                    Text(
                      "0",
                      style: TextStyle(
                        color: const Color(0xFF868686),
                        fontSize: extrasmallText.sp,
                        fontFamily: "Century",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (!AppConstants.isGuest &&
                        _viewModel.feedActionResponse != null)
                      (_viewModel.feedActionResponse!.articleAction!.any(
                        (element) =>
                            (element.articleId?.id == article.id) &&
                            (element.isBookmarked == true),
                      ))
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  _viewModel.performAction(
                                    article.id ?? "",
                                    ArticleActions.bookmark.name,
                                  );
                                });
                              },
                              child: Image.asset(
                                "assets/images_normal/save_filled.png",
                                height: 20.h,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  _viewModel.performAction(
                                    article.id ?? "",
                                    ArticleActions.bookmark.name,
                                  );
                                });
                              },
                              child: Image.asset(
                                "assets/images_normal/save.png",
                                height: 20.h,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            )
                    else
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => showLoginDialog(),
                          );
                        },
                        child: Image.asset(
                          "assets/images_normal/save.png",
                          height: 20.h,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    // Image.asset(
                    //   "assets/images_normal/save.png",
                    //   height: 20.h,
                    //   color: isDarkMode ? Colors.white : Colors.black,
                    // ),
                    gapW8,
                    Text(
                      (article.bookmarks ?? 0).toString(),
                      style: TextStyle(
                        color: const Color(0xFF868686),
                        fontSize: extrasmallText.sp,
                        fontFamily: "Century",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    showSource = !showSource;
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        showSource
                            ? "assets/images_normal/new_filled.png"
                            : "assets/images_normal/news.png",
                        height: 20.h,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      // gapW8,
                      Text(
                        "0",
                        style: TextStyle(
                          color: Colors.transparent,
                          fontSize: extrasmallText.sp,
                          fontFamily: "Century",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/images_normal/menu.png",
                  height: 15.h,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
    context.pushNamed(appRoute.name);
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
