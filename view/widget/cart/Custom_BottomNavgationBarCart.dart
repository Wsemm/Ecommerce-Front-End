import '../../../controller/Cart_Controller.dart';
import '../../../core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import 'Custom_orderButton.dart';

class CustomBottomNavgationBarCart extends StatelessWidget {
  final String discount, price, totalprice, shipping;

  const CustomBottomNavgationBarCart({
    Key? key,
    required this.price,
    required this.discount,
    required this.totalprice,
    required this.shipping,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return GetBuilder<CartController>(
      builder: (controller) => Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: AppColor.primaryColor)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text("price",
                            style: TextStyle(fontSize: 16))),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("$price \$",
                            style: const TextStyle(fontSize: 16))),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text("shipping",
                            style: TextStyle(fontSize: 16))),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("$shipping \$",
                            style: const TextStyle(fontSize: 16))),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text("discount",
                            style: TextStyle(fontSize: 16))),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("$discount %",
                            style: const TextStyle(fontSize: 16)))
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text("Total Price",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor))),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text("$totalprice \$",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor)))
                  ],
                ),
              ],
            ),
          ),
          // const SizedBox(height: 10),
          CustomOrderButton(
            textbutton: "Place Order",
            onPressed: () {
              controller.goToCheckOut();
            },
          )
        ],
      )),
    );
  }
}
