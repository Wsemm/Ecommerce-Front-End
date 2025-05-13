import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/OnBoading_Controller.dart';
import '../../../core/constant/color.dart';

class CustomButtomOnBoading extends GetView<OnBoardingControllerImp> {
  const CustomButtomOnBoading({super.key});

  @override
  Widget build(BuildContext context) {
    double Screen_Height = MediaQuery.of(context).size.height;
    double Screen_Width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: Screen_Height * 0.05),
      width: Screen_Width * 0.75,
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        child: Text("Continue".tr),
        color: AppColor.primaryColor,
        textColor: Colors.white,
      ),
    );
  }
}
