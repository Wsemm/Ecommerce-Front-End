import '../../../core/class/handlingDataView.dart';
import '../../../core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/Order_Controller.dart';
import '../../widget/orders/CardListOrderItems.dart';

class My_Order extends StatelessWidget {
  const My_Order({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyOrder_Controller());
    var itemsModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "My Orders",
          style: TextStyle(color: AppColor.primaryColor),
        ),
      ),
      body: GetBuilder<MyOrder_Controller>(
        builder: (controller) => Container(
          child: Column(
            children: [
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: MaterialButton(
                              color: controller.currentPage == 0
                                  ? AppColor.primaryColor
                                  : Colors.grey[300],
                              onPressed: () {
                                controller.pageController!.animateToPage(
                                  0,
                                  duration: Duration(milliseconds: 1),
                                  curve: Curves.easeInOut,
                                );
                                controller.currentPage = 0;
                              },
                              child: Text(
                                "Current Orders",
                                style: TextStyle(
                                    fontWeight: controller.currentPage == 0
                                        ? FontWeight.bold
                                        : null,
                                    fontSize: controller.currentPage == 0
                                        ? 15
                                        : null),
                              ),
                            ),
                          ),
                          MaterialButton(
                            color: controller.currentPage == 1
                                ? AppColor.primaryColor
                                : Colors.grey[300],
                            onPressed: () {
                              controller.pageController!.animateToPage(
                                1,
                                duration: Duration(milliseconds: 1),
                                curve: Curves.easeInOut,
                              );
                              controller.currentPage = 1;
                            },
                            child: Text("pending Orders",
                                style: TextStyle(
                                    fontSize:
                                        controller.currentPage == 1 ? 15 : null,
                                    fontWeight: controller.currentPage == 1
                                        ? FontWeight.bold
                                        : null)),
                          ),
                          MaterialButton(
                            color: controller.currentPage == 2
                                ? AppColor.primaryColor
                                : Colors.grey[300],
                            onPressed: () {
                              controller.pageController!.animateToPage(
                                2,
                                duration: Duration(milliseconds: 1),
                                curve: Curves.easeInOut,
                              );
                              controller.currentPage = 2;
                            },
                            child: Text("Done Orders",
                                style: TextStyle(
                                    fontWeight: controller.currentPage == 2
                                        ? FontWeight.bold
                                        : null,
                                    fontSize: controller.currentPage == 2
                                        ? 15
                                        : null)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  height: Get.height / 1.45,
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (value) {
                      controller.onPageChanged(value);
                    },
                    children: [
                      // controller.data.isNotEmpty
                      // ?
                      handlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: Container(
                            padding: const EdgeInsets.all(10),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) =>
                                  CardListOrdersItems(
                                      myOrders_Model: controller.data[index]),
                            ),
                          )),
                      // : Center(
                      //     child: Text("There is no any orders"),
                      //   ),
                      // controller.pendingOrdersdata.isNotEmpty
                      // ?
                      handlingDataView(
                          statusRequest: controller.statusRequestPending,
                          widget: Container(
                            padding: const EdgeInsets.all(10),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.pendingOrdersdata.length,
                              itemBuilder: (context, index) =>
                                  CardListOrdersItems(
                                      myOrders_Model:
                                          controller.pendingOrdersdata[index]),
                            ),
                          )),
                      // : Center(
                      //     child: Text("There is no any orders"),
                      //   )

                      // controller.doneOrdersdata.isNotEmpty
                      // ?
                      handlingDataView(
                          statusRequest: controller.statusRequestDone,
                          widget: Container(
                            padding: const EdgeInsets.all(10),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.doneOrdersdata.length,
                              itemBuilder: (context, index) =>
                                  CardListOrdersItems(
                                      myOrders_Model:
                                          controller.doneOrdersdata[index]),
                            ),
                          ))
                      // : Center(
                      //     child: Text("There is no any orders"),
                      //   )
                      ,
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
