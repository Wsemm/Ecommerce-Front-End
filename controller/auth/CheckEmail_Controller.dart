import '../../core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  CheckEmail();
  goToVerifiyCodeSignUp();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;

  @override
  CheckEmail() {}

  goToVerifiyCodeSignUp() {
    Get.offNamed(AppRoute.verfiyCodeSignUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
