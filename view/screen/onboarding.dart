import '../../controller/OnBoading_Controller.dart';
import '../../core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/OnBoarding/CustomButtom.dart';
import '../widget/OnBoarding/CustomSlider.dart';
import '../widget/OnBoarding/CustomDotController.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    // Color bgColor = Colors.red;
    // if (/* Condition 1 */) {
    //   bgColor = Colors.red;
    // } else if (/* Condition 2 */) {
    //   bgColor = Colors.blue;
    // } else if (/* Condition 3 */) {
    //   bgColor = Colors.green;
    // } else {
    //   bgColor = Colors.yellow;
    // }
    double Screen_Height = MediaQuery.of(context).size.height;
    double Screen_Width = MediaQuery.of(context).size.width;
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: CustomSliderOnBoading(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: Screen_Height * 0.05,
                    ),
                    const CustomDotControllerOnBoading(),
                    const CustomButtomOnBoading()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
