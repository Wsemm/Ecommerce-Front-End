import '../services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnEn, columnAr) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "en") {
    return columnEn;
  } else {
    return columnAr;
  }
}
