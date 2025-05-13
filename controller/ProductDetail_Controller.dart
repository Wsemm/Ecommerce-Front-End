import 'package:dropdown_search/dropdown_search.dart';
import '../core/constant/routs.dart';
import '../data/DataSource/remote/MyFavorite_Data.dart';
import '../view/screen/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/functions/handlingData_controller.dart';
import '../core/services/services.dart';
import '../data/DataSource/remote/Cart_Data.dart';
import '../data/model/Cart_Model.dart';
import '../data/model/items_Model.dart';
import 'Cart_Controller.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late StatusRequest statusRequest;
  List<CartModel> data = [];
  Map isFavorite = {};
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  double priceOrders = 0.0;
  int TotalCountItems = 0;
  Rx i = 0.obs;

  late ItemsModel itemsModel;
  int countitems = 0;

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  intialData() async {
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.itemId.toString());
    // cartController.countItems = countitems;
    update();
  }

  additmes(String itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemid);
    // print("------------------------- Controller ${response} ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        // Get.rawSnackbar(
        //     title: "notefication",
        //     messageText: const Text(
        //         "the item has successfully added to favorite",
        //         style: TextStyle(color: Colors.white)));

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
  }

  removeitems(String itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("id")!, itemid);
    // print("=============================== Controller ${response} ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        // Get.rawSnackbar(
        //     title: "notefication",
        //     messageText: const Text(
        //         "the item has successfully removed to favorite",
        //         style: TextStyle(color: Colors.white)));

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
  }

  getCountItems(String itemid) async {
    int countItems = 0;
    statusRequest = StatusRequest.loading;
    var response = await cartData.CartItemsCount(
        myServices.sharedPreferences.getString("id")!, itemid);
    print("-------------------------- Controller ${response} ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        countItems = response['data'];

        return countItems;

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
  }

  add() {
    additmes(itemsModel.itemId.toString());
    countitems++;

    update();
  }

  remove() {
    if (countitems > 0) countitems--;

    {
      removeitems(itemsModel.itemId.toString());
      update();
    }
  }

  goToCart() {
    Get.offAndToNamed(AppRoute.cart);
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
