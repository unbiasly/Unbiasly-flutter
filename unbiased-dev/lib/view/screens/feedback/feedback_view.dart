// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
import 'package:unbiased/core/translation.dart';
import 'package:unbiased/data/auth/models/feedback_model.dart';
import 'package:unbiased/utils/utils.dart';
import 'package:unbiased/view/screens/auth/auth_view_model.dart';

class FeedbackView extends ConsumerStatefulWidget {
  const FeedbackView({super.key});

  @override
  ConsumerState<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends ConsumerState<FeedbackView>
    with BaseScreenView {
  bool isDarkMode = false;
  String getfileName = "";
  late AuthViewModel _viewModel;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
  }

  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(authViewModel);
    isDarkMode = Theme.of(context).brightness == Brightness.dark ? true : false;
    getfileName = Theme.of(context).brightness != Brightness.dark
        ? "images_light"
        : "images_dark";
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              _viewModel.addFeedback(
                  FeedBackRequest(
                      title: _titleController.text,
                      description: _descriptionController.text),
                  context);
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
            }
            // navigateToScreen(AppRoute.chooseInterestView);
          },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            child: Text(
              Translation.SUBMITFEEDBACK,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: !isDarkMode ? Colors.white : Colors.black,
                fontSize: buttonText.sp,
                fontFamily: "Century",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        backgroundColor:
            !isDarkMode ? const Color(0xFFf7f7f9) : const Color(0xFF1A1A16),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        Translation.FEEDBACKPROFILE,
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
                gapH16,
                gapH8,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          Translation.TITLE,
                          style: TextStyle(
                            color: Color(0xFF868686),
                            fontSize: smallText.sp,
                            fontFamily: "Century",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      gapH8,
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Title is Required';
                          }
                          return null;
                        },
                        controller: _titleController,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 16, top: 8, bottom: 8),
                          fillColor: isDarkMode
                              ? const Color(0xFF292524)
                              : Colors.white,
                          filled: true,
                          // prefixIcon: const Icon(Icons.search),
                          // prefixIconColor: const Color(0xFF868686),
                          hintText: "Enter Title",
                          hintStyle: TextStyle(
                            color: const Color(0xFF868686),
                            fontSize: smallText.sp,
                            fontFamily: "Century",
                            fontWeight: FontWeight.w200,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                      gapH16,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          Translation.DESCRIPTION,
                          style: TextStyle(
                            color: Color(0xFF868686),
                            fontSize: smallText.sp,
                            fontFamily: "Century",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      gapH8,
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 16, top: 8, bottom: 8),
                          fillColor: isDarkMode
                              ? const Color(0xFF292524)
                              : Colors.white,
                          filled: true,

                          // prefixIcon: const Icon(Icons.search),
                          // prefixIconColor: const Color(0xFF868686),
                          hintText: "Enter Description",
                          hintStyle: TextStyle(
                            color: const Color(0xFF868686),
                            fontSize: smallText.sp,
                            fontFamily: "Century",
                            fontWeight: FontWeight.w200,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
         
          ),
        ),
      ),
    );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    // TODO: implement navigateToScreen
    context.pop();
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message.toString()),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // TODO: implement showSnackbar
  }
  // TODO: implement showSnackbar
}
