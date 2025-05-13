import '../../core/constant/routs.dart';
import '../../data/DataSource/remote/forgetPassword/resetPassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData_controller.dart';
import 'ForgetPassword_controller.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password, repassword;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  ForgetPasswordControllerImp controller =
      Get.put(ForgetPasswordControllerImp());

  @override
  resetpassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "warning".tr, middleText: "passwords don't match".tr);
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(
          controller.email.text, password.text);

      print(
          "=========================================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.login);
        } else {
          Get.defaultDialog(
              title: "Warning".tr, middleText: "try another password".tr);
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
    } else {}
  }

  goToSuccessResetPassword() {
    Get.offNamed(AppRoute.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
