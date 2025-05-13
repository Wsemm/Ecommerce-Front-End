import 'package:get/get.dart';

ValidInput(String val, int min, max, String type) {
  if (val.isEmpty) {
    return "the value can't be Empety".tr;
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not vaild username".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not vaild email".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not vaild phone".tr;
    }
  }

  if (val.length < min) {
    return "the value can't be less than $min".tr;
  }
  if (val.length > max) {
    return "the value can't be more than $max".tr;
  }
}
