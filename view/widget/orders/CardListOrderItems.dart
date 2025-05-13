import 'rattingDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/Order_Controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routs.dart';
import '../../../data/DataSource/remote/orders/Rateing_Data.dart';
import '../../../data/model/MyOrders_Model.dart';

class CardListOrdersItems extends GetView<MyOrder_Controller> {
  final MyOrders_Model myOrders_Model;

  const CardListOrdersItems({super.key, required this.myOrders_Model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "order Number:",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  " ${myOrders_Model.orderId}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColor.primaryColor,
                  ),
                )
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text(
                  "order type:",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  " ${myOrders_Model.orderType}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColor.primaryColor,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "order price:",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  " ${myOrders_Model.orderPrice}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColor.primaryColor,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "order delivery:",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  " ${myOrders_Model.orderPricedelivry}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColor.primaryColor,
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  "order status:",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  " ${controller.printOrderStatus(myOrders_Model.orderStatus.toString())}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColor.primaryColor,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            Row(
              children: [
                Text(
                  " total price: ${myOrders_Model.orderTotalprice}",
                  style: const TextStyle(
                      fontSize: 18, color: AppColor.primaryColor),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.orderDetails,
                        arguments: {"ordersmodel": myOrders_Model});
                  },
                  child: const Text(
                    "Deatiles",
                    style:
                        TextStyle(fontSize: 18, color: AppColor.primaryColor),
                  ),
                ),
                if (myOrders_Model.orderStatus == 0)
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      controller.deleteData(myOrders_Model.orderId.toString());
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                if (myOrders_Model.orderStatus == 3 &&
                    myOrders_Model.ordersRating == 0)
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      print("${myOrders_Model.ordersRating}");
                      showDialogRaiting(
                          context, myOrders_Model.orderId.toString());
                    },
                    child: const Text(
                      "Rate",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
