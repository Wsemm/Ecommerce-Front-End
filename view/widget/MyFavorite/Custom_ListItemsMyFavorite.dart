import 'package:cached_network_image/cached_network_image.dart';
import '../../../controller/Favorite_Controller.dart';
import '../../../controller/Items_Controller.dart';
import '../../../controller/MyFavorite_Controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/MyFavoriteModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/items_Model.dart';
import '../../../linkApi.dart';

class CustomListMyFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel FavoriteItemsModel;

  const CustomListMyFavoriteItems({
    super.key,
    required this.FavoriteItemsModel,
  });

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp itemcontroller = Get.put(ItemsControllerImp());
    return InkWell(
      onTap: () {
        // controller.goToPageProductDetails( ItemsModel.fromJson(
        //                             controller.dataItem[1]));
      },
      child: Container(
        width: Get.width / 2,
        child: Card(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 14,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${FavoriteItemsModel.itemId}",
                      child: CachedNetworkImage(
                          width: Get.width * 0.4,
                          height: Get.height * 0.13,
                          fit: BoxFit.fill,
                          imageUrl:
                              "${AppLink.imageItems}/${FavoriteItemsModel.itemImage}"),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: Get.height * 0.015),
                      width: double.infinity,
                      height: Get.height * 0.085,
                      child: Text(
                        "${FavoriteItemsModel.itemName}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Get.height * 0.015),
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
                        Container(
                          // margin: EdgeInsets.only(top: Get.height * 0.018),
                          child: Text(
                            // "${FavoriteItemsModel.itemPriceDiscount}\$"
                            "${(FavoriteItemsModel.itemPrice! - ((FavoriteItemsModel.itemDiscount! * FavoriteItemsModel.itemPrice!) / 100)).toStringAsFixed(0)} \$",
                            style: const TextStyle(
                                fontFamily: "sans",
                                color: AppColor.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: IconButton(
                            onPressed: () async {
                              await controller.deleteFromFavorite(
                                  FavoriteItemsModel.favoriteId.toString());
                              await itemcontroller.getItems(
                                  "${FavoriteItemsModel.itemCat.toString()}");
                              print("${FavoriteItemsModel.itemCat.toString()}");
                            },
                            icon: Icon(
                              Icons.delete_outline,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        )
                        // GetBuilder<FavoriteController>(
                        //   builder: (controller) => IconButton(
                        //       onPressed: () {
                        //         if (controller.isFavorite[FavoriteItemsModel.itemId] ==
                        //             1) {
                        //           controller.setFavorite(FavoriteItemsModel.itemId, 0);
                        //           controller.removeFavorite(
                        //               FavoriteItemsModel.itemId.toString());
                        //         } else {
                        //           controller.setFavorite(FavoriteItemsModel.itemId, 1);
                        //            controller.addFavorite(
                        //               FavoriteItemsModel.itemId.toString());
                        //         }
                        //       },
                        //       icon: Icon(
                        //         controller.isFavorite[FavoriteItemsModel.itemId] == 1
                        //             ? Icons.favorite_outlined
                        //             : Icons.favorite_outline,
                        //         color: Colors.red,
                        //       )),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
