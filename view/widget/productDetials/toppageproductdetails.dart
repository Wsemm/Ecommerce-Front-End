import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/ProductDetail_Controller.dart';
import '../../../core/constant/color.dart';
import '../../../linkApi.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          height: Get.height * 0.30,
        ),
        Center(
            child: Hero(
          tag: "${controller.itemsModel.itemId}",
          child: CachedNetworkImage(
            imageUrl:
                "${AppLink.imageItems}/${controller.itemsModel.itemImage}",
            height: Get.height * 0.40,
          ),
        ))
      ],
    );
  }
}
