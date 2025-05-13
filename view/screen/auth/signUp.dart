import '../../../core/class/handlingDataView.dart';
import '../../../core/class/statusRequest.dart';
import '../../../core/functions/AppExitAlert.dart';
import '../../../core/functions/ValidInput.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/CustomButtonAuth.dart';
import '../../widget/auth/CustomTextFormField.dart';
import '../../widget/auth/logoAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/SignUp_controller.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());
    double Screen_Height = MediaQuery.of(context).size.height;
    double Screen_Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Sign Up".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => handlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 30, vertical: Screen_Width * 0.035),
                  child: Form(
                    key: controller.formstate,
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
                            "Sign In with Your Email And Password Or Continue With Social Media"
                                .tr,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: Screen_Height * 0.02,
                        ),
                        CustomTextFormField(
                            keyboardType: TextInputType.name,
                            valid: (val) {
                              return ValidInput(val!, 3, 20, "username");
                            },
                            label: "Username".tr,
                            hinttext: "Enter your name".tr,
                            iconData: Icons.person,
                            myController: controller.username),
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
                        CustomTextFormField(
                            keyboardType: TextInputType.phone,
                            valid: (val) {
                              return ValidInput(val!, 5, 10, "phone");
                            },
                            label: "phone".tr,
                            hinttext: "Enter your phone number".tr,
                            iconData: Icons.phone,
                            myController: controller.phone),
                        SizedBox(
                          height: Screen_Height * 0.02,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          valid: (val) {
                            return ValidInput(val!, 5, 20, "password");
                          },
                          label: "Password".tr,
                          hinttext: "Enter your password".tr,
                          iconData: Icons.lock,
                          myController: controller.password,
                        ),
                        SizedBox(
                          height: Screen_Height * 0.2,
                        ),
                        CustomButtonAuth(
                            title: "Sign Up".tr,
                            onPressed: () {
                              controller.SignUp();
                            }),
                        SizedBox(
                          height: Screen_Height * 0.008,
                        ),
                        Row(
                          children: [
                            Text("already have account ? ".tr),
                            InkWell(
                              child: Text(
                                "Login".tr,
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                controller.goToLogIn();
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
