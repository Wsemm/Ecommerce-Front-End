import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingDataView.dart';
import '../../../core/class/statusRequest.dart';
import '../../../core/functions/AppExitAlert.dart';
import '../../../core/functions/ValidInput.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/handlingData_controller.dart';
import '../../widget/auth/CustomButtonAuth.dart';
import '../../widget/auth/CustomTextFormField.dart';
import '../../widget/auth/Custom_InkWell.dart';
import '../../widget/auth/logoAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());

    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              controller.changelang();
            },
            child: Text("change lang".tr),
          )
        ],
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Sign In".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
            builder: (controller) => handlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 30, vertical: Get.width * 0.035),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        const logoAuth(),
                        Text(
                          "Welcome".tr,
                          style: Theme.of(context).textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.075),
                          child: Text(
                            "Sign In with Your Email And Password Or Continue With Social Media"
                                .tr,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
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
                        const SizedBox(
                          height: 25,
                        ),
                        GetBuilder<LoginControllerImp>(
                            builder: (controller) => CustomTextFormField(
                                  obsecure: controller.isShowPassword,
                                  onPressedIcon: () {
                                    controller.showPassword();
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  valid: (val) {
                                    return ValidInput(val!, 5, 25, "password");
                                  },
                                  label: "Password".tr,
                                  hinttext: "Enter your password".tr,
                                  iconData: Icons.lock,
                                  myController: controller.password,
                                )),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          child: Text(
                            "Forget Password".tr,
                            textAlign: TextAlign.end,
                          ),
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButtonAuth(
                            title: "Login".tr,
                            onPressed: () {
                              controller.login();
                            }),
                        SizedBox(
                          height: Get.height * 0.008,
                        ),
                        Row(
                          children: [
                            Text("Dont have account yet? ".tr),
                            Custom_InkWell(
                                title: "Sign Up".tr,
                                color: AppColor.primaryColor,
                                onTap: () {
                                  controller.goToSignUp();
                                }),
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
