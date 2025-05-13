import 'Favorite_Controller.dart';
import 'Items_Controller.dart';
import 'Search_Controller.dart';
import '../core/services/services.dart';
import '../data/DataSource/remote/Items_Data.dart';
import '../data/model/MyFavoriteModel.dart';
import '../data/model/items_Model.dart';
import 'package:get/get.dart';
import '../core/class/statusRequest.dart';
import '../core/functions/handlingData_controller.dart';
import 'package:flutter/material.dart';
import '../data/DataSource/remote/MyFavorite_Data.dart';
import '../data/DataSource/remote/favorite_Data.dart';

class MyFavoriteController extends MySearchController {
  List<MyFavoriteModel> data = [];
  List dataItem = [];

  ItemsData itemsData = ItemsData(Get.find());

  Map isFavorite = {};
  MyServices myServices = Get.find();
  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());

  late StatusRequest statusRequest;
  // String? catid = Get.arguments['catid'].toString();

  List responseData = [];

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myfavoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller ${response} ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['data'] != null) {
        responseData = response['data'];
      }
      if (response['status'] == 'success') {
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));

        // data.addAll(response['data']);
      }
      // else {
      //   statusRequest = StatusRequest.failuer;
      // }
    }
    update();
  }

  deleteFromFavorite(String favoriteId) async {
    var response = await myfavoriteData.deleteData(favoriteId);
    print("=============================== Controller ${response} ");
    data.removeWhere((element) => element.favoriteId.toString() == favoriteId);

    update();
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
