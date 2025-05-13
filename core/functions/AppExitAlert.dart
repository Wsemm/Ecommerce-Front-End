import 'dart:io';
import '../constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      backgroundColor: Color.fromARGB(255, 211, 209, 209),
      title: "Warning".tr,
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      middleText: "do you want to exit the app?".tr,
      middleTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      actions: [
        MaterialButton(
            color: Colors.red,
            onPressed: () {
              exit(0);
            },
            child: Text(
              "yes".tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
        MaterialButton(
            color: AppColor.primaryColor,
            onPressed: () {
              Get.back();
            },
            child: Text(
              "no".tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ))
      ]);
  return Future.value(true);
}
