import '../../../controller/OnBoading_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/DataSource/static/static.dart';

class CustomDotControllerOnBoading extends StatelessWidget {
  const CustomDotControllerOnBoading({super.key});

  @override
  Widget build(BuildContext context) {
    double Screen_Height = MediaQuery.of(context).size.height;
    double Screen_Width = MediaQuery.of(context).size.width;
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoadingList.length,
                    (index) => AnimatedContainer(
                        margin: EdgeInsets.only(right: Screen_Width * 0.013),
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        width: controller.currentPage == index
                            ? Screen_Width * 0.05
                            : Screen_Width * 0.02,
                        height: controller.currentPage == index
                            ? Screen_Height * 0.012
                            : Screen_Height * 0.01,
                        duration: Duration(milliseconds: 450))),
              ],
            ));
  }
}
