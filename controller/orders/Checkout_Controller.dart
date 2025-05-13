import '../Cart_Controller.dart';
import '../Items_Controller.dart';

import '../../core/constant/routs.dart';
import '../../data/DataSource/remote/orders/CheckOut_Data.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData_controller.dart';
import '../../core/services/services.dart';

class CheckOut_Controller extends GetxController {
  String? paymentMethod, addressId, orderType;
  late String couponId, priceOrders, discountCoupon;
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  CheckOutData checkoutData = Get.put(CheckOutData(Get.find()));
  // ItemsControllerImp itemController = Get.put(ItemsControllerImp());
  // CheckOutData checkoutData = CheckOutData(Get.find());
  CartController cartController = Get.find();

  chosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  choseAdress(String val) {
    addressId = val;
    update();
  }

  checkOut() async {
    if (paymentMethod == null || addressId == null) {
      Get.snackbar("Warrning",
          "please chose your payemnt method and the target address befor you send your order");
    } else {
      Map data = {
        "userid": myServices.sharedPreferences.getString("id"),
        "addressid": addressId.toString(),
        "orderstype": orderType.toString(),
        "pricedelivery": "10",
        "ordersprice": priceOrders,
        "couponid": couponId,
        "coupondiscount": discountCoupon.toString(),
        "paymentmethod": paymentMethod.toString(),
        // "itemid":
      };

      statusRequest = StatusRequest.loading;

      var response = await checkoutData.checkOut(data);

      print("==========controller=======${response}");

      statusRequest = handlingData(response);

      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == 'success') {
          print("==========success===========");

          Get.offAllNamed(AppRoute.homePage);
          Get.snackbar("Success", "your order has successfully");
        } else {
          statusRequest = StatusRequest.failuer;
        }
      }

      update();
    }
  }

  @override
  void onInit() {
    // couponId = testController.couponId.toString();
    // priceOrders = testController.priceOrders.toString();
    // discountCoupon = testController.discountCoupon.toString();

    couponId = Get.arguments["couponid"];
    priceOrders = Get.arguments["priceorders"];
    discountCoupon = Get.arguments["discountcoupon"].toString();
    super.onInit();
  }
}
