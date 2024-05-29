// import 'package:firebase_core/firebase_core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:unbiased/app.dart';
import 'package:unbiased/core/constants.dart';
import 'package:unbiased/domain/providers/firebase_messaging_provider.dart';
import 'package:unbiased/helpers/locator.dart';
import 'package:unbiased/services/shared_preference_service.dart';
import 'package:unbiased/utils/utils.dart';

enum EnvType {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
}

class Environment {
  Environment() {
    // value = this;
    _init();
  }

  Future<void> _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await EasyLocalization.ensureInitialized();

    // await FirebaseMessagingProvider.init();
    final String? token = await FirebaseMessaging.instance.getToken();
    AppConstants.fcmToken = token ?? "";
    print(AppConstants.fcmToken);
    await SharedPreferenceService.init();
    await FirebaseMessagingProvider.setupFirebaseConfig();

    try {
      setupServiceLocator();
      // await dotenv.load();
    } catch (e) {
      Logger.write(e.toString());
    }
    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('hi')],
        path: 'assets/languages',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en', 'EN'),
        child: const ProviderScope(
          child: MyApp(),
        ),
      ),
    );
  }
}
