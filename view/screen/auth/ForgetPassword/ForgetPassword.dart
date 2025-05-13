import '../../../../core/class/handlingDataView.dart';
import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/CustomButtonAuth.dart';
import '../../../widget/auth/CustomTextFormField.dart';
import '../../../widget/auth/logoAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/ForgetPassword/ForgetPassword_controller.dart';
import '../../../../controller/auth/SignUp_controller.dart';
import '../../../../core/functions/ValidInput.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    double Screen_Height = MediaQuery.of(context).size.height;
    double Screen_Width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Reset Password".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => handlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Form(
                key: controller.formstate,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 30, vertical: Screen_Width * 0.035),
                  child: ListView(
                    children: [
                      Text(
                        "Welcome".tr,
                        style: Theme.of(context).textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Screen_Width * 0.075),
                        child: Text(
                          "Enter your Email to send reset password code for you"
                              .tr,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: Screen_Height * 0.02,
                      ),
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        valid: (val) {
                          return ValidInput(val!, 5, 20, "email");
                        },
                        label: "Email".tr,
                        hinttext: "Enter your Email".tr,
                        iconData: Icons.email_outlined,
                        myController: controller.email,
                      ),
                      SizedBox(
                        height: Screen_Height * 0.02,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtonAuth(
                          title: "Send the code".tr,
                          onPressed: () {
                            controller.CheckEmail();
                          }),
                      SizedBox(
                        height: Screen_Height * 0.008,
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
