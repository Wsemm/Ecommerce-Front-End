import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/OrderDetails_Controller.dart';
import '../../../core/constant/color.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Details"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: GetBuilder<OrderDetailsController>(
          builder: (controller) => ListView(
            children: [
              Card(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Table(
                        children: [
                          const TableRow(children: [
                            Text(
                              "item",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              "QTY",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              "total price",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ]),
                          ...List.generate(
                              controller.data.length,
                              (index) => TableRow(children: [
                                    Text(
                                      "${controller.data[index].itemName}",
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "${controller.data[index].countitems}",
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "${double.parse(controller.data[index].itemsprice!).toStringAsFixed(0)}",
                                      textAlign: TextAlign.center,
                                    )
                                  ]))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "price: ",
                          ),
                          Text(
                            "${controller.myOrders_Model.orderTotalprice}\$",
                            style: const TextStyle(
                                color: AppColor.primaryColor, fontSize: 18),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Card(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Table(children: [
                    const TableRow(children: [
                      Text(
                        "shipping Address",
                        style: TextStyle(
                            color: AppColor.primaryColor, fontSize: 18),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                          "${controller.myOrders_Model.addressCity}  ${controller.myOrders_Model.addressStreet} ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18))
                    ])
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
