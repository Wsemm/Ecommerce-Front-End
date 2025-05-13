import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/constant/routs.dart';
import '../core/functions/handlingData_controller.dart';
import '../core/localization/changeLocal_controller.dart';
import '../core/services/services.dart';
import '../data/DataSource/remote/home_Data.dart';
import '../data/model/items_Model.dart';

class MySearchController extends GetxController {
  LocaleController localcontroller = Get.put(LocaleController());
  MyServices myServices = Get.find();
  Home_Data homeData = Home_Data(Get.find());

  late StatusRequest statusRequest;
  List<ItemsModel> listData = [];
  String? username, lang, id;
  TextEditingController? search;
  bool isSearch = false;

  cheackSearch(String val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearchItems(String val) {
    if (val.isNotEmpty) {
      isSearch = true;
      SearchData();
    } else {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onTextDelete() {
    search!.clear();
    isSearch = false;
    update();
  }

  SearchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    // print("=============================== Controllerdasdsa $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        listData.clear();
        List responsedata = response['data'];
        listData.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }
}
