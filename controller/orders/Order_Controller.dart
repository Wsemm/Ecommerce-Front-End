import '../../data/DataSource/remote/orders/Rateing_Data.dart';
import '../../data/DataSource/remote/orders/orders_Data.dart';
import '../../data/model/MyOrders_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData_controller.dart';
import '../../core/services/services.dart';

class MyOrder_Controller extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  RateOrderData rateOrderData = RateOrderData(Get.find());
  MyOrders_Model? myOrders_Model;
  List<MyOrders_Model> data = [];
  List<MyOrders_Model> doneOrdersdata = [];
  List<MyOrders_Model> pendingOrdersdata = [];
  late StatusRequest statusRequest, statusRequestPending, statusRequestDone;
  MyServices myServices = Get.find();
  PageController? pageController = PageController();
  int currentPage = 0;

  getMyOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersData.getData(myServices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => MyOrders_Model.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  getDoneOrders() async {
    doneOrdersdata.clear();
    statusRequestDone = StatusRequest.loading;
    var response = await ordersData
        .ordersDone(myServices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequestDone = handlingData(response);
    if (StatusRequest.sucess == statusRequestDone) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        doneOrdersdata.addAll(listdata.map((e) => MyOrders_Model.fromJson(e)));
      } else {
        statusRequestDone = StatusRequest.failuer;
      }
    }
    update();
  }

  getPendingOrders() async {
    pendingOrdersdata.clear();
    statusRequestPending = StatusRequest.loading;
    update();
    var response = await ordersData
        .ordersPending(myServices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequestPending = handlingData(response);
    if (StatusRequest.sucess == statusRequestPending) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        pendingOrdersdata
            .addAll(listdata.map((e) => MyOrders_Model.fromJson(e)));
      } else {
        statusRequestPending = StatusRequest.failuer;
      }
    }
    update();
  }

  deleteData(String ordersid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.deleteData(ordersid);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        print("================success===========");
        getMyOrders();
        getPendingOrders();
      } else {
        statusRequest = StatusRequest.failuer;
        print("================failuer===========");
      }
    }
    update();
  }

  printOrderStatus(String val) {
    switch (val) {
      case "0":
        return "pending";
      case "1":
        return "approved";
      case "2":
        return "on the way";
      case "3":
        return "Done";

      default:
    }
  }

  // @override
  // next() {
  //   currentPage = currentPage + 1;
  //   if (currentPage > 2) {
  //     currentPage = 0;
  //   } else {
  //     pageController!.animateToPage(currentPage,
  //         duration: Duration(milliseconds: 450), curve: Curves.easeInOut);
  //   }
  // }

  onPageChanged(int index) {
    currentPage = index;

    update();
  }

  rateMyOrder(String id, rating, comment) async {
    await rateOrderData.rateOrder(id, rating, comment);

    doneOrdersdata.clear();
    data.clear();
    getMyOrders();
    getDoneOrders();
    update();
  }

  @override
  void onInit() {
    getMyOrders();
    getDoneOrders();
    getPendingOrders();

    super.onInit();
  }
}
