import '../../core/class/statusRequest.dart';
import '../../core/constant/routs.dart';
import '../../data/DataSource/remote/Auth/SignUp.dart';
import '../../view/screen/auth/signUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingData_controller.dart';

abstract class SignUpController extends GetxController {
  SignUp();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email, password, username, phone;
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  SignUpData signUpData = SignUpData(Get.find());
  List data = [];

  @override
  SignUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          username.text, password.text, email.text, phone.text);
      // print("=============================== Controller ${response} ");
      statusRequest = handlingData(response);
      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == 'success') {
          // data.addAll(response['data']);
          Get.toNamed(AppRoute.verfiyCodeSignUp,
              arguments: {'email': email.text});
        } else {
          Get.defaultDialog(
              title: "Warning".tr,
              middleText: "phone number OR Email Already exists".tr);
          statusRequest = StatusRequest.serverExciption;
        }
      }
      update();
    } else {}
  }

  goToLogIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
