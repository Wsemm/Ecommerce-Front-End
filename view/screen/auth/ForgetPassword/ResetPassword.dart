import '../../../../core/class/statusRequest.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/CustomButtonAuth.dart';
import '../../../widget/auth/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/ForgetPassword/ResetPassword_Controller.dart';
import '../../../../core/class/handlingDataView.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
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
        body: handlingDataRequest(
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
                        "Enter your New password".tr,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: Screen_Height * 0.02,
                    ),
                    CustomTextFormField(
                      valid: (val) {},
                      label: "Password".tr,
                      hinttext: "Enter your password".tr,
                      iconData: Icons.email_outlined,
                      myController: controller.password,
                    ),
                    SizedBox(
                      height: Screen_Height * 0.02,
                    ),
                    CustomTextFormField(
                      valid: (val) {},
                      label: "Password".tr,
                      hinttext: "Re Enter your password".tr,
                      iconData: Icons.email_outlined,
                      myController: controller.repassword,
                    ),
                    SizedBox(
                      height: Screen_Height * 0.02,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonAuth(
                        title: "save".tr,
                        onPressed: () {
                          controller.resetpassword();
                        }),
                    SizedBox(
                      height: Screen_Height * 0.008,
                    ),
                  ],
                ),
              ),
            )));
  }
}
