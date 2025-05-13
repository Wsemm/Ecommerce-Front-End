import 'core/localization/translation.dart';
import 'test.dart';
import 'view/screen/language.dart';
import 'view/screen/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/initialBindings.dart';
import 'core/constant/color.dart';
import 'core/localization/changeLocal_controller.dart';
import 'core/services/services.dart';
import 'firebase.dart';
import 'firebase_options.dart';
import 'routs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initialservices();
  await FirebaseNotifications().initNotifications();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      // home: const test(),
      getPages: getPages,
    );
  }
}
