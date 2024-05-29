//  // ignore_for_file: avoid_bool_literals_in_conditional_expressions

// ignore_for_file: use_named_constants

import 'dart:io';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:unbiased/core/constants.dart';
import 'package:unbiased/core/translation.dart';
import 'package:unbiased/data/feed/models/feed_model.dart';
import 'package:unbiased/data/feed/models/report_model.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/feeds/feed_view_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class FeedsListView extends ConsumerStatefulWidget {
  const FeedsListView({super.key});

  @override
  ConsumerState<FeedsListView> createState() => _FeedsListViewState();
}

class _FeedsListViewState extends ConsumerState<FeedsListView>
    with BaseScreenView {
  int pageindex = 1;
  bool isPaginating = false;
  int pagination = 2;
  bool isDarkMode = false;
  AppinioSwiperController? controller = AppinioSwiperController();
  ScrollController _scrollController = ScrollController();
  late FeedViewModel _viewModel;
  int currentIndex2 = 0;
  bool showSource = false;
  String getfileName = "";
  PageController _controller = PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _viewModel = ref.read(feedViewModel);
    _viewModel.attachView(this);
    Future.delayed(const Duration(milliseconds: 200)).then((value) async {
      _viewModel.toggleLoading();
      await _viewModel.getFeeds();
      setState(() {});

      _viewModel.toggleLoading();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(feedViewModel);
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    Widget spinkit = SpinKitFadingFour(
      color: isDarkMode ? Colors.white : Colors.black,
    );
    getfileName = !(Theme.of(context).brightness == Brightness.dark)
        ? "images_light"
        : "images_dark";
    return Scaffold(
        backgroundColor:
            isDarkMode ? const Color(0xFF1a1a16) : const Color(0xFFf7f7f9),
        body: SafeArea(
          child: _viewModel.loading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      spinkit,
                    ],
                  ),
                )
              : Column(
                  children: [
                    if (_viewModel.getFeedResponse == null)
                      Container()
                    else if (_viewModel.articleList.isEmpty)
                      Center(
                        child: Image.asset(
                          "assets/$getfileName/all_caught_up.png",
                          height: 200,
                        ),
                      )
                    else
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          child: PageView.builder(
                            controller: _controller,
                            onPageChanged: (index) async {
                              // Mark as async to await inside
                              setState(() {
                                pageindex = index;
                                print(pageindex);
                              });
                              if (pageindex ==
                                  _viewModel.articleList.length - 1) {
                                // Start paginating
                                setState(() {
                                  pagination++;

                                  print(pagination);
                                });
                                try {
                                  isPaginating = true;

                                  // setState(() {});
                                  await _viewModel.addPageToFeed(pagination);
                                  isPaginating = false;

                                  // setState(() {});
                                } catch (e) {
                                  isPaginating = false;

                                  // setState(() {});
                                }
                                // Await the asynchronous operation to complete

                                // After fetching the data, set isPaginating to false
                              }
                            },
                            allowImplicitScrolling: true,
                            scrollDirection: Axis.vertical,
                            itemCount: _viewModel.articleList.length +
                                (isPaginating
                                    ? 1
                                    : 0), // Increase itemCount when loading
                            itemBuilder: (context, index) {
                              // Check if the widget to build is the loading indicator
                              if (isPaginating &&
                                  index == _viewModel.articleList.length) {
                                // Return the loading indicator
                                return Center(child: spinkit);
                              }

                              // Otherwise, return the actual news card
                              return GetNewsCard(
                                article: _viewModel.articleList[index],
                                index: index,
                              );
                              // return GetNewsCard(
                              //   viewModel: _viewModel,
                              //   article: _viewModel.articleList[index], index: null,
                              // );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
        ));
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

extension StringExtensions on String {
  String? capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}" ?? "";
  }
}

class GetNewsCard extends ConsumerStatefulWidget {
  final Article article;
  final int index;
  // final FeedViewModel viewModel;
  const GetNewsCard({
    super.key,
    // required this.viewModel,
    required this.article,
    required this.index,
  });

  @override
  ConsumerState<GetNewsCard> createState() => _GetNewsCardState();
}

class _GetNewsCardState extends ConsumerState<GetNewsCard> with BaseScreenView {
  bool showSource = false;
  var indexVal = 0;
  String getfileName = "";
  bool isDarkMode = false;
  late FeedViewModel _viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel = ref.read(feedViewModel);
    _viewModel.attachView(this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // print("-- JSON DATA${widget.article.articleActionNew?.toJson()}");
      // isLiked = widget.article.articleActionNew?.isLiked ?? false;
      // isBookMarked = widget.article.articleActionNew?.isBookmarked ?? false;
      // isDisliked = widget.article.articleActionNew?.isDisliked ?? false;
      // likeCount = widget.article.likes ?? 0;
      // dislikeCount = widget.article.dislikes ?? 0;
      // bookmarkCount = widget.article.bookmarks ?? 0;
      // print("LIKE DATA ========= $isLiked");
      // print(
      //     "LIKE DATA APIS========= ${widget.article.articleActionNew?.isLiked}");
      // print("DISLIKE  ========= $isDisliked");
      // isLiked = widget.article.articleActionNew?.isLiked ?? false;
      // isBookMarked = widget.article.articleActionNew?.isBookmarked ?? false;
      // isDisliked = widget.article.articleActionNew?.isDisliked ?? false;
      // likeCount = widget.article.likes ?? 0;
      // dislikeCount = widget.article.dislikes ?? 0;
      // bookmarkCount = widget.article.bookmarks ?? 0;
      setState(() {});

      if (AppConstants.isGuest == false) {
        // await _viewModel.getFeedActions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (_viewModel.articleList[widget.index].id != null) {}

    print(" +++++  Like Id ${_viewModel.articleList[widget.index].id}");
    // ignore: unnecessary_null_comparison
    // if (_viewModel.articleActionNewList[widget.index] != null) {
    //   indexVal = widget.index;
    // } else {
    //   indexVal = 0;
    // }
    indexVal = widget.index < _viewModel.articleActionNewList.length - 1
        ? widget.index
        : 0;
    //661aacfe07f34f6e9c4a94fd
    //66155514c30551bb31ac7691
    print("-- is indexVal ${indexVal}");
    print("-- is Liked ${_viewModel.articleActionNewList[indexVal].isLiked}");
    _viewModel = ref.watch(feedViewModel);
    // _viewModel = ref.watch(feedViewModel);

    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;

    getfileName = !(Theme.of(context).brightness == Brightness.dark)
        ? "images_light"
        : "images_dark";
    return Container(
      // margin: const EdgeInsets.fromLTRB(16, 30, 16, 0),
      // height: MediaQuery.of(context).size.height * 2,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF292524) : Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: isDarkMode
        //         ? Colors.white.withOpacity(0.1)
        //         : Colors.black.withOpacity(0.1),
        //     blurRadius: 10,
        //     spreadRadius: 0.1,
        //     blurStyle: BlurStyle.outer,
        //   )
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const SizedBox(
          //   height: 50,
          // ),
          InkWell(
            onTap: () {
              if (widget.article.link != null) {
                print(widget.article);
                _viewModel.performAction(
                  widget.article?.id ?? "",
                  ArticleActions.view.name,
                  addBookmarks: true,
                );
                context.pushNamed(
                  AppRoute.readingModeView.name,
                  pathParameters: {'articleId': widget.article.link ?? ""},
                );
              }
            },
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    final imageProvider =
                        NetworkImage(widget.article.thumbnailUrl ?? "");
                    showImageViewer(context, imageProvider,
                        onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        height: MediaQuery.of(context).size.height / 2.6,
                        imageUrl: widget.article.thumbnailUrl ?? "",
                        imageBuilder: (context, imageProvider) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                // fit: BoxFit.fitHeight,
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Container(
                          height: MediaQuery.of(context).size.height / 2.6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: MediaQuery.of(context).size.height / 2.6,
                          width: double.infinity,
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                "assets/$getfileName/place_holder.png",
                              ).image,
                            ),
                          ),
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 0, // Positioned at the bottom-left corner
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 8,
                          ),
                          margin: const EdgeInsets.fromLTRB(13, 0, 10, 12),
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
                            widget.article.ownCategories?.first.name
                                    ?.capitalize() ??
                                widget.article.category?.first.name
                                    ?.capitalize() ??
                                "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  (MediaQuery.of(context).size.height / 100) *
                                      1.7,
                              fontFamily: "Merriweather",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      // New Positioned widget
                      // Positioned(
                      //   bottom: -12,
                      //   left: 0, // Positioned at the bottom-left corner
                      //   child: Container(
                      //       // Your widget code here
                      //       ),
                      // ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      // height: !Platform.isIOS
                      //     ? MediaQuery.of(context).size.height / 2.25
                      //     : MediaQuery.of(context).size.height / 2.3,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4, left: 16, right: 16),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 4.0,
                                  ),
                                  child: Text(
                                    widget.article.title ?? "",
                                    maxLines: 2,
                                    style: TextStyle(
                                      height: 1.6,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: (MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              100) *
                                          1.8,
                                      // letterSpacing: 0.3,
                                      fontFamily: "Merriweather",
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                // height: MediaQuery.of(context).size.height / 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4, bottom: 0, left: 16, right: 16),
                                  child: Column(
                                    // Changed to Column to accommodate multiple children
                                    children: [
                                      Text(
                                        widget.article.bodyShort?.trim() ??
                                            "",
                                        maxLines: 9,
                                        softWrap: true,
                                        style: TextStyle(
                                          height: 1.6,
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: (MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100) *
                                              1.7,
                                          fontFamily: "Merriweather",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  widget.article.source
                                                              ?.sourceId
                                                              ?.capitalize() !=
                                                          null
                                                      ? "${Translation.TAPTOREADMOREBY} ${widget.article.source?.sourceId?.capitalize()}"
                                                      : Translation
                                                          .TAPTOREADMORE,
                                                  style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 10,
                                                    fontFamily:
                                                        "Merriweather",
                                                    fontWeight:
                                                        FontWeight.w500,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const SizedBox(
                                                    width:
                                                        8), // Changed gapW8 to SizedBox
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
                                                const SizedBox(
                                                    width:
                                                        8), // Changed gapW8 to SizedBox
                                                Text(
                                                  timeago.format(
                                                    widget.article
                                                            .updatedAt ??
                                                        DateTime.now(),
                                                  ),
                                                  style: TextStyle(
                                                    color: isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 11,
                                                    fontFamily:
                                                        "Merriweather",
                                                    fontWeight:
                                                        FontWeight.w400,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     _viewModel.performAction(
          //       widget.article.id ?? "",
          //       ArticleActions.view.name,
          //       addBookmarks: true,
          //     );
          //     context.pushNamed(
          //       AppRoute.readingModeView.name,
          //       pathParameters: {'articleId': widget.article.id ?? ""},
          //     );
          //   },
          //   child: Visibility(
          //     visible: false,
          //     child: Stack(
          //       alignment: Alignment.topRight,
          //       children: [
          //         Container(
          //           // margin: const EdgeInsets.symmetric(horizontal: 16),
          //           padding: const EdgeInsets.symmetric(
          //             horizontal: 16,
          //             vertical: 16,
          //           ),
          //           decoration: BoxDecoration(
          //             boxShadow: [
          //               BoxShadow(
          //                 color: isDarkMode
          //                     ? Colors.white.withOpacity(0.1)
          //                     : Colors.black.withOpacity(0.1),
          //                 spreadRadius: 2,
          //                 offset: const Offset(
          //                   5,
          //                   6,
          //                 ),
          //                 blurRadius: 2,
          //               ),
          //             ],
          //             // borderRadius: BorderRadius.circular(16),
          //             color:
          //                 !isDarkMode ? Colors.black : const Color(0xFFF7F7F9),
          //           ),
          //           child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.only(top: 4),
          //                 child: Image.asset(
          //                   "assets/images_normal/newspaper.png",
          //                   color: !isDarkMode ? Colors.white : Colors.black,
          //                   height: 9.h,
          //                 ),
          //               ),
          //               gapW8,
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     widget.article.source?.sourceId?.toUpperCase() ??
          //                         "",
          //                     style: TextStyle(
          //                       color:
          //                           !isDarkMode ? Colors.white : Colors.black,
          //                       fontSize: extrasmallText.sp,
          //                       fontFamily: "Merriweather",
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                   gapH4,
          //                   Container(
          //                     constraints: BoxConstraints(
          //                       maxWidth: MediaQuery.of(context).size.width / 1,
          //                     ),
          //                     child: Text(
          //                       widget.article.link ?? "",
          //                       overflow: TextOverflow.ellipsis,
          //                       maxLines: 1,
          //                       style: TextStyle(
          //                         color:
          //                             !isDarkMode ? Colors.white : Colors.black,
          //                         fontSize: extrasmallText.sp,
          //                         fontFamily: "Merriweather",
          //                         fontWeight: FontWeight.w200,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //         InkWell(
          //           onTap: () {
          //             showSource = false;
          //             setState(() {});
          //           },
          //           child: Container(
          //             margin: const EdgeInsets.only(right: 24, top: 18),
          //             padding: const EdgeInsets.all(4),
          //             decoration: BoxDecoration(
          //               shape: BoxShape.circle,
          //               color: Colors.white.withOpacity(0.2),
          //             ),
          //             child: Icon(
          //               Icons.close,
          //               size: 16,
          //               color: !isDarkMode ? Colors.white : Colors.black,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
    
          // gapH16,
          Padding(
            padding: const EdgeInsets.only(left: 23, right: 23, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (_viewModel.articleActionNewList[indexVal].isLiked)
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          isDarkMode
                              ? Colors.white
                              : Colors.black, // Change the color here
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
                        onTap: () async {
                          if (AppConstants.isGuest) {
                            showDialog(
                              context: context,
                              builder: (context) => showLoginDialog(),
                            );
                          } else {
                            if (!_viewModel
                                    .articleActionNewList[indexVal].isLiked &&
                                _viewModel.loading == false) {
                              _viewModel.loading = true;
                              setState(() {});
                              await _viewModel.performAction(
                                  widget.article.id ?? "",
                                  ArticleActions.like.name, callBack: () {
                                _viewModel.articleActionNewList[indexVal]
                                        .likes++ ??
                                    " ";
                                _viewModel.articleActionNewList[indexVal]
                                    .isLiked = true;
                                if (_viewModel.articleActionNewList[indexVal]
                                    .isDisliked) {
                                  if (_viewModel
                                          .articleActionNewList[indexVal]
                                          .dislikes !=
                                      0) {
                                    _viewModel.articleActionNewList[indexVal]
                                        .dislikes--;
                                  }
                                  _viewModel.articleActionNewList[indexVal]
                                      .isDisliked = false;
                                }
                              });
                              _viewModel.loading = false;
                              setState(() {});
                            }
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5, bottom: 6),
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
                      _viewModel.articleActionNewList[indexVal].likes
                          .toString(),
                      style: TextStyle(
                        color: const Color(0xFF868686),
                        fontSize: extrasmallText.sp,
                        fontFamily: "Merriweather",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (_viewModel.articleActionNewList[indexVal].isDisliked)
                      Image.asset(
                        "assets/images_normal/dislike_filled.png",
                        height: 20.h,
                        color: isDarkMode ? Colors.white : Colors.black,
                      )
                    else
                      InkWell(
                        onTap: () async {
                          if (AppConstants.isGuest) {
                            showDialog(
                              context: context,
                              builder: (context) => showLoginDialog(),
                            );
                          } else {
                            if (!_viewModel.articleActionNewList[indexVal]
                                    .isDisliked &&
                                _viewModel.loading == false) {
                              _viewModel.loading = true;
                              setState(() {});
                              await _viewModel.performAction(
                                  widget.article.id ?? "",
                                  ArticleActions.dislike.name, callBack: () {
                                if (_viewModel.articleActionNewList[indexVal]
                                        .dislikes !=
                                    0) {
                                  _viewModel.articleActionNewList[indexVal]
                                      .dislikes++;
                                }
                                _viewModel.articleActionNewList[indexVal]
                                    .isDisliked = true;
                                _viewModel.articleActionNewList[indexVal]
                                    .dislikes++;
                                if (_viewModel
                                    .articleActionNewList[indexVal].isLiked) {
                                  if (_viewModel
                                          .articleActionNewList[indexVal]
                                          .likes !=
                                      0) {
                                    _viewModel.articleActionNewList[indexVal]
                                        .likes--;
                                  }
                                  _viewModel.articleActionNewList[indexVal]
                                      .isLiked = false;
                                }
                              });
                              _viewModel.loading = false;
                              setState(() {});
                            }
                          }
                        },
                        child: Image.asset(
                          "assets/images_normal/dislike.png",
                          height: 20.h,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    gapW8,
                    Text(
                      _viewModel.articleActionNewList[indexVal].dislikes
                          .toString(),
                      style: TextStyle(
                        color: const Color(0xFF868686),
                        fontSize: extrasmallText.sp,
                        fontFamily: "Merriweather",
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
                          !Platform.isIOS
                              ? '${widget.article.link ?? "https://apps.apple.com/in/app/unbiasly/id6477892005"}'
                              : 'https://apps.apple.com/in/app/unbiasly/id6477892005',
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
                        fontFamily: "Merriweather",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (_viewModel
                        .articleActionNewList[indexVal].isBookmarked)
                      InkWell(
                        onTap: () {
                          AppConstants.isGuest
                              ? showDialog(
                                  context: context,
                                  builder: (context) => showLoginDialog(),
                                )
                              : setState(() {
                                  _viewModel.performAction(
                                    widget.article.id ?? "",
                                    ArticleActions.bookmark.name,
                                  );
                                  _viewModel.articleActionNewList[indexVal]
                                          .isBookmarked =
                                      !_viewModel
                                          .articleActionNewList[indexVal]
                                          .isBookmarked;
                                  _viewModel.articleActionNewList[indexVal]
                                      .bookmarks--;
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
                        onTap: () {
                          AppConstants.isGuest
                              ? showDialog(
                                  context: context,
                                  builder: (context) => showLoginDialog(),
                                )
                              : setState(() {
                                  _viewModel.performAction(
                                    widget.article.id ?? "",
                                    ArticleActions.bookmark.name,
                                  );
                                  _viewModel.articleActionNewList[indexVal]
                                          .isBookmarked =
                                      !_viewModel
                                          .articleActionNewList[indexVal]
                                          .isBookmarked;
                                  _viewModel.articleActionNewList[indexVal]
                                      .bookmarks++;
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
                      _viewModel.articleActionNewList[indexVal].bookmarks
                          .toString(),
                      style: TextStyle(
                        color: const Color(0xFF868686),
                        fontSize: extrasmallText.sp,
                        fontFamily: "Merriweather",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // final snackdemo = SnackBar(
                        //   content: Text(
                        //     "${widget.article.verifiedSource}",
                        //     style: TextStyle(
                        //       color: isDarkMode ? Colors.black : Colors.white,
                        //       fontSize: 16,
                        //       fontFamily: "Merriweather",
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        //   backgroundColor:
                        //       isDarkMode ? Colors.white : Colors.black,
                        //   elevation: 10,
                        //   behavior: SnackBarBehavior.floating,
                        //   margin: EdgeInsets.all(5),
                        // );
                        final snackdemo = SnackBar(
                          content: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${widget.article.verifiedSource}",
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 16,
                                    fontFamily: "Merriweather",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.close,
                                    color: isDarkMode
                                        ? Colors.black
                                        : Colors.white),
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                              ),
                            ],
                          ),
                          backgroundColor:
                              isDarkMode ? Colors.white : Colors.black,
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.all(2),
                        );
    
                        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                        showSource = !showSource;
                        setState(() {});
                      },
                      child: Image.asset(
                        "assets/images_normal/news.png",
                        height: 20.h,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
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
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black,
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
                                          articleId: widget.article.id,
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
                                          articleId: widget.article.id,
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
    
          // gapH32,
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
              fontFamily: "Merriweather",
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
              fontFamily: "Merriweather",
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
                        fontFamily: "Merriweather",
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
                        fontFamily: "Merriweather",
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
}

// New Code  Happyns mavani
//
// ignore_for_file: avoid_bool_literals_in_conditional_expressions
//
// import 'dart:developer';
//
// import 'package:appinio_swiper/appinio_swiper.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:easy_image_viewer/easy_image_viewer.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:lottie/lottie.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:unbiased/core/constants.dart';
// import 'package:unbiased/core/translation.dart';
// import 'package:unbiased/data/feed/models/feed_model.dart';
// import 'package:unbiased/data/feed/models/report_model.dart';
// import 'package:unbiased/services/shared_preference_service.dart';
// import 'package:unbiased/utils/utils.dart';
// import 'package:unbiased/view/screens/feeds/feed_view_model.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import 'package:url_launcher/url_launcher.dart' as launcher;
//
// class FeedsListView extends ConsumerStatefulWidget {
//   const FeedsListView({super.key});
//
//   @override
//   ConsumerState<FeedsListView> createState() => _FeedsListViewState();
// }
//
// class _FeedsListViewState extends ConsumerState<FeedsListView>
//     with BaseScreenView {
//   int pageindex = 1;
//   bool isPaginating = false;
//
//   int pagination = 2;
//   bool isDarkMode = false;
//   AppinioSwiperController? controller = AppinioSwiperController();
//   late FeedViewModel _viewModel;
//   int currentIndex2 = 0;
//   bool showSource = false;
//   String getfileName = "";
//   PageController _controller = PageController(initialPage: 1);
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _viewModel = ref.read(feedViewModel);
//     _viewModel.attachView(this);
//     Future.delayed(const Duration(milliseconds: 200)).then((value) async {
//       _viewModel.toggleLoading();
//       await _viewModel.getFeeds();
//       setState(() {});
//
//       _viewModel.toggleLoading();
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _viewModel = ref.watch(feedViewModel);
//     isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
//     Widget spinkit = SpinKitFadingFour(
//       color: isDarkMode ? Colors.white : Colors.black,
//     );
//     getfileName = !(Theme.of(context).brightness == Brightness.dark)
//         ? "images_light"
//         : "images_dark";
//     return Scaffold(
//       backgroundColor:
//           isDarkMode ? const Color(0xFF1a1a16) : const Color(0xFFf7f7f9),
//       body: _viewModel.loading
//           ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Center(
//                   child: spinkit,
//                 ),
//               ],
//             )
//           : Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // const SizedBox(
//                 //   height: 16,
//                 // ),
//                 if (_viewModel.getFeedResponse == null)
//                   Container()
//                 else if (_viewModel.articleList.isEmpty)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Center(
//                         child: Image.asset(
//                           "assets/$getfileName/all_caught_up.png",
//                           height: 200,
//                         ),
//                       ),
//                     ],
//                   )
//                 else
//                   Expanded(
//                     child: PageView.builder(
//                       controller: _controller,
//                       onPageChanged: (index) {
//                         setState(() {
//                           pageindex = index;
//                           print(pageindex);
//                         });
//                         if (pageindex == _viewModel.articleList.length - 1) {
//                           setState(() {
//                             pagination++;
//                             isPaginating = true;
//                             print(pagination);
//                           });
//
//                           _viewModel.addPageToFeed(pagination);
//                           setState(() {
//                             isPaginating = false;
//                           });
//                         }
//                       },
//                       allowImplicitScrolling: true,
//                       scrollDirection: Axis.vertical,
//                       itemCount: _viewModel.articleList.length ?? 0,
//                       itemBuilder: (context, index) {
//                         // Assuming `newsCard` is a method returning a widget for displaying news content.
//                         // You might need to implement it according to your requirements.
//                         return GetNewsCard(
//                           index: index,
//                           // viewModel: _viewModel,
//                           article: _viewModel.articleList[index],
//                         );
//                       },
//                     ),
//                   ),
//                 // Expanded(
//                 //   child: PageView.builder(
//                 //     controller: _controller,
//                 //     onPageChanged: (index) {
//                 //       setState(() {
//                 //         pageindex = index;
//                 //         print(pageindex);
//                 //       });
//                 //       if (pageindex == _viewModel.articleList.length - 1) {
//                 //         setState(() {
//                 //           pagination++;
//                 //           isPaginating = true;
//                 //           print(pagination);
//                 //         });
//
//                 //         _viewModel.addPageToFeed(pagination);
//                 //         setState(() {
//                 //           isPaginating = false;
//                 //         });
//                 //       }
//                 //     },
//                 //     allowImplicitScrolling: true,
//                 //     scrollDirection: Axis.vertical,
//                 //     itemCount: _viewModel.articleList.length ?? 0,
//                 //     itemBuilder: (context, index) {
//                 //       // Assuming `newsCard` is a method returning a widget for displaying news content.
//                 //       // You might need to implement it according to your requirements.
//                 //       return GetNewsCard(
//                 //         viewModel: _viewModel,
//                 //         article: _viewModel.articleList[index],
//                 //       );
//                 //     },
//                 //   ),
//                 // ),
//                 // Expanded(
//                 // child: PageView.builder(
//                 //   controller: _controller,
//                 //   onPageChanged: (index) async {
//                 //     // Mark as async to await inside
//                 //     setState(() {
//                 //       pageindex = index;
//                 //       print(pageindex);
//                 //     });
//                 //     if (pageindex == _viewModel.articleList.length - 1) {
//                 //       // Start paginating
//                 //       setState(() {
//                 //         pagination++;
//
//                 //         print(pagination);
//                 //       });
//                 //       try {
//                 //         isPaginating = true;
//
//                 //         setState(() {});
//                 //         await _viewModel.addPageToFeed(pagination);
//                 //         isPaginating = false;
//
//                 //         setState(() {});
//                 //       } catch (e) {
//                 //         isPaginating = false;
//
//                 //         setState(() {});
//                 //       }
//                 //       // Await the asynchronous operation to complete
//
//                 //       // After fetching the data, set isPaginating to false
//                 //     }
//                 //   },
//                 //   allowImplicitScrolling: true,
//                 //   scrollDirection: Axis.vertical,
//                 //   itemCount: _viewModel.articleList.length +
//                 //       (isPaginating
//                 //           ? 1
//                 //           : 0), // Increase itemCount when loading
//                 //   itemBuilder: (context, index) {
//                 //     // Check if the widget to build is the loading indicator
//                 //     if (isPaginating &&
//                 //         index == _viewModel.articleList.length) {
//                 //       // Return the loading indicator
//                 //       return Center(child: spinkit);
//                 //     }
//
//                 //     // Otherwise, return the actual news card
//                 //     return GetNewsCard(
//                 //       viewModel: _viewModel,
//                 //       article: _viewModel.articleList[index],
//                 //     );
//                 //   },
//                 // ),
//                 // ),
//               ],
//             ),
//     );
//   }
//
//   @override
//   void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
//     // TODO: implement navigateToScreen
//   }
//
//   @override
//   void showSnackbar(String message, {Color? color}) {
//     // TODO: implement showSnackbar
//   }
// }
//
// extension StringExtensions on String {
//   String? capitalize() {
//     return "${this[0].toUpperCase()}${this.substring(1)}" ?? "";
//   }
// }
//
// class GetNewsCard extends ConsumerStatefulWidget {
//   final Article article;
//   final int index;
//   // final FeedViewModel viewModel;
//   const GetNewsCard({
//     super.key,
//     // required this.viewModel,
//     required this.article,
//     required this.index,
//   });
//
//   @override
//   ConsumerState<GetNewsCard> createState() => _GetNewsCardState();
// }
//
// class _GetNewsCardState extends ConsumerState<GetNewsCard> with BaseScreenView {
//   bool showSource = false;
//   String getfileName = "";
//
//   bool isDarkMode = false;
//   late FeedViewModel _viewModel;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _viewModel = ref.read(feedViewModel);
//     _viewModel.attachView(this);
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       // print("-- JSON DATA${widget.article.articleActionNew?.toJson()}");
//       // isLiked = widget.article.articleActionNew?.isLiked ?? false;
//       // isBookMarked = widget.article.articleActionNew?.isBookmarked ?? false;
//       // isDisliked = widget.article.articleActionNew?.isDisliked ?? false;
//       // likeCount = widget.article.likes ?? 0;
//       // dislikeCount = widget.article.dislikes ?? 0;
//       // bookmarkCount = widget.article.bookmarks ?? 0;
//       // print("LIKE DATA ========= $isLiked");
//       // print(
//       // "LIKE DATA APIS========= ${widget.article.articleActionNew?.isLiked}");
//       // print("DISLIKE  ========= $isDisliked");
//       // isLiked = widget.article.articleActionNew?.isLiked ?? false;
//       // isBookMarked = widget.article.articleActionNew?.isBookmarked ?? false;
//       // isDisliked = widget.article.articleActionNew?.isDisliked ?? false;
//       // likeCount = widget.article.likes ?? 0;
//       // dislikeCount = widget.article.dislikes ?? 0;
//       // bookmarkCount = widget.article.bookmarks ?? 0;
//       setState(() {});
//
//       if (AppConstants.isGuest == false) {
//         // await _viewModel.getFeedActions();
//       }
//     });
//   }
//
//   // @override
//   // void didUpdateWidget(covariant GetNewsCard oldWidget) {
//   //   // TODO: implement didUpdateWidget
//   //   super.didUpdateWidget(oldWidget);
//   //   setState(() {
//   //     if (!AppConstants.isGuest) {
//   //       // isLiked = widget.article.articleActionNew?.isLiked ?? false;
//   //       // isBookMarked = widget.article.articleActionNew?.isBookmarked ?? false;
//   //       // isDisliked = widget.article.articleActionNew?.isDisliked ?? false;
//   //       // likeCount = widget.article.likes ?? 0;
//   //       // dislikeCount = widget.article.dislikes ?? 0;
//   //       // bookmarkCount = widget.article.bookmarks ?? 0;
//   //
//   //       // isLiked = _viewModel.feedActionResponse!.articleAction!.any(
//   //       //   (element) =>
//   //       //       (element.articleId?.id == widget.article.id) &&
//   //       //       element.isLiked == true,
//   //       // )
//   //       //     ? true
//   //       //     : false;
//   //       print("++++++++++++ IS LIKED $isLiked");
//   //     } else {
//   //       isLiked = false;
//   //     }
//   //
//   //     // if (!AppConstants.isGuest && _viewModel.feedActionResponse != null) {
//   //     //   // isLiked = _viewModel.feedActionResponse!.articleAction!.any(
//   //     //   //   (element) =>
//   //     //   //       (element.articleId?.id == widget.article.id) &&
//   //     //   //       element.isDisliked == true,
//   //     //   // )
//   //     //   //     ? true
//   //     //   //     : false;
//   //     // } else {
//   //     //   isDisliked = false;
//   //     // }
//   //     // dislikeCount = widget.article.dislikes ?? 0;
//   //
//   //     // if (!AppConstants.isGuest && _viewModel.feedActionResponse != null) {
//   //     // isLiked = _viewModel.feedActionResponse!.articleAction!.any(
//   //     //   (element) =>
//   //     //       (element.articleId?.id == widget.article.id) &&
//   //     //       element.isBookmarked == true,
//   //     // )
//   //     //     ? true
//   //     //     : false;
//   //     // } else {
//   //     //   isBookMarked = false;
//   //     // }
//   //     // bookmarkCount = widget.article.bookmarks ?? 0;
//   //   });
//   // }
//
//   // static bool isBookMarked = false;
//   // static bool isLiked = false;
//   // static bool isDisliked = false;
//   // static int likeCount = 0;
//   // static int dislikeCount = 0;
//   // static int bookmarkCount = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     print(" +++++  Like Id ${_viewModel.articleList[widget.index].id}");
//
//     //661aacfe07f34f6e9c4a94fd
//     //66155514c30551bb31ac7691
//     print(
//         "-- is Liked ${_viewModel.articleActionNewList[widget.index].isLiked}");
//     _viewModel = ref.watch(feedViewModel);
//     // _viewModel = ref.watch(feedViewModel);
//
//     isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
//
//     getfileName = !(Theme.of(context).brightness == Brightness.dark)
//         ? "images_light"
//         : "images_dark";
//     return Container(
//       margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
//       height: MediaQuery.of(context).size.height / 1.28,
//       decoration: BoxDecoration(
//         // borderRadius: BorderRadius.circular(30),
//         color: isDarkMode ? const Color(0xFF292524) : Colors.white,
//
//         // border: Border.all(color: isDarkMode ? Colors.white : Colors.black),
//       ),
//       child: Column(
//         children: [
//           // const SizedBox(
//           //   height: 50,
//           // ),
//
//           Stack(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height / 3.2,
//               ),
//               Container(
//                 child: InkWell(
//                   onTap: () {
//                     _viewModel.performAction(
//                       widget.article?.id ?? "",
//                       ArticleActions.view.name,
//                       addBookmarks: true,
//                     );
//                     context.pushNamed(
//                       AppRoute.readingModeView.name,
//                       pathParameters: {
//                         'articleId': widget.article.source?.sourceUrl ?? ""
//                       },
//                     );
//                   },
//                   child: Column(
//                     children: [
//                       Stack(
//                         children: [
//                           Container(
//                             child: InkWell(
//                               onTap: () {
//                                 final imageProvider = NetworkImage(
//                                     widget.article.thumbnailUrl ?? "");
//                                 showImageViewer(context, imageProvider,
//                                     onViewerDismissed: () {
//                                   print("dismissed");
//                                 });
//                               },
//                               child: CachedNetworkImage(
//                                 imageUrl: widget.article.thumbnailUrl ?? "",
//                                 imageBuilder: (context, imageProvider) =>
//                                     Container(
//                                   height:
//                                       MediaQuery.of(context).size.height / 3.4,
//                                   width: double.infinity,
//                                   margin:
//                                       const EdgeInsets.only(top: 0, bottom: 16),
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image: imageProvider,
//                                     ),
//                                   ),
//                                   child: const Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       //   Container(
//                                       //     height: 26.h,
//                                       //     padding: const EdgeInsets.symmetric(
//                                       //       vertical: 4,
//                                       //       horizontal: 14,
//                                       //     ),
//                                       //     margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//                                       //     decoration: BoxDecoration(
//                                       //       color:
//                                       //           const Color(0xFF171717).withOpacity(0.45),
//                                       //       borderRadius: BorderRadius.circular(30),
//                                       //     ),
//                                       //     child: Row(
//                                       //       children: [
//                                       //         Image.asset(
//                                       //           "assets/images_normal/visible.png",
//                                       //           height: 11.h,
//                                       //           color: Colors.white,
//                                       //         ),
//                                       //         gapW4,
//                                       //         Text(
//                                       //           widget.article.views.toString(),
//                                       //           style: TextStyle(
//                                       //             color: Colors.white,
//                                       //             fontSize: extrasmallText.sp,
//                                       //             fontFamily: "Merriweather",
//                                       //             fontWeight: FontWeight.bold,
//                                       //           ),
//                                       //         ),
//                                       //       ],
//                                       //     ),
//                                       //   ),
//                                     ],
//                                   ),
//                                 ),
//                                 placeholder: (context, url) => Container(
//                                   height:
//                                       MediaQuery.of(context).size.height / 4,
//                                   width: double.infinity,
//                                   // margin: const EdgeInsets.all(16),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   child: const Center(
//                                       child: CircularProgressIndicator()),
//                                 ),
//                                 errorWidget: (context, url, error) => Stack(
//                                   alignment: Alignment.bottomLeft,
//                                   children: [
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height /
//                                               4,
//                                       width: double.infinity,
//                                       margin: const EdgeInsets.all(16),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(30),
//                                         image: DecorationImage(
//                                           fit: BoxFit.fill,
//                                           image: Image.asset(
//                                             "assets/$getfileName/place_holder.png",
//                                           ).image,
//                                         ),
//                                       ),
//                                       child: const Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           // Container(
//                                           //   height: 26.h,
//                                           //   padding: const EdgeInsets.symmetric(
//                                           //     vertical: 4,
//                                           //     horizontal: 14,
//                                           //   ),
//                                           //   margin:
//                                           //       const EdgeInsets.fromLTRB(16, 16, 16, 16),
//                                           //   decoration: BoxDecoration(
//                                           //     color: Colors.white.withOpacity(0.2),
//                                           //     borderRadius: BorderRadius.circular(30),
//                                           //   ),
//                                           //   child: Row(
//                                           //     children: [
//                                           //       Image.asset(
//                                           //         "assets/images_normal/visible.png",
//                                           //         height: 11.h,
//                                           //         color: Colors.white,
//                                           //       ),
//                                           //       gapW4,
//                                           //       Text(
//                                           //         widget.article.views.toString(),
//                                           //         style: TextStyle(
//                                           //           color: Colors.white,
//                                           //           fontSize: extrasmallText.sp,
//                                           //           fontFamily: "Merriweather",
//                                           //           fontWeight: FontWeight.bold,
//                                           //         ),
//                                           //       ),
//                                           //     ],
//                                           //   ),
//                                           // ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Image.asset(
//                               "assets/images_normal/logo.png",
//                               color: isDarkMode ? Colors.white : Colors.black,
//                               height: MediaQuery.of(context).size.height / 30,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Summarised by Unbaisly.ai",
//                               style: TextStyle(
//                                 color: isDarkMode ? Colors.white : Colors.black,
//                                 fontSize: 13.sp,
//                                 fontFamily: "Merriweather",
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           SizedBox(
//                             // height: MediaQuery.of(context).size.height / 2.6,
//                             child: Column(
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.fromLTRB(
//                                           16, 0, 16, 0),
//                                       child: Text(
//                                         widget.article.title ?? "",
//                                         maxLines: 2,
//                                         style: TextStyle(
//                                           color: isDarkMode
//                                               ? Colors.white
//                                               : Colors.black,
//                                           fontSize: mediumText.sp,
//                                           fontFamily: "Merriweather",
//                                           fontWeight: FontWeight.w900,
//                                         ),
//                                       ),
//                                     ),
//                                     // Padding(
//                                     //   padding: const EdgeInsets.symmetric(
//                                     //       horizontal: 16.0),
//                                     //   child: Row(
//                                     //     mainAxisAlignment:
//                                     //         MainAxisAlignment.spaceBetween,
//                                     //     children: [
//                                     //       Row(
//                                     //         children: [
//                                     //           Text(
//                                     //             "Unbiasly",
//                                     //             style: TextStyle(
//                                     //               color: isDarkMode
//                                     //                   ? Colors.white
//                                     //                   : Colors.black,
//                                     //               fontSize: extrasmallText.sp,
//                                     //               fontFamily: "Merriweather",
//                                     //               fontWeight: FontWeight.w500,
//                                     //             ),
//                                     //           ),
//                                     //           gapW8,
//                                     //           Container(
//                                     //             height: 6,
//                                     //             width: 6,
//                                     //             decoration: BoxDecoration(
//                                     //               shape: BoxShape.circle,
//                                     //               color: isDarkMode
//                                     //                   ? Colors.white
//                                     //                   : Colors.black,
//                                     //             ),
//                                     //           ),
//                                     //           gapW8,
//                                     //           Text(
//                                     //             timeago.format(
//                                     //               widget.article.updatedAt ??
//                                     //                   DateTime.now(),
//                                     //             ),
//                                     //             style: TextStyle(
//                                     //               color: isDarkMode
//                                     //                   ? Colors.white
//                                     //                   : Colors.black,
//                                     //               fontSize: extrasmallText.sp,
//                                     //               fontFamily: "Merriweather",
//                                     //               fontWeight: FontWeight.w500,
//                                     //             ),
//                                     //           ),
//                                     //         ],
//                                     //       ),
//                                     //       Container(
//                                     //         padding: const EdgeInsets.symmetric(
//                                     //           vertical: 6,
//                                     //           horizontal: 8,
//                                     //         ),
//                                     //         margin: const EdgeInsets.fromLTRB(
//                                     //             30, 0, 0, 2),
//                                     //         decoration: BoxDecoration(
//                                     //           color: Colors.black,
//                                     //           border: Border.all(
//                                     //             width: 2,
//                                     //             color: !isDarkMode
//                                     //                 ? Colors.white
//                                     //                 : const Color(0xFF292524),
//                                     //           ),
//                                     //           borderRadius:
//                                     //               BorderRadius.circular(30),
//                                     //         ),
//                                     //         child: Text(
//                                     //           widget.article.ownCategories
//                                     //                   ?.first.name
//                                     //                   ?.capitalize() ??
//                                     //               widget.article.category?.first
//                                     //                   .name
//                                     //                   ?.capitalize() ??
//                                     //               "",
//                                     //           style: TextStyle(
//                                     //             color: Colors.white,
//                                     //             fontSize: extrasmallText.sp,
//                                     //             fontFamily: "Merriweather",
//                                     //             fontWeight: FontWeight.w700,
//                                     //           ),
//                                     //         ),
//                                     //       ),
//                                     //     ],
//                                     //   ),
//                                     // ),
//                                     gapH6,
//                                     SizedBox(
//                                       height:
//                                           MediaQuery.of(context).size.height /
//                                               3.6,
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 16),
//                                         child: Text(
//                                           widget.article.bodyShort ?? "",
//                                           // maxLines: 10,
//                                           // softWrap: true,
//                                           // overflow: TextOverflow.ellipsis,
//                                           style: TextStyle(
//                                             color: isDarkMode
//                                                 ? Colors.white
//                                                 : Colors.black,
//                                             fontSize: 13.sp,
//                                             fontFamily: "Merriweather",
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 gapH8,
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 16.0),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Text(
//                                             "Tap to read more by ${widget.article.source!.sourceId} ",
//                                             style: TextStyle(
//                                               color: isDarkMode
//                                                   ? Colors.white
//                                                   : Colors.black,
//                                               fontSize: 12.sp,
//                                               fontFamily: "Merriweather",
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                           gapW8,
//                                           Container(
//                                             height: 6,
//                                             width: 6,
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: isDarkMode
//                                                   ? Colors.white
//                                                   : Colors.black,
//                                             ),
//                                           ),
//                                           gapW8,
//                                           Text(
//                                             timeago.format(
//                                               widget.article.updatedAt ??
//                                                   DateTime.now(),
//                                             ),
//                                             style: TextStyle(
//                                               color: isDarkMode
//                                                   ? Colors.white
//                                                   : Colors.black,
//                                               fontSize: 12.sp,
//                                               fontFamily: "Merriweather",
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 gapH10,
//
//                                 // Padding(
//                                 //   padding: const EdgeInsets.symmetric(
//                                 //       horizontal: 16.0),
//                                 //   child: Row(
//                                 //     children: [
//                                 //       if (widget.article.authorName == null ||
//                                 //           widget.article.authorName == "")
//                                 //         Container()
//                                 //       else
//                                 //         Text(
//                                 //           "Tap to read more by ${widget.article.authorName}",
//                                 //           style: TextStyle(
//                                 //             color: isDarkMode
//                                 //                 ? Colors.white
//                                 //                 : Colors.black,
//                                 //             fontSize: extrasmallText.sp,
//                                 //             fontFamily: "Merriweather",
//                                 //             fontWeight: FontWeight.w500,
//                                 //           ),
//                                 //         ),
//                                 //       gapW8,
//                                 //       if (widget.article.authorName == null ||
//                                 //           widget.article.verifiedSource == null)
//                                 //         Container()
//                                 //       else
//                                 //         Container(
//                                 //           height: 6,
//                                 //           width: 6,
//                                 //           decoration: BoxDecoration(
//                                 //             shape: BoxShape.circle,
//                                 //             color: isDarkMode
//                                 //                 ? Colors.white
//                                 //                 : Colors.black,
//                                 //           ),
//                                 //         ),
//                                 //       gapW8,
//                                 //       if (widget.article.verifiedSource == null)
//                                 //         Container()
//                                 //       else
//                                 //         Expanded(
//                                 //           child: Text(
//                                 //             "verified by ${widget.article.verifiedSource}",
//                                 //             style: TextStyle(
//                                 //               color: isDarkMode
//                                 //                   ? Colors.white
//                                 //                   : Colors.black,
//                                 //               fontSize: extrasmallText.sp,
//                                 //               fontFamily: "Merriweather",
//                                 //               fontWeight: FontWeight.w500,
//                                 //             ),
//                                 //           ),
//                                 //         ),
//                                 //     ],
//                                 //   ),
//                                 // ),
//                                 // gapH8,
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: MediaQuery.of(context).size.height / 3.7,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 6,
//                     horizontal: 8,
//                   ),
//                   margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     border: Border.all(
//                       width: 2,
//                       color:
//                           !isDarkMode ? Colors.white : const Color(0xFF292524),
//                     ),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Text(
//                     widget.article.ownCategories?.first.name?.capitalize() ??
//                         widget.article.category?.first.name?.capitalize() ??
//                         "",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: extrasmallText.sp,
//                       fontFamily: "Merriweather",
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // InkWell(child: const Spacer()),
//           // Spacer(),
//           // Expanded(
//           //     child: InkWell(
//           //         onTap: () {
//           //           widget.viewModel.performAction(
//           //             widget.article.art ?? "",
//           //             ArticleActions.view.name,
//           //             addBookmarks: true,
//           //           );
//           //           context.pushNamed(
//           //             AppRoute.readingModeView.name,
//           //             pathParameters: {'articleId': widget.article.id ?? ""},
//           //           );
//           //         },
//           //         child: Container())),
//           InkWell(
//             onTap: () {
//               _viewModel.performAction(
//                 widget.article.id ?? "",
//                 ArticleActions.view.name,
//                 addBookmarks: true,
//               );
//               context.pushNamed(
//                 AppRoute.readingModeView.name,
//                 pathParameters: {'articleId': widget.article.id ?? ""},
//               );
//             },
//             child: Visibility(
//               visible: false,
//               child: Stack(
//                 alignment: Alignment.topRight,
//                 children: [
//                   Container(
//                     // margin: const EdgeInsets.symmetric(horizontal: 16),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 16,
//                     ),
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: isDarkMode
//                               ? Colors.white.withOpacity(0.1)
//                               : Colors.black.withOpacity(0.1),
//                           spreadRadius: 2,
//                           offset: const Offset(
//                             5,
//                             6,
//                           ),
//                           blurRadius: 2,
//                         ),
//                       ],
//                       // borderRadius: BorderRadius.circular(16),
//                       color:
//                           !isDarkMode ? Colors.black : const Color(0xFFF7F7F9),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 4),
//                           child: Image.asset(
//                             "assets/images_normal/newspaper.png",
//                             color: !isDarkMode ? Colors.white : Colors.black,
//                             height: 9.h,
//                           ),
//                         ),
//                         gapW8,
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               widget.article.source?.sourceId?.toUpperCase() ??
//                                   "",
//                               style: TextStyle(
//                                 color:
//                                     !isDarkMode ? Colors.white : Colors.black,
//                                 fontSize: extrasmallText.sp,
//                                 fontFamily: "Merriweather",
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             gapH4,
//                             Container(
//                               constraints: BoxConstraints(
//                                 maxWidth:
//                                     MediaQuery.of(context).size.width / 1.7,
//                               ),
//                               child: Text(
//                                 widget.article.link ?? "",
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   color:
//                                       !isDarkMode ? Colors.white : Colors.black,
//                                   fontSize: extrasmallText.sp,
//                                   fontFamily: "Merriweather",
//                                   fontWeight: FontWeight.w200,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       showSource = false;
//                       setState(() {});
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.only(right: 24, top: 8),
//                       padding: const EdgeInsets.all(4),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white.withOpacity(0.2),
//                       ),
//                       child: Icon(
//                         Icons.close,
//                         size: 16,
//                         color: !isDarkMode ? Colors.white : Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // gapH16,
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 23),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     if (_viewModel.articleActionNewList[widget.index].isLiked)
//                       ColorFiltered(
//                         colorFilter: const ColorFilter.mode(
//                           Colors.black, // Change the color here
//                           BlendMode.srcIn,
//                         ),
//                         child: Container(
//                           margin: EdgeInsets.only(bottom: 2),
//                           width: 35,
//                           height: 35,
//                           child: Lottie.asset(
//                             "assets/images_normal/lotiAnimation.json",
//                             repeat: false,
//                           ),
//                         ),
//                       )
//                     else
//                       InkWell(
//                         onTap: () {
//                           AppConstants.isGuest
//                               ? showDialog(
//                                   context: context,
//                                   builder: (context) => showLoginDialog(),
//                                 )
//                               : setState(() {
//                                   _viewModel.performAction(
//                                       widget.article.id ?? "",
//                                       ArticleActions.like.name, callBack: () {
//                                     _viewModel
//                                         .articleActionNewList[widget.index]
//                                         .likes++;
//                                     _viewModel
//                                         .articleActionNewList[widget.index]
//                                         .isLiked = true;
//                                     _viewModel
//                                         .articleActionNewList[widget.index]
//                                         .isDisliked = false;
//                                     if (_viewModel
//                                             .articleActionNewList[widget.index]
//                                             .dislikes !=
//                                         0) {
//                                       _viewModel
//                                           .articleActionNewList[widget.index]
//                                           .dislikes--;
//                                     }
//                                   });
//                                 });
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(right: 5, bottom: 6),
//                           // height: 25,
//                           child: Image.asset(
//                             "assets/images_normal/like.png",
//                             height: 20.h,
//                             color: isDarkMode ? Colors.white : Colors.black,
//                           ),
//                         ),
//                       ),
//                     gapW8,
//                     Text(
//                       _viewModel.articleActionNewList[widget.index].likes
//                           .toString(),
//                       style: TextStyle(
//                         color: const Color(0xFF868686),
//                         fontSize: extrasmallText.sp,
//                         fontFamily: "Merriweather",
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     if (_viewModel
//                         .articleActionNewList[widget.index].isDisliked)
//                       Image.asset(
//                         "assets/images_normal/dislike_filled.png",
//                         height: 20.h,
//                         color: isDarkMode ? Colors.white : Colors.black,
//                       )
//                     else
//                       InkWell(
//                         onTap: () {
//                           AppConstants.isGuest
//                               ? showDialog(
//                                   context: context,
//                                   builder: (context) => showLoginDialog(),
//                                 )
//                               : setState(() {
//                                   _viewModel.performAction(
//                                       widget.article.id ?? "",
//                                       ArticleActions.dislike.name,
//                                       callBack: () {
//                                     if (_viewModel
//                                             .articleActionNewList[widget.index]
//                                             .dislikes !=
//                                         0) {
//                                       // _viewModel
//                                       //     .articleActionNewList[widget.index]
//                                       //     .dislikes++;
//                                     }
//                                     _viewModel
//                                         .articleActionNewList[widget.index]
//                                         .isLiked = false;
//                                     _viewModel
//                                         .articleActionNewList[widget.index]
//                                         .isDisliked = true;
//                                     _viewModel
//                                         .articleActionNewList[widget.index]
//                                         .dislikes++;
//                                     _viewModel
//                                         .articleActionNewList[widget.index]
//                                         .likes--;
//                                   });
//                                 });
//                         },
//                         child: Image.asset(
//                           "assets/images_normal/dislike.png",
//                           height: 20.h,
//                           color: isDarkMode ? Colors.white : Colors.black,
//                         ),
//                       ),
//                     gapW8,
//                     Text(
//                       _viewModel.articleActionNewList[widget.index].dislikes
//                           .toString(),
//                       style: TextStyle(
//                         color: const Color(0xFF868686),
//                         fontSize: extrasmallText.sp,
//                         fontFamily: "Merriweather",
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Share.share(
//                           widget.article.source?.sourceUrl ?? "",
//                           subject: 'Check this news from Unbiasly',
//                         );
//                       },
//                       child: Image.asset(
//                         "assets/images_normal/share.png",
//                         height: 20.h,
//                         color: isDarkMode ? Colors.white : Colors.black,
//                       ),
//                     ),
//                     gapW8,
//                     Text(
//                       "0",
//                       style: TextStyle(
//                         color: const Color(0xFF868686),
//                         fontSize: extrasmallText.sp,
//                         fontFamily: "Merriweather",
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     if (_viewModel
//                         .articleActionNewList[widget.index].isBookmarked)
//                       InkWell(
//                         onTap: () {
//                           AppConstants.isGuest
//                               ? showDialog(
//                                   context: context,
//                                   builder: (context) => showLoginDialog(),
//                                 )
//                               : setState(() {
//                                   _viewModel.performAction(
//                                     widget.article.id ?? "",
//                                     ArticleActions.bookmark.name,
//                                   );
//                                   _viewModel.articleActionNewList[widget.index]
//                                           .isBookmarked =
//                                       !_viewModel
//                                           .articleActionNewList[widget.index]
//                                           .isBookmarked;
//                                   _viewModel.articleActionNewList[widget.index]
//                                       .bookmarks--;
//                                 });
//                         },
//                         child: Image.asset(
//                           "assets/images_normal/save_filled.png",
//                           height: 20.h,
//                           color: isDarkMode ? Colors.white : Colors.black,
//                         ),
//                       )
//                     else
//                       InkWell(
//                         onTap: () {
//                           AppConstants.isGuest
//                               ? showDialog(
//                                   context: context,
//                                   builder: (context) => showLoginDialog(),
//                                 )
//                               : setState(() {
//                                   _viewModel.performAction(
//                                     widget.article.id ?? "",
//                                     ArticleActions.bookmark.name,
//                                   );
//                                   _viewModel.articleActionNewList[widget.index]
//                                           .isBookmarked =
//                                       !_viewModel
//                                           .articleActionNewList[widget.index]
//                                           .isBookmarked;
//                                   _viewModel.articleActionNewList[widget.index]
//                                       .bookmarks++;
//                                 });
//                         },
//                         child: Image.asset(
//                           "assets/images_normal/save.png",
//                           height: 20.h,
//                           color: isDarkMode ? Colors.white : Colors.black,
//                         ),
//                       ),
//
//                     // Image.asset(
//                     //   "assets/images_normal/save.png",
//                     //   height: 20.h,
//                     //   color: isDarkMode ? Colors.white : Colors.black,
//                     // ),
//                     gapW8,
//                     Text(
//                       _viewModel.articleActionNewList[widget.index].bookmarks
//                           .toString(),
//                       style: TextStyle(
//                         color: const Color(0xFF868686),
//                         fontSize: extrasmallText.sp,
//                         fontFamily: "Merriweather",
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 // InkWell(
//                 //   onTap: () {
//                 //     showSource = !showSource;
//                 //     setState(() {});
//                 //   },
//                 //   child: Row(
//                 //     children: [
//                 //       Image.asset(
//                 //         showSource
//                 //             ? "assets/images_normal/new_filled.png"
//                 //             : "assets/images_normal/news.png",
//                 //         height: 20.h,
//                 //         color: isDarkMode ? Colors.white : Colors.black,
//                 //       ),
//                 //       // gapW8,
//                 //       Text(
//                 //         "0",
//                 //         style: TextStyle(
//                 //           color: Colors.transparent,
//                 //           fontSize: extrasmallText.sp,
//                 //           fontFamily: "Merriweather",
//                 //           fontWeight: FontWeight.bold,
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 InkWell(
//                   onTap: () {
//                     final snackdemo = SnackBar(
//                       content: Text(
//                         "${widget.article.verifiedSource}",
//                         style: TextStyle(
//                           color: isDarkMode ? Colors.black : Colors.white,
//                           fontSize: 16,
//                           fontFamily: "Merriweather",
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       backgroundColor: isDarkMode ? Colors.white : Colors.black,
//                       elevation: 10,
//                       behavior: SnackBarBehavior.floating,
//                       margin: EdgeInsets.all(5),
//                     );
//                     ScaffoldMessenger.of(context).showSnackBar(snackdemo);
//
//                     // 'showSnackBar' is deprecated and shouldn't be used.
//                     //Use ScaffoldMessenger.showSnackBar.
//                     // Scaffold.of(context).showSnackBar(snackdemo);
//                     // showDialog(
//                     //   context: context,
//                     //   builder: (context) => AlertDialog(
//                     //     content: Container(
//                     //       height: MediaQuery.of(context).size.height / 3,
//                     //       width: MediaQuery.of(context).size.height / 1.2,
//                     //     ),
//                     //   ),
//                     // );
//                     showSource = !showSource;
//                     setState(() {});
//                   },
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         // showSource
//                         // ? "assets/images_normal/new_filled.png"
//                         // :
//                         "assets/images_normal/news.png",
//                         height: 20.h,
//                         color: isDarkMode ? Colors.white : Colors.black,
//                       ),
//                       // gapW8,
//                       Text(
//                         "0",
//                         style: TextStyle(
//                           color: Colors.transparent,
//                           fontSize: extrasmallText.sp,
//                           fontFamily: "Merriweather",
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                     onTap: () {
//                       showModalBottomSheet(
//                         context: context,
//                         builder: (context) => Container(
//                           padding: const EdgeInsets.only(
//                             left: 16,
//                             right: 16,
//                             bottom: 70,
//                           ),
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(50),
//                               topRight: Radius.circular(50),
//                             ),
//                             color: isDarkMode
//                                 ? const Color(0xFF1A1A16)
//                                 : const Color(0xFFFBFBFB),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               gapH4,
//                               Center(
//                                 child: Container(
//                                   width: 80,
//                                   height: 2,
//                                   decoration: BoxDecoration(
//                                       color: isDarkMode
//                                           ? const Color(0xFF292524)
//                                           : const Color(0xFFE1E1E1)),
//                                 ),
//                               ),
//                               gapH16,
//                               Text(
//                                 Translation.REPORTHEADER,
//                                 style: TextStyle(
//                                   color:
//                                       isDarkMode ? Colors.white : Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: largeText,
//                                 ),
//                               ),
//                               gapH16,
//                               GestureDetector(
//                                 onTap: () async {
//                                   log("-=-=-=-=-=->");
//                                   Uri uri = Uri.parse(
//                                       'mailto:report@unbiasly.ai?subject=Fake Information');
//
//                                   if (!await launcher.launchUrl(uri)) {
//                                     print("Not open uri");
//                                   }
//                                   _viewModel.report(
//                                       context,
//                                       ReportRequest(
//                                           articleId: widget.article.id,
//                                           reason: "Fake Information"));
//                                 },
//                                 child: Text(
//                                   Translation.REPORTONE,
//                                   style: TextStyle(
//                                     color: isDarkMode
//                                         ? Colors.white
//                                         : Colors.black,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: mediumText,
//                                   ),
//                                 ),
//                               ),
//                               gapH16,
//                               GestureDetector(
//                                 onTap: () async {
//                                   Uri uri = Uri.parse(
//                                       'mailto:report@unbiasly.ai?subject=Offensive Content');
//
//                                   if (!await launcher.launchUrl(uri)) {
//                                     print("Not open uri");
//                                   }
//                                   _viewModel.report(
//                                       context,
//                                       ReportRequest(
//                                           articleId: widget.article.id,
//                                           reason: "Offensive Content"));
//                                 },
//                                 child: Text(
//                                   Translation.REPORTTWO,
//                                   style: TextStyle(
//                                     color: isDarkMode
//                                         ? Colors.white
//                                         : Colors.black,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: mediumText,
//                                   ),
//                                 ),
//                               ),
//                               gapH16,
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     child: Icon(
//                       Icons.more_vert,
//                       size: 19.h,
//                       color: isDarkMode ? Colors.white : Colors.black,
//                     )
//                     // Image.asset(
//                     //   "assets/images_normal/menu.png",
//                     //   height: 15.h,
//                     //   color: isDarkMode ? Colors.white : Colors.black,
//                     // ),
//                     ),
//                 // InkWell(
//                 //     onTap: () {
//                 //       showModalBottomSheet(
//                 //         context: context,
//                 //         builder: (context) => Container(
//                 //           padding: const EdgeInsets.only(
//                 //             left: 16,
//                 //             right: 16,
//                 //             bottom: 70,
//                 //           ),
//                 //           width: double.infinity,
//                 //           decoration: BoxDecoration(
//                 //             borderRadius: const BorderRadius.only(
//                 //               topLeft: Radius.circular(50),
//                 //               topRight: Radius.circular(50),
//                 //             ),
//                 //             color: isDarkMode
//                 //                 ? const Color(0xFF1A1A16)
//                 //                 : const Color(0xFFFBFBFB),
//                 //           ),
//                 //           child: Column(
//                 //             crossAxisAlignment: CrossAxisAlignment.start,
//                 //             mainAxisSize: MainAxisSize.min,
//                 //             children: [
//                 //               gapH4,
//                 //               Center(
//                 //                 child: Container(
//                 //                   width: 80,
//                 //                   height: 2,
//                 //                   decoration: BoxDecoration(
//                 //                       color: isDarkMode
//                 //                           ? const Color(0xFF292524)
//                 //                           : const Color(0xFFE1E1E1)),
//                 //                 ),
//                 //               ),
//                 //               gapH16,
//                 //               Text(
//                 //                 Translation.REPORTHEADER,
//                 //                 style: TextStyle(
//                 //                   color:
//                 //                       isDarkMode ? Colors.white : Colors.black,
//                 //                   fontWeight: FontWeight.bold,
//                 //                   fontSize: largeText,
//                 //                 ),
//                 //               ),
//                 //               gapH16,
//                 //               InkWell(
//                 //                 onTap: () {
//                 //                   _viewModel.report(
//                 //                       context,
//                 //                       ReportRequest(
//                 //                           articleId: widget.article.id,
//                 //                           reason: "Fake Information"));
//                 //                 },
//                 //                 child: Text(
//                 //                   Translation.REPORTONE,
//                 //                   style: TextStyle(
//                 //                     color: isDarkMode
//                 //                         ? Colors.white
//                 //                         : Colors.black,
//                 //                     fontWeight: FontWeight.w400,
//                 //                     fontSize: mediumText,
//                 //                   ),
//                 //                 ),
//                 //               ),
//                 //               gapH16,
//                 //               InkWell(
//                 //                 onTap: () {
//                 //                   _viewModel.report(
//                 //                       context,
//                 //                       ReportRequest(
//                 //                           articleId: widget.article.id,
//                 //                           reason: "Offensive Content"));
//                 //                 },
//                 //                 child: Text(
//                 //                   Translation.REPORTTWO,
//                 //                   style: TextStyle(
//                 //                     color: isDarkMode
//                 //                         ? Colors.white
//                 //                         : Colors.black,
//                 //                     fontWeight: FontWeight.w400,
//                 //                     fontSize: mediumText,
//                 //                   ),
//                 //                 ),
//                 //               ),
//                 //               gapH16,
//                 //             ],
//                 //           ),
//                 //         ),
//                 //       );
//                 //     },
//                 //     child: SvgPicture.asset(
//                 //       "assets/images_normal/dot3.svg",
//                 //       height: 15.h,
//                 //       color: isDarkMode ? Colors.white : Colors.black,
//                 //     )
//                 //     // Image.asset(
//                 //     //   "assets/images_normal/menu.png",
//                 //     //   height: 15.h,
//                 //     //   color: isDarkMode ? Colors.white : Colors.black,
//                 //     // ),
//                 //     ),
//               ],
//             ),
//           ),
//           // gapH32,
//         ],
//       ),
//     );
//   }
//
//   // _sendingMails() async {
//   //   var url = Uri.parse("mailto:happynsmavani8182@gmail.com");
//   //   if (await canLaunchUrl(url)) {
//   //     await launchUrl(url);
//   //   } else {
//   //     throw 'Could not launch $url';
//   //   }
//   // }
//
//   @override
//   void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
//     // TODO: implement navigateToScreen
//   }
//
//   @override
//   void showSnackbar(String message, {Color? color}) {
//     // TODO: implement showSnackbar
//   }
//   Widget showLoginDialog() {
//     return AlertDialog(
//       surfaceTintColor: isDarkMode ? const Color(0xFF292524) : Colors.white,
//       backgroundColor: isDarkMode ? const Color(0xFF292524) : Colors.white,
//       title: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: !isDarkMode ? Colors.black : Colors.white,
//               shape: BoxShape.circle,
//             ),
//             child: Image.asset(
//               "assets/profile_icons/logout.png",
//               color: isDarkMode ? Colors.black : Colors.white,
//               height: 18.h,
//             ),
//           ),
//           gapH8,
//           Text(
//             Translation.SIGNINDIALOGTITLE,
//             style: TextStyle(
//               color: !isDarkMode ? Colors.black : Colors.white,
//               fontSize: smallText.h,
//               fontFamily: "Merriweather",
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           gapH4,
//           Text(
//             Translation.SIGNINDIALOGSUBTITLE,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: const Color(0xFF868686),
//               fontSize: smallText.h,
//               fontFamily: "Merriweather",
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           gapH16,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                 onTap: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 2 - 70,
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(
//                       color: isDarkMode ? Colors.white : Colors.black,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       Translation.CANCEL,
//                       style: TextStyle(
//                         color: isDarkMode ? Colors.white : Colors.black,
//                         fontSize: smallText.h,
//                         fontFamily: "Merriweather",
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   SharedPreferenceService.clearAll();
//                   context.setLocale(const Locale("en"));
//                   AppConstants.language = "en";
//                   setState(() {});
//                   context.pushReplacementNamed(AppRoute.splash.name);
//                   // Navigator.of(context).pushAndRemoveUntil(
//                   //   MaterialPageRoute(
//                   //     builder: (context) => const SplashView(),
//                   //   ),
//                   //   (route) => false,
//                   // );
//                 },
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 2 - 70,
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: isDarkMode ? Colors.white : Colors.black,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Center(
//                     child: Text(
//                       Translation.SIGNIN,
//                       style: TextStyle(
//                         color: !isDarkMode ? Colors.white : Colors.black,
//                         fontSize: smallText.h,
//                         fontFamily: "Merriweather",
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
