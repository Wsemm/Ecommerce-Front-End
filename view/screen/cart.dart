import '../../controller/Cart_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../widget/cart/Custom_BottomNavgationBarCart.dart';
import '../widget/cart/Custom_ListCartItems.dart';
import '../widget/cart/Custom_appBarCart.dart';
import '../widget/cart/Custom_orderButton.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomBottomNavgationBarCart(
                  price: "${controller.priceOrders}",
                  discount: "${controller.discountCoupon}",
                  shipping: "${controller.shiping}",
                  totalprice: "${controller.totalPrice()}"),
              SizedBox(
                height: Get.height * 0.005,
              ),
            ],
          ),
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (CartController) => Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 5),
              height: Get.height * 0.59,
              child: ListView(
                shrinkWrap: true,
                children: [
                  // const CustomAppBarCart(),
                  Container(
                    padding: const EdgeInsets.only(bottom: 5, top: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: AppColor.thirdColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                        "you have  ${controller.totalCountItems}  items in your cart",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white, fontFamily: "sasa")),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        ...List.generate(
                            controller.data.length,
                            (index) => CustomListCartItems(
                                  imagename:
                                      "${controller.data[index].itemImage}",
                                  name: "${controller.data[index].itemName}",
                                  count: "${controller.data[index].countitems}",
                                  price:
                                      "${double.parse(controller.data[index].itemsprice!).toStringAsFixed(0)}",
                                  onAdd: () async {
                                    await controller.add(controller
                                        .data[index].itemId
                                        .toString());
                                    controller.refreshPage();
                                  },
                                  onRemove: () async {
                                    await controller.remove(controller
                                        .data[index].itemId
                                        .toString());
                                    controller.refreshPage();
                                  },
                                )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 7,
                  right: 5,
                ),
                child: controller.couponName == null
                    ? Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              cursorColor: AppColor.secondColor,
                              controller: controller.couponController,
                              decoration: const InputDecoration(
                                  hintText: "enter Coupon Code  ",
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor.secondColor)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor.Deepgrey))),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: CustomOrderButton(
                                  textbutton: "apply",
                                  onPressed: () {
                                    controller.CheckCoupon();
                                  }))
                        ],
                      )
                    : Container(
                        child: Row(children: [
                          Container(
                              padding: EdgeInsets.only(left: Get.width / 2.5),
                              child: Text(
                                "${controller.couponName}",
                                style: const TextStyle(
                                    fontFamily: "sans",
                                    color: AppColor.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                          Spacer(),
                          Container(
                            child: MaterialButton(
                              onPressed: () {
                                controller.EditCoupon();
                              },
                              child: Text("change Coupon"),
                            ),
                          )
                        ]),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
