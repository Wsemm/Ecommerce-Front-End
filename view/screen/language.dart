import '../../core/constant/routs.dart';
import '../widget/language/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/changeLocal_controller.dart';

class language extends GetView<LocaleController> {
  const language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Chose your language".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            CustomButtonLnag(
                textbutton: "Ar",
                onPressed: () {
                  controller.changeLang("ar");
                  Get.toNamed(AppRoute.onBoarding);
                }),
            CustomButtonLnag(
                textbutton: "En",
                onPressed: () {
                  controller.changeLang("en");
                  Get.toNamed(AppRoute.onBoarding);
                }),
          ],
        ),
      ),
    );
  }
}
