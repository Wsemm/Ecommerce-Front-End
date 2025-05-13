import 'dart:async';

import '../../../controller/Home_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/ProductDetail_Controller.dart';
import '../../../data/model/items_Model.dart';
import '../../../linkApi.dart';

class CustomListItemsHome extends GetView<HomeControllerImp> {
  const CustomListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.16,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
        itemBuilder: (context, index) =>
            ItemsHome(itemsModel: ItemsModel.fromJson(controller.items[index])),
      ),
    );
  }
}

class ItemsHome extends CustomListItemsHome {
  final ItemsModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              "${AppLink.imageItems}/${itemsModel.itemImage}",
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            height: 120,
            width: 180,
          ),
          Positioned(
              left: 10,
              child: Text(
                "${itemsModel.itemName}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ))
        ],
      ),
    );
  }
}

class CustomListItemsHomeTopSelling extends GetView<HomeControllerImp> {
  const CustomListItemsHomeTopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.16,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.topSellingItems.length,
        itemBuilder: (context, index) => ItemsHome(
            itemsModel: ItemsModel.fromJson(controller.topSellingItems[index])),
      ),
    );
  }
}

class ItemsHomeTopSelling extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHomeTopSelling({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            "${AppLink.imageItems}/${itemsModel.itemImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          height: 120,
          width: 180,
        ),
        Positioned(
            left: 10,
            child: Text(
              "${itemsModel.itemName}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ))
      ],
    );
  }
}
