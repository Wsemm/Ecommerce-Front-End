import 'dart:io';

import '../../controller/sendNotfication_Controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routs.dart';
import '../../firebase_test.dart';
import '../widget/home/Custom_ButtonAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/Cart_Controller.dart';
import '../../controller/HomeScreen_Controller.dart';
import '../../controller/Items_Controller.dart';
import '../widget/home/Custom_bottomAppBarHome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    SendNotfication_Controller notfication =
        Get.put(SendNotfication_Controller());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            // NotificationService.sendNotification(
            //     "chJt4kxITt-jId_25aBNbu:APA91bEnKJocsMgvacgplF04KqnmRbBJ77VgkNMYTT_70wGbl2wGZEcg474v8TncqTNDtmRW0lCPoMP7zBNcb1WvG92IE5KXx1stTnhlfmGq_HFPe2P6NK0IJxHeXtkP4wxC5f02Osmw",
            //     "test",
            //     "test body");

            Get.toNamed(AppRoute.cart);
            // controller.isshow();
          },
          child: const Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: WillPopScope(
            child: controller.listPage.elementAt(controller.currentPage),
            onWillPop: () {
              Get.defaultDialog(
                confirmTextColor: Colors.white,
                cancelTextColor: Colors.red,
                buttonColor: AppColor.primaryColor,
                title: "Warnning",
                middleText: "Do you need to Exit the app",
                onCancel: () {},
                onConfirm: () {
                  exit(0);
                },
              );
              return Future.value(false);
            }),
      ),
    );
  }
}
