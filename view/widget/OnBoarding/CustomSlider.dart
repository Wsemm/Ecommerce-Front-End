import '../../../controller/OnBoading_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/DataSource/static/static.dart';
import '../../../core/constant/color.dart';

class CustomSliderOnBoading extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoading({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoadingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Image.asset(
            onBoadingList[i].image!,
            width: Get.width * 0.60,
            height: Get.height * 0.37,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            onBoadingList[i].title!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          SizedBox(
            height: Get.height * 0.2,
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                onBoadingList[i].body!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 2,
                    color: AppColor.grey),
              )),
        ],
      ),
    );
  }
}
