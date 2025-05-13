import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Home_Controller.dart';
import '../../../core/constant/color.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  const CustomCardHome({super.key, required this.title, required this.body});
  final String title, body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            height: Get.height * 0.19,
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                body,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: controller.lang == "en" ? -20 : null,
            left: controller.lang == "ar" ? -20 : null,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(160)),
              height: Get.height * 0.20,
              width: Get.width * 0.41,
            ),
          )
        ],
      ),
    );
  }
}
