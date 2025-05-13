import 'package:get/get.dart';
import '../core/class/statusRequest.dart';
import '../core/functions/handlingData_controller.dart';
import '../core/services/services.dart';
import '../data/DataSource/remote/favorite_Data.dart';
import 'package:flutter/material.dart';

import '../data/model/items_Model.dart';

class FavoriteController extends GetxController {
  List data = [];
  Map isFavorite = {};
  MyServices myServices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());
  late StatusRequest statusRequest;
  // String categories=myServices.sharedPreferences.getString("id")!;
  ItemsModel itemsModel = Get.put(ItemsModel());

  setFavorite (id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemid);
    print("=============================== Controller ${response} ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "notefication",
            messageText: const Text(
                "the item has successfully added to favorite",
                style: TextStyle(color: Colors.white)));

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
  }

  removeFavorite(String itemid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, itemid);
    print("=============================== Controller ${response} ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "notefication",
            messageText: const Text(
              "the item has successfully removed to favorite",
              style: TextStyle(color: Colors.white),
            ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
  }

  MyFunction(id, val) {
    setFavorite(id, val);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
