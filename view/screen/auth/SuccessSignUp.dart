import '../../../core/constant/color.dart';
import '../../../core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/CustomButtonAuth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Success".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              const Center(
                child: Icon(
                  Icons.check_circle_outline,
                  size: 200,
                  color: AppColor.primaryColor,
                ),
              ),
              Text("Your Account has been created successfully".tr),
              const Icon(
                Icons.check_circle_outlined,
                color: Colors.green,
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                child: CustomButtonAuth(
                    title: "Login".tr,
                    onPressed: () {
                      Get.offAllNamed(AppRoute.login);
                    }),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          )),
    );
  }
}
