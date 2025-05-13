import '../core/constant/routs.dart';
import '../core/services/services.dart';
import 'package:get/get.dart';

import '../data/DataSource/remote/test_data.dart';

class SettingsController extends GetxController {
  TestData testData = Get.put(TestData(Get.find()));
  MyServices myServices = Get.find();
  logout() {
    myServices.sharedPreferences.setString("step", "0");
    Get.offAllNamed(AppRoute.login);
  }

  gotoAddress() {
    Get.toNamed(AppRoute.addressView);
  }
}
