import '../../../../core/constant/color.dart';
import '../../../widget/auth/CustomButtonAuth.dart';
import '../../../widget/auth/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/CheckEmail_Controller.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
    double Screen_Height = MediaQuery.of(context).size.height;
    double Screen_Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Check Email".tr,
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
              "Welcome".tr,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Screen_Width * 0.075),
              child: Text(
                "Enter your Email to send create account code for you".tr,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Screen_Height * 0.02,
            ),
            CustomTextFormField(
              valid: (val) {},
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
                  controller.goToVerifiyCodeSignUp();
                }),
            SizedBox(
              height: Screen_Height * 0.008,
            ),
          ],
        ),
      ),
    );
  }
}
