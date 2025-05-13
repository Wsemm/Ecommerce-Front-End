import '../../../core/class/handlingDataView.dart';
import '../../../core/class/statusRequest.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/CustomOtpTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/VerifiyCodeSignUp_Controller.dart';
import '../../../controller/auth/login_controller.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    LoginControllerImp LoginController = Get.put(LoginControllerImp());

    double Screen_Height = MediaQuery.of(context).size.height;
    double Screen_Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Verification Code".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => handlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: Screen_Width * 0.035),
                child: ListView(
                  children: [
                    Text(
                      "Check Code".tr,
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Screen_Width * 0.075),
                      child: Text(
                        "Enter the Code you recived ${LoginController.email.text}"
                            .tr,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: Screen_Height * 0.02,
                    ),
                    CustomOtpTextField(onSubmit: (String verificationCode) {
                      controller.goTosuccessSignUp(verificationCode);
                    }),
                    SizedBox(
                      height: Screen_Height * 0.02,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        controller.resend();
                      },
                      child: const Center(
                        child: Text(
                          "Resend Code",
                          style: TextStyle(
                              color: AppColor.primaryColor, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
