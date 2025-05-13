import '../../../controller/orders/Checkout_Controller.dart';
import '../../../core/class/handlingDataView.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routs.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Address/view_Controller.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOut_Controller CheckOutController = Get.put(CheckOut_Controller());
    AddressViewController addressController = Get.put(AddressViewController());

    Get.put(AddressViewController());

    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.primaryColor),
        child: MaterialButton(
          onPressed: () async {
            await CheckOutController.checkOut();
          },
          child: const Text(
            "send order",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Check Out"),
      ),
      body: GetBuilder<CheckOut_Controller>(
        builder: (controller) => Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const Center(
                child: Text(
                  "Chose your payment Method",
                  style: TextStyle(
                      color: AppColor.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  controller.chosePaymentMethod("cash");
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: controller.paymentMethod == "cash"
                          ? AppColor.primaryColor
                          : AppColor.grey),
                  child: const Center(
                    child: Text("Cash",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  controller.chosePaymentMethod("card");
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: controller.paymentMethod == "card"
                          ? AppColor.primaryColor
                          : AppColor.grey),
                  child: const Center(
                    child: Text(" Cards",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                ),
              ),
              const Center(
                child: Text("Chose the address",
                    style: TextStyle(
                        color: AppColor.secondColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
              GetBuilder<AddressViewController>(
                  builder: (controller) => addressController.data.isNotEmpty
                      ? Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) => Container(
                                    child: InkWell(
                                      onTap: () {
                                        CheckOutController.choseAdress(
                                            controller.data[index].addressId
                                                .toString());
                                      },
                                      child: Card(
                                        color: CheckOutController.addressId ==
                                                controller.data[index].addressId
                                                    .toString()
                                            ? AppColor.primaryColor
                                            : Colors.white,
                                        child: ListTile(
                                            title: Text(
                                                '${controller.data[index].addressName}'),
                                            subtitle: Text(
                                                '${controller.data[index].addressCity}'),
                                            trailing: IconButton(
                                                onPressed: () {
                                                  controller.deleteAddress(
                                                      controller
                                                          .data[index].addressId
                                                          .toString());
                                                },
                                                icon: controller.data[index]
                                                            .addressName ==
                                                        "home"
                                                    ? const Icon(Icons.home)
                                                    : const Icon(Icons.work))),
                                      ),
                                    ),
                                  )),
                        )
                      : Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 150),
                            child: MaterialButton(
                              color: AppColor.primaryColor,
                              onPressed: () {
                                Get.toNamed(AppRoute.addAddress);
                              },
                              child: const Text(
                                "Add address",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
