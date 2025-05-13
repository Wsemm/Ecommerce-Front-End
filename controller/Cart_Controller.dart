import '../data/model/Coupon_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statusRequest.dart';
import '../core/constant/routs.dart';
import '../core/functions/handlingData_controller.dart';
import '../core/services/services.dart';
import '../data/DataSource/remote/Cart_Data.dart';
import '../data/model/Cart_Model.dart';

class CartController extends GetxController {
  late StatusRequest statusRequest;
  List<CartModel> data = [];
  Map isFavorite = {};
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  TextEditingController? couponController;
  CouponModel? couponModel;
  int discountCoupon = 0, shiping = 10, totalCountItems = 0;
  String? couponName, couponId;
  double priceOrders = 0.0;

  add(String itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemid);
    print("------------------------- Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        // Get.rawSnackbar(
        //     title: "notefication",
        //     messageText: const Text(
        //         "the item has successfully added to favorite",
        //         style: TextStyle(color: Colors.white)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
  }

  remove(String itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("id")!, itemid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        // Get.rawSnackbar(
        //     title: "notefication",
        //     messageText: const Text(
        //         "the item has successfully removed to favorite",
        //         style: TextStyle(color: Colors.white)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
  }

  view() async {
    statusRequest = StatusRequest.loading;
    // update();
    var response =
        await cartData.CartView(myServices.sharedPreferences.getString("id")!);
    print("-------------------------- Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        if (response['datacart']['status'] == "success") {
          List responseData = response['datacart']['data'];
          Map dataResponseCountPrice = response['countprice'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totalCountItems =
              int.parse(dataResponseCountPrice['totalcount'].toString());
          priceOrders =
              double.parse(dataResponseCountPrice['totalprice'].toString());
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  resetVarCart() {
    totalCountItems = 0;
    priceOrders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  @override
  void onInit() {
    couponController = TextEditingController();
    view();
    super.onInit();
  }

  CheckCoupon() async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.CheckCoupon(couponController!.text);
    statusRequest = handlingData(response);
    print("=============================== Controller $response ");

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        Map<String, dynamic> datasource = response['data'];
        couponModel = CouponModel.fromJson(datasource);
        discountCoupon = couponModel!.couponDiscount!;
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId.toString();
      }
    } else {
      couponName = null;
      couponId = null;
      Get.rawSnackbar(
          title: "Wrong code",
          messageText: const Text("code not found please check it",
              style: TextStyle(color: Colors.white)));
      discountCoupon = 0;
    }
    update();
  }

  EditCoupon() {
    couponName = null;
    update();
  }

  totalPrice() {
    return ((priceOrders + shiping) - ((priceOrders) * discountCoupon / 100));
  }

  goToCheckOut() {
    if (data.isEmpty) {
      return Get.snackbar("Warrning", "you dont have items in your cart");
    }

    Get.toNamed(AppRoute.checkOut, arguments: {
      "couponid": couponId ?? "0",
      "priceorders": priceOrders.toString(),
      "discountcoupon": discountCoupon.toString(),
    });
  }
}
