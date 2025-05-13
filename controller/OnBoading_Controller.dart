import '../core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';
import '../data/DataSource/static/static.dart';

abstract class OnBoadingController extends GetxController {
  next();

  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoadingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myServices = Get.find();

  @override
  next() {
    ++currentPage;
    if (currentPage > onBoadingList.length - 1) {
      Get.offAllNamed(AppRoute.login);
      myServices.sharedPreferences.setString("step", "1");
    } else {
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 450), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
