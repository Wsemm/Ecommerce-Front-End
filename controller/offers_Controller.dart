import 'package:dartz/dartz_streaming.dart';
import '../core/class/statusRequest.dart';
import '../core/functions/handlingData_controller.dart';
import '../data/DataSource/remote/offers_Data.dart';
import '../data/DataSource/remote/test_data.dart';
import '../data/model/items_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routs.dart';

class OffersController extends GetxController {
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];
  late StatusRequest statusRequest;
  TextEditingController? search;
  bool isSearch = false;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    search = TextEditingController();
    super.onInit();
  }

  void onSearchItems(String val) {}

  void onTextDelete() {}
  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemsmodel": itemsModel});
    search!.clear();
  }

  cheackSearch(String val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }
}
