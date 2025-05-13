import '../../core/class/statusRequest.dart';
import '../../core/constant/routs.dart';
import '../../data/DataSource/remote/Auth/Login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/fcmConfig.dart';
import '../../core/functions/handlingData_controller.dart';
import '../../core/localization/changeLocal_controller.dart';
import '../../core/services/services.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  final _firebaseMessaging = FirebaseMessaging.instance;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email, password;
  bool isShowPassword = true;
  MyServices myServices = Get.find();
  LocaleController localcontroller = Get.put(LocaleController());
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  changelang() {
    localcontroller.changeLang(
        myServices.sharedPreferences.getString("lang") == "ar" ? "en" : "ar");
  }

  @override
  login() async {
    String? deviceToken = await _firebaseMessaging.getToken();

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await loginData.postData(email.text, password.text, deviceToken!);
      print("=============================== Controller ${response} ");
      statusRequest = handlingData(response);
      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['user_approve'] == 1) {
            myServices.sharedPreferences
                .setString("id", response['data']['user_id'].toString());
            myServices.sharedPreferences
                .setString("username", response['data']['user_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['user_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['user_phone']);
            myServices.sharedPreferences.setString("step", "2");
            Get.toNamed(AppRoute.homePage);
            myServices.sharedPreferences
                .setString("token", "${deviceToken}".toString());
            subscribeToTopic("users");
          } else {
            Get.toNamed(AppRoute.verfiyCodeSignUp,
                arguments: {"email": email.text});
          }
        }

        if (response['status'] == "failure") {
          // Get.defaultDialog(
          //     title: "Warning".tr, middleText: "email or password not Correct".tr);
          // statusRequest = StatusRequest.failuer;
        }
      }
      update();
    } else {}
  }

  goToSignUp() {
    Get.offNamed(AppRoute.singUp);
  }

  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    // email.dispose();
    // password.dispose();
    super.dispose();
  }
}
