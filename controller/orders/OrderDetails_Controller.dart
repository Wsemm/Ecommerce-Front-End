import '../../data/DataSource/remote/orders/ordersDetails_Data.dart';
import '../../data/model/Cart_Model.dart';
import '../../data/model/MyOrders_Model.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData_controller.dart';

class OrderDetailsController extends GetxController {
  late MyOrders_Model myOrders_Model;
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  CartModel cartModel = CartModel();
  List<CartModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersDetailsData.getData(myOrders_Model.orderId.toString());
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  void onInit() {
    myOrders_Model = Get.arguments["ordersmodel"];
    getData();
    super.onInit();
  }
}
