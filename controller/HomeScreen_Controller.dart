import 'orders/Order_Controller.dart';

import '../view/screen/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/offers.dart';
import '../view/screen/orders/my_order.dart';
import '../view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  MyOrder_Controller controller = Get.put(MyOrder_Controller());

  // List titlelButtonAppBar=[

  //   "home",
  //   "Setting",
  //   "favorite",
  //   "profile"
  // ];

  // List <IconData> iconButtonAppBar=[
  //   Icons.home,
  //   Icons.settings,
  //   Icons.favorite,
  //   Icons.person_3,

  // ];

  // int show = 0;

  // double height_test = 0;
  // isshow() {
  //   if (show == 0) {
  //     show = 1;
  //   } else {
  //     show = 0;
  //   }
  //   height_test = Get.height * 0.35;
  //   update();
  // }

  List bottomappBar = [
    {"title": "home", "icon": Icons.home},
    {"title": "offers", "icon": Icons.local_offer_outlined},
    {"title": "orders", "icon": Icons.inventory_outlined},
    {"title": "settings", "icon": Icons.settings}
  ];

  int currentPage = 0;
  List<Widget> listPage = [
    const HomePage(),
    const Offers(),
    const My_Order(),
    const Settings(),
  ];

  changePage(int currentPage) {
    this.currentPage = currentPage;
    if (this.currentPage == 2) {
      controller.currentPage = 0;
    }

    update();
  }
}
