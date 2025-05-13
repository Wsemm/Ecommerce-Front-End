import '../../controller/Cart_Controller.dart';
import '../../controller/ProductDetail_Controller.dart';
import '../../core/constant/color.dart';
import '../../data/model/items_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/productDetials/priceandcount.dart';
import '../widget/productDetials/subitemslist.dart';
import '../widget/productDetials/toppageproductdetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: AppColor.secondColor,
              onPressed: () {
                controller.goToCart();
              },
              child: const Text(
                "My Cart",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))),
      body: Container(
        child: ListView(
          children: [
            const TopProductPageDetails(),
            Container(
                padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<ProductDetailsControllerImp>(
                        builder: (controller) => Text(
                            "${controller.itemsModel.itemName}",
                            style: const TextStyle(
                                color: AppColor.fourthColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: Get.height * 0.010),
                      GetBuilder<ProductDetailsControllerImp>(
                        builder: (controller) => PriceAndCountItems(
                            onAdd: () {
                              controller.add();
                            },
                            onRemove: () {
                              controller.remove();
                            },
                            price: controller.itemsModel.itemDiscount != 0
                                // ? "${double.parse(controller.itemsModel.itemPriceDiscount!).toStringAsFixed(0)}"
                                ? "${(controller.itemsModel.itemPrice! - ((controller.itemsModel.itemDiscount! * controller.itemsModel.itemPrice!) / 100)).toStringAsFixed(0)}"
                                : "${controller.itemsModel.itemPrice}",
                            count: "${controller.countitems}"),
                      ),
                      SizedBox(height: Get.height * 0.010),
                      Text(
                          "${controller.itemsModel.itemDesc} ${controller.itemsModel.itemDesc} ${controller.itemsModel.itemDesc} ${controller.itemsModel.itemDesc} ${controller.itemsModel.itemDesc}",
                          style: const TextStyle(
                              fontSize: 16,
                              color: AppColor.grey,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: Get.height * 0.010),
                      // const Text("Color",
                      //     style: TextStyle(
                      //         color: AppColor.fourthColor,
                      //         fontSize: 25,
                      //         fontWeight: FontWeight.bold)),
                      SizedBox(height: Get.height * 0.010),

                      // const SubitemsList()
                    ])),
          ],
        ),
      ),
    );
  }
}
