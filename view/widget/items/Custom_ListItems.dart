import 'package:cached_network_image/cached_network_image.dart';
import '../../../controller/Favorite_Controller.dart';
import '../../../controller/Items_Controller.dart';
import '../../../controller/MyFavorite_Controller.dart';
import '../../../core/constant/ImageAssets.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/items_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../linkApi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomListItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 14, right: Get.width * 0.001, left: 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemId}",
                        child: CachedNetworkImage(
                            width: Get.width * 0.4,
                            height: Get.height * 0.13,
                            fit: BoxFit.fill,
                            imageUrl:
                                "${AppLink.imageItems}/${itemsModel.itemImage}"),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: Get.height * 0.015),
                        width: double.infinity,
                        height: Get.height * 0.09,
                        child: Text(
                          "${itemsModel.itemName}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: Get.height * 0.001),
                        child: Row(
                          children: [
                            const Text(
                              "Ratting 3.5",
                              style: TextStyle(color: AppColor.grey),
                            ),
                            const Spacer(),
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 17,
                                    )),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(itemsModel.itemPrice!.toStringAsFixed(0),
                                      style: TextStyle(
                                        fontFamily: "sans",
                                        color: AppColor.primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        decoration: itemsModel.itemDiscount != 0
                                            ? TextDecoration.lineThrough
                                            : null,
                                      )),
                                  const Text(
                                    " \$",
                                    style: TextStyle(
                                      fontFamily: "sans",
                                      color: AppColor.primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              if (itemsModel.itemDiscount != 0)
                                Text(
                                  "${double.parse(itemsModel.itemPriceDiscount!).toStringAsFixed(0)} \$",
                                  style: const TextStyle(
                                      fontFamily: "sans",
                                      color: AppColor.primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                            ],
                          ),
                          GetBuilder<FavoriteController>(
                            builder: (controller) => IconButton(
                                onPressed: () {
                                  if (controller
                                          .isFavorite[itemsModel.itemId] ==
                                      1) {
                                    controller.setFavorite(
                                        itemsModel.itemId, 0.obs);
                                    controller.removeFavorite(
                                        itemsModel.itemId.toString());
                                  } else {
                                    controller.setFavorite(
                                        itemsModel.itemId, 1.obs);
                                    controller.addFavorite(
                                        itemsModel.itemId.toString());
                                  }
                                },
                                icon: Icon(
                                  controller.isFavorite[itemsModel.itemId] == 1
                                      ? Icons.favorite_outlined
                                      : Icons.favorite_outline,
                                  color: Colors.red,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (itemsModel.itemDiscount != 0)
              Positioned(
                width: 40,
                height: 40,
                child: Image.asset(AppImageAsset.sale_2),
              )
          ],
        ),
      ),
    );
  }
}
