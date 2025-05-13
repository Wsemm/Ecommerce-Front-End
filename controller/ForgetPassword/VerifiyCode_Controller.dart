import '../../core/constant/routs.dart';
import '../../data/DataSource/remote/forgetPassword/verifyCode.dart';
import 'package:get/get.dart';
import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData_controller.dart';
import 'ForgetPassword_controller.dart';

abstract class VerifyCodeController extends GetxController {
  CheckCode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  ForgetPasswordControllerImp controller =
      Get.put(ForgetPasswordControllerImp());

  StatusRequest? statusRequest;

  @override
  CheckCode() {}
  goToResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    // var response =
    //     await verifyCodeForgetPasswordData.postData(email!, verifycode);

    var response = await verifyCodeForgetPasswordData.postData(
        controller.email.text, verifycode);

    print("=============================== Controller ${response} ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.toNamed(AppRoute.resetPassword);
      } else {
        Get.defaultDialog(
            title: "Warning".tr,
            middleText: "Incorrect code please reensure from your code".tr);
        statusRequest = StatusRequest.serverExciption;
      }
    }
    update();
  }

  goToSuccessSingUp() {
    Get.offAllNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    // email = Get.arguments["email"];
    super.onInit();
  }
}
