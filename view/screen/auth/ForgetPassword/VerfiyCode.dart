import '../../../../controller/ForgetPassword/VerifiyCode_Controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/CustomButtonAuth.dart';
import '../../../widget/auth/CustomOtpTextField.dart';
import '../../../widget/auth/CustomTextFormField.dart';
import '../../../widget/auth/logoAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/ForgetPassword/ForgetPassword_controller.dart';
import '../../../../controller/auth/SignUp_controller.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
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
      body: Container(
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
              padding: EdgeInsets.symmetric(horizontal: Screen_Width * 0.075),
              child: Text(
                "Enter the Code you recived".tr,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Screen_Height * 0.02,
            ),
            CustomOtpTextField(onSubmit: (String VerificationCode) {
              controller.goToResetPassword(VerificationCode);
            }),
            SizedBox(
              height: Screen_Height * 0.02,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
