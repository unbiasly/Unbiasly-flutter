// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:unbiased/core/constants.dart';
import 'package:unbiased/core/translation.dart';
import 'package:unbiased/data/feed/models/feed_actions_model.dart';
import 'package:unbiased/data/feed/models/feed_model.dart';
import 'package:unbiased/data/feed/models/report_model.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/feeds/feed_view_model.dart';
import 'package:unbiased/view/screens/feeds/feed_view_model.dart';

import 'feed_view_model.dart';
import 'feed_view_model.dart';

class BookmarkFeedsView extends ConsumerStatefulWidget {
  const BookmarkFeedsView({
    super.key,
  });

  @override
  ConsumerState<BookmarkFeedsView> createState() => _BookmarkFeedsViewState();
}

class _BookmarkFeedsViewState extends ConsumerState<BookmarkFeedsView>
    with BaseScreenView {
  bool isDarkMode = false;
  bool showSource = false;

  String getfileName = "";
  AppinioSwiperController? controller = AppinioSwiperController();
  late FeedViewModel _viewModel;
  int currentIndex2 = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _viewModel = ref.read(feedViewModel);
    _viewModel.attachView(this);
    // bookmarkedFeeds.clear();
    // _viewModel.articleList
    //     .where((element) => element.articleActionNew?.isBookmarked == true)
    //     .forEach((element) {
    //   print("--- BOOKMARK ADDING ** ");
    //   bookmarkedFeeds.add(element);
    // });

    Future.delayed(const Duration(milliseconds: 200)).then((value) async {
      _viewModel.toggleLoading();
      await _viewModel.getFeeds();
      setState(() {});

      // await _viewModel.getFeedActions(addBookmarks: true);

      _viewModel.toggleLoading();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(feedViewModel);
    // bookmarkedFeeds.clear();
    // _viewModel.articleList
    //     .where((element) => element.articleActionNew?.isBookmarked == true)
    //     .forEach((element) {
    //   print("--- BOOKMARK ADDING ** ");
    //   bookmarkedFeeds.add(element);
    // });
    getfileName = Theme.of(context).brightness != Brightness.dark
        ? "images_light"
        : "images_dark";
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    Widget spinkit = SpinKitFadingFour(
      color: isDarkMode ? Colors.white : Colors.black,
      size: 50.0,
    );
    return Scaffold(
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
              children: [
                gapH32,
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset(
                          "assets/$getfileName/arrow.png",
                          height: 30.h,
                        ),
                      ),
                      gapW10,
                      Text(
                        Translation.BOOKMARKNEWS,
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: mediumText.sp,
                          fontFamily: "Century",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                if (_viewModel.bookmarkedFeeds.isEmpty)
                  Container()
                else
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.20,
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height,
                    child: AppinioSwiper(
                        isDisabled: _viewModel.bookmarkedFeeds.length == 1
                            ? true
                            : false,
                        allowUnSwipe: true,
                        allowUnlimitedUnSwipe: false,
                        loop: true,
                        swipeOptions:
                            const SwipeOptions.only(down: true, up: true),
                        defaultDirection: AxisDirection.up,
                        onSwipeBegin: (previousIndex, targetIndex, activity) {
                          // const double distance = 30;
                          if (targetIndex >= 0) {
                            if (activity.direction.name ==
                                AxisDirection.down.name) {
                              controller?.unswipe();
                            }
                          } else {}
                          showSource = false;
                          setState(() {});
                        },
                        onSwipeEnd: (previousIndex, targetIndex, activity) {
                          switch (activity) {
                            case Swipe():
                              print(
                                'The card was swiped to the : ${activity.direction}',
                              );
                              print(
                                'previous index: $previousIndex, target index: $targetIndex',
                              );
                              break;
                            case Unswipe():
                              print(
                                'A ${activity.direction.name} swipe was undone.',
                              );
                              print(
                                'previous index: $previousIndex, target index: $targetIndex',
                              );
                              break;
                            case CancelSwipe():
                              print('A swipe was cancelled');
                              break;
                            case DrivenActivity():
                              print('Driven Activity');
                              break;
                          }
                        },
                        controller: controller,
                        cardCount: _viewModel.bookmarkedFeeds.length ?? 0,
                        cardBuilder: (context, index) {
                          return newsCard(
                            context,
                            _viewModel.bookmarkedFeeds[index],
                            index,
                          );
                        }),
                  ),
              ],
            ),
    );
  }

  Widget newsCard(BuildContext context, Article article, int index) {
    // print("/////////////////////////////  ${article.category?.first.name}");

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      // height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isDarkMode ? const Color(0xFF292524) : Colors.white,
        border: Border.all(color: isDarkMode ? Colors.white : Colors.black),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              final imageProvider =
                  Image.network(article.thumbnailUrl ?? "").image;
              showImageViewer(context, imageProvider, onViewerDismissed: () {
                print("dismissed");
              });
            },
            child: CachedNetworkImage(
              imageUrl: article.thumbnailUrl ?? "",
              imageBuilder: (context, imageProvider) => Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.fill,
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
                          margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF171717).withOpacity(0.45),
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
                                article.views.toString() ?? "0",
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
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
                      article.category?.first.name ?? "",
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
                height: MediaQuery.of(context).size.height / 3,
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
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image:
                            Image.asset("assets/$getfileName/place_holder.png")
                                .image,
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
                          margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                                article.views.toString() ?? "0",
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
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
                      article.category?.first.name ?? "",
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
          ),

          InkWell(
            onTap: () {
              _viewModel.performAction(
                article.id ?? "",
                ArticleActions.view.name,
                addBookmarks: true,
              );
              context.pushNamed(
                AppRoute.readingModeView.name,
                pathParameters: {'articleId': article.id ?? ""},
              );
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            article.title ?? "",
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: mediumText.sp,
                              fontFamily: "Century",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        gapH8,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            article.bodyShort ?? "",
                            maxLines: 30,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: smallText.sp,
                              fontFamily: "Century",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: showSource,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
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
                                color: isDarkMode ? Colors.white : Colors.black,
                                height: 9.h,
                              ),
                            ),
                            gapW8,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.source?.sourceId?.toUpperCase() ?? "",
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
                                    maxWidth:
                                        MediaQuery.of(context).size.width / 1.7,
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
                          margin: const EdgeInsets.only(right: 24, top: 8),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Container(
          //   height: MediaQuery.of(context).size.height / 1.2 -
          //       MediaQuery.of(context).size.height / 3.2 -
          //       5,
          //   color: Colors.yellow,
          // )
          gapH8,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  "Tap to read more by ${article.authorName}",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
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
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                gapW8,
                Text(
                  timeago.format(article.date ?? DateTime.now()),
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: extrasmallText.sp,
                    fontFamily: "Century",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          gapH8,
          // gapH16,
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 24),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //         children: [
          //           if (!AppConstants.isGuest)
          //             article.articleActionNew?.isLiked == true
          //                 ? Image.asset(
          //                     "assets/images_normal/like_filled.png",
          //                     height: 20.h,
          //                     color: isDarkMode ? Colors.white : Colors.black,
          //                   )
          //                 : InkWell(
          //                     onTap: () {
          //                       AppConstants.isGuest
          //                           ? showDialog(
          //                               context: context,
          //                               builder: (context) => showLoginDialog(),
          //                             )
          //                           : _viewModel.performAction(
          //                               article.id ?? "",
          //                               ArticleActions.like.name,
          //                               addBookmarks: true,
          //                             );
          //                       setState(() {});
          //                     },
          //                     child: Image.asset(
          //                       "assets/images_normal/like.png",
          //                       height: 20.h,
          //                       color: isDarkMode ? Colors.white : Colors.black,
          //                     ),
          //                   )
          //           else
          //             InkWell(
          //               onTap: () {
          //                 showDialog(
          //                   context: context,
          //                   builder: (context) => showLoginDialog(),
          //                 );
          //               },
          //               child: Image.asset(
          //                 "assets/images_normal/like.png",
          //                 height: 20.h,
          //                 color: isDarkMode ? Colors.white : Colors.black,
          //               ),
          //             ),
          //           gapW8,
          //           Text(
          //             (article.likes ?? 0).toString(),
          //             style: TextStyle(
          //               color: const Color(0xFF868686),
          //               fontSize: extrasmallText.sp,
          //               fontFamily: "Century",
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         children: [
          //           if (!AppConstants.isGuest)
          //             article.articleActionNew?.isDisliked == true
          //                 ? Image.asset(
          //                     "assets/images_normal/dislike_filled.png",
          //                     height: 20.h,
          //                     color: isDarkMode ? Colors.white : Colors.black,
          //                   )
          //                 : InkWell(
          //                     onTap: () {
          //                       _viewModel.performAction(
          //                         article.id ?? "",
          //                         ArticleActions.dislike.name,
          //                         addBookmarks: true,
          //                       );
          //                       setState(() {});
          //                     },
          //                     child: Image.asset(
          //                       "assets/images_normal/dislike.png",
          //                       height: 20.h,
          //                       color: isDarkMode ? Colors.white : Colors.black,
          //                     ),
          //                   )
          //           else
          //             InkWell(
          //               onTap: () {
          //                 showDialog(
          //                   context: context,
          //                   builder: (context) => showLoginDialog(),
          //                 );
          //               },
          //               child: Image.asset(
          //                 "assets/images_normal/dislike.png",
          //                 height: 20.h,
          //                 color: isDarkMode ? Colors.white : Colors.black,
          //               ),
          //             ),
          //           // Image.asset(
          //           //   "assets/images_normal/dislike.png",
          //           //   height: 20.h,
          //           //   color: isDarkMode ? Colors.white : Colors.black,
          //           // ),
          //           gapW8,
          //           Text(
          //             (article.dislikes ?? 0).toString(),
          //             style: TextStyle(
          //               color: const Color(0xFF868686),
          //               fontSize: extrasmallText.sp,
          //               fontFamily: "Century",
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         children: [
          //           InkWell(
          //             onTap: () {
          //               Share.share(
          //                 article.source?.sourceUrl ?? "",
          //                 subject: 'Check this news from Unbiasly',
          //               );
          //             },
          //             child: Image.asset(
          //               "assets/images_normal/share.png",
          //               height: 20.h,
          //               color: isDarkMode ? Colors.white : Colors.black,
          //             ),
          //           ),
          //           gapW8,
          //           Text(
          //             "0",
          //             style: TextStyle(
          //               color: const Color(0xFF868686),
          //               fontSize: extrasmallText.sp,
          //               fontFamily: "Century",
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         children: [
          //           if (!AppConstants.isGuest)
          //             article.articleActionNew?.isBookmarked == true
          //                 ? InkWell(
          //                     onTap: () {
          //                       _viewModel.performAction(
          //                         article.id ?? "",
          //                         ArticleActions.bookmark.name,
          //                         addBookmarks: true,
          //                       );
          //                       setState(() {});
          //                     },
          //                     child: Image.asset(
          //                       "assets/images_normal/save_filled.png",
          //                       height: 20.h,
          //                       color: isDarkMode ? Colors.white : Colors.black,
          //                     ),
          //                   )
          //                 : InkWell(
          //                     onTap: () {
          //                       _viewModel.performAction(
          //                         article.id ?? "",
          //                         ArticleActions.bookmark.name,
          //                         addBookmarks: true,
          //                       );
          //                       setState(() {});
          //                     },
          //                     child: Image.asset(
          //                       "assets/images_normal/save.png",
          //                       height: 20.h,
          //                       color: isDarkMode ? Colors.white : Colors.black,
          //                     ),
          //                   )
          //           else
          //             InkWell(
          //               onTap: () {
          //                 showDialog(
          //                   context: context,
          //                   builder: (context) => showLoginDialog(),
          //                 );
          //               },
          //               child: Image.asset(
          //                 "assets/images_normal/save.png",
          //                 height: 20.h,
          //                 color: isDarkMode ? Colors.white : Colors.black,
          //               ),
          //             ),
          //           // Image.asset(
          //           //   "assets/images_normal/save.png",
          //           //   height: 20.h,
          //           //   color: isDarkMode ? Colors.white : Colors.black,
          //           // ),
          //           gapW8,
          //           Text(
          //             (article.bookmarks ?? 0).toString(),
          //             style: TextStyle(
          //               color: const Color(0xFF868686),
          //               fontSize: extrasmallText.sp,
          //               fontFamily: "Century",
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //
          //       /// News Paper Type Icon
          //       // InkWell(
          //       //   onTap: () {
          //       //     showSource = !showSource;
          //       //     setState(() {});
          //       //   },
          //       //   child: Row(
          //       //     children: [
          //       //       Image.asset(
          //       //         showSource
          //       //             ? "assets/images_normal/new_filled.png"
          //       //             : "assets/images_normal/news.png",
          //       //         height: 20.h,
          //       //         color: isDarkMode ? Colors.white : Colors.black,
          //       //       ),
          //       //       // gapW8,
          //       //       Text(
          //       //         "0",
          //       //         style: TextStyle(
          //       //           color: Colors.transparent,
          //       //           fontSize: extrasmallText.sp,
          //       //           fontFamily: "Century",
          //       //           fontWeight: FontWeight.bold,
          //       //         ),
          //       //       ),
          //       //     ],
          //       //   ),
          //       // ),
          //       InkWell(
          //           onTap: () {
          //             showModalBottomSheet(
          //               context: context,
          //               builder: (context) => Container(
          //                 padding: const EdgeInsets.only(
          //                   left: 16,
          //                   right: 16,
          //                   bottom: 16,
          //                 ),
          //                 width: double.infinity,
          //                 decoration: BoxDecoration(
          //                   borderRadius: const BorderRadius.only(
          //                     topLeft: Radius.circular(50),
          //                     topRight: Radius.circular(50),
          //                   ),
          //                   color: isDarkMode
          //                       ? const Color(0xFF1A1A16)
          //                       : const Color(0xFFFBFBFB),
          //                 ),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     gapH4,
          //                     Center(
          //                       child: Container(
          //                         width: 80,
          //                         height: 2,
          //                         decoration: BoxDecoration(
          //                             color: isDarkMode
          //                                 ? Color(0xFF292524)
          //                                 : Color(0xFFE1E1E1)),
          //                       ),
          //                     ),
          //                     gapH16,
          //                     Text(
          //                       Translation.REPORTHEADER,
          //                       style: TextStyle(
          //                         color:
          //                             isDarkMode ? Colors.white : Colors.black,
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: largeText,
          //                       ),
          //                     ),
          //                     gapH16,
          //                     InkWell(
          //                       onTap: () {
          //                         _viewModel.report(
          //                             context,
          //                             ReportRequest(
          //                                 articleId: article.id ?? "",
          //                                 reason: "Fake Information"));
          //                       },
          //                       child: Text(
          //                         Translation.REPORTONE,
          //                         style: TextStyle(
          //                           color: isDarkMode
          //                               ? Colors.white
          //                               : Colors.black,
          //                           fontWeight: FontWeight.w400,
          //                           fontSize: mediumText,
          //                         ),
          //                       ),
          //                     ),
          //                     gapH16,
          //                     InkWell(
          //                       onTap: () {
          //                         _viewModel.report(
          //                             context,
          //                             ReportRequest(
          //                                 articleId: article.id ?? "",
          //                                 reason: "Offensive Content"));
          //                       },
          //                       child: Text(
          //                         Translation.REPORTTWO,
          //                         style: TextStyle(
          //                           color: isDarkMode
          //                               ? Colors.white
          //                               : Colors.black,
          //                           fontWeight: FontWeight.w400,
          //                           fontSize: mediumText,
          //                         ),
          //                       ),
          //                     ),
          //                     gapH16,
          //                   ],
          //                 ),
          //               ),
          //             );
          //           },
          //           child: SvgPicture.asset(
          //             "assets/images_normal/dot3.svg",
          //             height: 15.h,
          //             color: isDarkMode ? Colors.white : Colors.black,
          //           )
          //           // Image.asset(
          //           //   "assets/images_normal/dot3.svg",
          //           //   height: 15.h,
          //           //   width: 15.w,
          //           //   color: isDarkMode ? Colors.white : Colors.black,
          //           // ),
          //           ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (_viewModel.bookmarkedAction[index].isLiked)
                      ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.black, // Change the color here
                          BlendMode.srcIn,
                        ),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 2),
                          width: 35,
                          height: 35,
                          child: Lottie.asset(
                            'assets/images_normal/lotiAnimation.json',
                            repeat: false,
                          ),
                        ),
                      )
                    else
                      InkWell(
                        onTap: () {
                          AppConstants.isGuest
                              ? showDialog(
                                  context: context,
                                  builder: (context) => showLoginDialog(),
                                )
                              : setState(() {
                                  _viewModel.performAction(article.id ?? "",
                                      ArticleActions.like.name, callBack: () {
                                    _viewModel.bookmarkedAction[index].likes++;
                                    _viewModel.bookmarkedAction[index].isLiked =
                                        true;
                                    _viewModel.bookmarkedAction[index]
                                        .isDisliked = false;
                                    if (_viewModel
                                            .bookmarkedAction[index].dislikes !=
                                        0) {
                                      _viewModel
                                          .bookmarkedAction[index].dislikes--;
                                    }
                                  });
                                });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5, bottom: 6),
                          // height: 25,
                          child: Image.asset(
                            "assets/images_normal/like.png",
                            height: 20.h,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    gapW8,
                    Text(
                      // (article.likes ?? 0).toString(),
                      _viewModel.bookmarkedAction[index].likes.toString(),
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
                    if (_viewModel.bookmarkedAction[index].isDisliked)
                      Image.asset(
                        "assets/images_normal/dislike_filled.png",
                        height: 20.h,
                        color: isDarkMode ? Colors.white : Colors.black,
                      )
                    else
                      InkWell(
                        onTap: () {
                          AppConstants.isGuest
                              ? showDialog(
                                  context: context,
                                  builder: (context) => showLoginDialog(),
                                )
                              : setState(() {
                                  _viewModel.performAction(article.id ?? "",
                                      ArticleActions.dislike.name,
                                      callBack: () {
                                    if (_viewModel
                                            .bookmarkedAction[index].dislikes !=
                                        0) {
                                      // _viewModel
                                      //     .articleActionNewList[widget.index]
                                      //     .dislikes++;
                                    }
                                    _viewModel.bookmarkedAction[index].isLiked =
                                        false;
                                    _viewModel.bookmarkedAction[index]
                                        .isDisliked = true;
                                    _viewModel
                                        .bookmarkedAction[index].dislikes++;
                                    _viewModel.bookmarkedAction[index].likes--;
                                  });
                                });
                        },
                        child: Image.asset(
                          "assets/images_normal/dislike.png",
                          height: 20.h,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    gapW8,
                    Text(
                      // (article.dislikes ?? 0).toString(),
                      _viewModel.bookmarkedAction[index].dislikes.toString(),
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
                    InkWell(
                      onTap: () {
                        Share.share(
                          article.source?.sourceUrl ?? "",
                          subject: 'Check this news from Unbiasly',
                        );
                      },
                      child: Image.asset(
                        "assets/images_normal/share.png",
                        height: 20.h,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
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
                    if (_viewModel.bookmarkedAction[index].isBookmarked)
                      InkWell(
                        // onTap: () {
                        //   AppConstants.isGuest
                        //       ? showDialog(
                        //           context: context,
                        //           builder: (context) => showLoginDialog(),
                        //         )
                        //       : setState(() {
                        //           _viewModel.performAction(article.id ?? "",
                        //               ArticleActions.bookmark.name,
                        //               addBookmarks: true);
                        //           article.articleActionNew?.isBookmarked =
                        //               !article.articleActionNew!.isBookmarked;
                        //           _viewModel
                        //               .articleActionNewList[index].bookmarks--;
                        //         });
                        // },
                        onTap: () {
                          AppConstants.isGuest
                              ? showDialog(
                                  context: context,
                                  builder: (context) => showLoginDialog(),
                                )
                              : setState(() {
                                  _viewModel.performAction(
                                    article.id ?? "",
                                    ArticleActions.bookmark.name,
                                  );
                                  _viewModel.bookmarkedAction[index]
                                          .isBookmarked =
                                      !_viewModel
                                          .bookmarkedAction[index].isBookmarked;
                                  _viewModel
                                      .bookmarkedAction[index].bookmarks--;
                                });
                        },
                        child: Image.asset(
                          "assets/images_normal/save_filled.png",
                          height: 20.h,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      )
                    else
                      InkWell(
                        // onTap: () {
                        //   AppConstants.isGuest
                        //       ? showDialog(
                        //           context: context,
                        //           builder: (context) => showLoginDialog(),
                        //         )
                        //       : setState(() {
                        //           _viewModel.performAction(article?.id ?? "",
                        //               ArticleActions.bookmark.name,
                        //               addBookmarks: true);
                        //           article.articleActionNew?.isBookmarked =
                        //               !article.articleActionNew!.isBookmarked;
                        //           article.articleActionNew?.bookmarks++;
                        //         });
                        // },

                        onTap: () {
                          AppConstants.isGuest
                              ? showDialog(
                                  context: context,
                                  builder: (context) => showLoginDialog(),
                                )
                              : setState(() {
                                  _viewModel.performAction(
                                    article.id ?? "",
                                    ArticleActions.bookmark.name,
                                  );
                                  _viewModel.bookmarkedAction[index]
                                          .isBookmarked =
                                      !_viewModel
                                          .bookmarkedAction[index].isBookmarked;
                                  _viewModel
                                      .bookmarkedAction[index].bookmarks++;
                                });
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
                      // (article.bookmarks ?? 0).toString(),
                      _viewModel.bookmarkedAction[index].bookmarks.toString(),
                      style: TextStyle(
                        color: const Color(0xFF868686),
                        fontSize: extrasmallText.sp,
                        fontFamily: "Century",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // InkWell(
                //   onTap: () {
                //     showSource = !showSource;
                //     setState(() {});
                //   },
                //   child: Row(
                //     children: [
                //       Image.asset(
                //         showSource
                //             ? "assets/images_normal/new_filled.png"
                //             : "assets/images_normal/news.png",
                //         height: 20.h,
                //         color: isDarkMode ? Colors.white : Colors.black,
                //       ),
                //       // gapW8,
                //       Text(
                //         "0",
                //         style: TextStyle(
                //           color: Colors.transparent,
                //           fontSize: extrasmallText.sp,
                //           fontFamily: "Century",
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 70,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            color: isDarkMode
                                ? const Color(0xFF1A1A16)
                                : const Color(0xFFFBFBFB),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              gapH4,
                              Center(
                                child: Container(
                                  width: 80,
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: isDarkMode
                                          ? const Color(0xFF292524)
                                          : const Color(0xFFE1E1E1)),
                                ),
                              ),
                              gapH16,
                              Text(
                                Translation.REPORTHEADER,
                                style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: largeText,
                                ),
                              ),
                              gapH16,
                              InkWell(
                                onTap: () {
                                  _viewModel.report(
                                      context,
                                      ReportRequest(
                                          articleId: article.id,
                                          reason: "Fake Information"));
                                },
                                child: Text(
                                  Translation.REPORTONE,
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: mediumText,
                                  ),
                                ),
                              ),
                              gapH16,
                              InkWell(
                                onTap: () {
                                  _viewModel.report(
                                      context,
                                      ReportRequest(
                                          articleId: article.id,
                                          reason: "Offensive Content"));
                                },
                                child: Text(
                                  Translation.REPORTTWO,
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: mediumText,
                                  ),
                                ),
                              ),
                              gapH16,
                            ],
                          ),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/images_normal/dot3.svg",
                      height: 15.h,
                      color: isDarkMode ? Colors.white : Colors.black,
                    )
                    // Image.asset(
                    //   "assets/images_normal/menu.png",
                    //   height: 15.h,
                    //   color: isDarkMode ? Colors.white : Colors.black,
                    // ),
                    ),
              ],
            ),
          ),
          // gapH16,
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
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}
