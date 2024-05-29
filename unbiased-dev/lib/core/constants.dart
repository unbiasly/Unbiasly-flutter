class AppConstants {
  static const userIdPref = 'userId';
  static const languagePref = 'languagePref';
  static const authTokenPref = 'authTokenPref';
  static List<String> selectedIndexCategory = [];
  static List<String> prefilledCategory = [
    "65f85734a080bdc947d1544f",
    "6605e5fc6d8daba2e2aa29ee",
    "6605e5d66d8daba2e2aa29d3"
  ];
  static List<String> selectedIndexSources = [];
  static const selectedIndexCategoryPref = 'selectedIndexCategoryPref';
  static const selectedIndexSourcesPref = 'selectedIndexSourcesPref';
  static String language = '';
  static String fcmToken = '';

  static bool isGuest = false;

  static const isGuestPref = 'guestPref';

  static const isOnboardingViewed = 'onboardingViewed';
  static const String baseUrl = "http://65.1.134.57:3000/v1";
  // static const String baseUrl = "http://192.168.0.107:3001/v1";
  static String userId = "";
  static String token = "";
  static const String noProfileImg =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
  static const String noboximglink =
      "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg";

  static const String entertainment = "entertainment";
  static const String privacy =
      "https://docs.google.com/document/d/1Xal4FScKhZXLwyQQ2msEnflQC7l8NxaHyC5niCU9Y6Y";
  static const String terms =
      "https://docs.google.com/document/d/1AyyLOFDupdu0Poswi73HJC_Ii3jWOU-xk9uOkl1WEiY";

  static const List<String> chipNames = ["Google", "Apple", "Facebook"];
  static const List<String> chipIcons = [
    "assets/icons/google.png",
    "assets/icons/apple.png",
    "assets/icons/facebook.png",
  ];
  //api end points
}

enum ArticleActions { like, dislike, bookmark, view, share }
