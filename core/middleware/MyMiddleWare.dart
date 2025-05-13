import '../constant/routs.dart';
import '../services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  int? get priority => 1;

  MyServices myServices = Get.find();

  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.homePage);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
    if (myServices.sharedPreferences.getString("step") == "3") {
      return const RouteSettings(name: AppRoute.homePageDelivery);
    }
    if (myServices.sharedPreferences.getString("step") == "4") {
      return const RouteSettings(name: AppRoute.homePageAdmin);
    }
  }
}
