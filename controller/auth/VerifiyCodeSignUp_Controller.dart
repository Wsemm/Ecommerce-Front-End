import '../../core/constant/routs.dart';

import 'package:get/get.dart';
import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData_controller.dart';
import '../../data/DataSource/remote/Auth/verifyCodeSignUpData.dart';
import 'login_controller.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  CheckCode();
  goTosuccessSignUp(String verifyCodeSingup);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  LoginControllerImp controller = Get.put(LoginControllerImp());
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  CheckCode() {}
  goTosuccessSignUp(verifyCodeSingup) async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await verifyCodeSignUpData.postData(email!, verifyCodeSingup);
    // var response = await verifyCodeSignUpData.resendData(email!);
    // var response =
    //     await verifyCodeSignUpData.postData(controller.email.text, verifyCodeSingup);

    print(
        "=============================== Controller ${controller.email.text} ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "Warning".tr,
            middleText: "Incorrect code please reensure from your code".tr);
        statusRequest = StatusRequest.serverExciption;
      }
    }
    update();
  }

  resend() {
    verifyCodeSignUpData.resendData(controller.email.text);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
