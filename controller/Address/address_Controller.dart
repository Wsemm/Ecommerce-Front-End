import 'view_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusRequest.dart';
import '../../core/constant/routs.dart';
import '../../core/functions/handlingData_controller.dart';
import '../../core/services/services.dart';
import '../../data/DataSource/remote/Address_Data.dart';

class AdressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  TextEditingController? name, city, street;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  AddressViewController addressViewController =
      Get.put(AddressViewController());
  String lat = "2", lang = "4";

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    super.onInit();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id").toString(),
        name!.text,
        city!.text,
        street!.text,
        lat,
        lang);

    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        if (addressViewController.data.isEmpty) {
          Get.back();
          addressViewController.viewAddress();
        } else {
          Get.offAllNamed(AppRoute.homePage);
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
