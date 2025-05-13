import '../../../controller/Home_Controller.dart';
import '../../../controller/Items_Controller.dart';
import '../../../data/model/CategoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomListCategoriesItems extends GetView<ItemsControllerImp> {
  const CustomListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.07,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => InkWell(
        onTap: () {
          controller.changeCat(i!, categoriesModel.categoriesId.toString());
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Get.width * 0.03,
                  right: Get.width * 0.03,
                  bottom: Get.height * 0.01),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3, color: AppColor.primaryColor)))
                  : null,
              child: Text(
                "${categoriesModel.categoriesName}",
                style: const TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColor.Deepgrey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
