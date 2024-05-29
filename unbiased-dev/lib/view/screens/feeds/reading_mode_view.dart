import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:unbiased/core/constants.dart';
import 'package:unbiased/data/feed/models/article_by_id_model.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/feeds/feed_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReadingModeView extends ConsumerStatefulWidget {
  final String articleId;
  const ReadingModeView({super.key, required this.articleId});

  @override
  ConsumerState<ReadingModeView> createState() => _ReadingModeViewState();
}

class _ReadingModeViewState extends ConsumerState<ReadingModeView>
    with BaseScreenView {
  bool isDarkMode = false;
  String getfileName = "";
  bool isWebView = true;
  late FeedViewModel _viewModel;
  WebViewController? _controller;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _viewModel = ref.read(feedViewModel);
    _viewModel.attachView(this);
    Future.delayed(const Duration(milliseconds: 200)).then((value) async {
      // _viewModel.toggleLoading();
      // await _viewModel.getArticleById(widget.articleId);
      // if (AppConstants.isGuest == false) {
      //   await _viewModel.getFeedActions();
      // }
      // setState(() {});
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                return NavigationDecision.navigate;
              }),
        )
        ..loadRequest(Uri.parse(widget.articleId));
      print(widget.articleId.toString());
      // _viewModel.toggleLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(feedViewModel);
    Widget spinkit = SpinKitFadingFour(
      color: isDarkMode ? Colors.white : Colors.black,
      size: 50.0,
    );
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    getfileName = "images_dark";
    return Scaffold(
      backgroundColor:
          !isDarkMode ? const Color(0xFFf7f7f9) : Color(0xFF1A1A16),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration:
                BoxDecoration(color: isDarkMode ? Colors.black : Colors.white),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 20),
              child: Column(
                children: [
                  // Row(
                  //   // mai
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //       decoration: BoxDecoration(
                  //           color: Color(0xFFF7F7F9),
                  //           borderRadius: BorderRadius.circular(16)),
                  //       margin: EdgeInsets.fromLTRB(16, 8, 0, 0),
                  //       child: Row(
                  //         children: [
                  //           Text(
                  //             "Reading Mode",
                  //             style: TextStyle(
                  //                 fontSize: 12,
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //           gapW4,
                  //           SizedBox(
                  //             width: 27.h,
                  //             height: 14.h,
                  //             child: FittedBox(
                  //               fit: BoxFit.fill,
                  //               child: Switch(
                  //                 splashRadius: 0,
                  //                 materialTapTargetSize:
                  //                     MaterialTapTargetSize.shrinkWrap,
                  //                 activeTrackColor: Colors.black,
                  //                 activeColor: Colors.white,
                  //                 value: isWebView,
                  //                 onChanged: (val) {
                  //                   isWebView = val;
                  //                   setState(() {});
                  //                   // ref.read(themeProvider).toggleThemeMode();
                  //                 },
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: Image.asset(
                          "assets/$getfileName/arrow.png",
                          height: 30.h,
                        ),
                      ),
                      gapW10,
                      Text(
                        _viewModel.articleByIdResponse?.source?.sourceId ?? "",
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: mediumText.sp,
                          fontFamily: "Century",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (_controller == null)
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: spinkit,
                    ),
                  ],
                ),
              ),
            )
          else
            // _viewModel.articleByIdResponse == null
            //     ? Container()
            //     : !isWebView
            // ?
            Expanded(child: WebViewWidget(controller: _controller!))
          // : newsCard(context, _viewModel.articleByIdResponse!)
        ],
      ),
    );
  }

  Widget newsCard(BuildContext context, ArticleByIdResponse article) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    final imageProvider =
                        Image.network(article.thumbnailUrl ?? "").image;
                    showImageViewer(context, imageProvider,
                        onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: CachedNetworkImage(
                    imageUrl: article.thumbnailUrl ?? "",
                    imageBuilder: (context, imageProvider) => Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3.7,
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: imageProvider,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
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
                            article.ownCategories?.first.name?.capitalize() ??
                                "",
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
                                      "assets/$getfileName/place_holder.png")
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
                              vertical: 6, horizontal: 8),
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
                            article.ownCategories?.first.name?.capitalize() ??
                                "",
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

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      article.title ?? "",
                      // maxLines: 2,
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: mediumText.sp,
                        fontFamily: "Century",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                gapH8,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    article.body ?? "",
                    // maxLines: 12,
                    // softWrap: true,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: smallText.sp,
                      fontFamily: "Century",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                gapH8,

                // Container(
                //   height: MediaQuery.of(context).size.height / 1.2 -
                //       MediaQuery.of(context).size.height / 3.2 -
                //       5,
                //   color: Colors.yellow,
                // )

                // gapH8
              ],
            ),
            gapH16,
          ],
        ),
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

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
