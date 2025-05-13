import 'package:ecommerce_project/controller/Items_Controller.dart';
import 'package:ecommerce_project/controller/MyFavorite_Controller.dart';
import 'package:ecommerce_project/core/class/handlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/Favorite_Controller.dart';
import '../../core/class/statusRequest.dart';
import '../../core/constant/routs.dart';
import '../../data/model/MyFavoriteModel.dart';
import '../../data/model/items_Model.dart';
import '../widget/Custom_AppBar.dart';
import '../widget/MyFavorite/Custom_ListItemsMyFavorite.dart';
import '../widget/Search/Custom_ListItemsSearch.dart';
import '../widget/items/Custom_ListItems.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    MyFavoriteModel FavoriteItemsModel;
    Get.put(MyFavoriteController());

    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GetBuilder<MyFavoriteController>(
        builder: (controller) => ListView(
          children: [
            CustomAppBar(
                onPressedIconSearch: () {
                  controller.cheackSearch(controller.search!.text);
                },
                onPressedIconFavorite: () {
                  Get.toNamed(AppRoute.myfavorite);
                },
                onChanged: (val) {
                  controller.onSearchItems(val);
                  if (controller.search!.text.isEmpty) {
                    controller.statusRequest = StatusRequest.none;
                  }
                },
                onTextDelete: () {
                  controller.onTextDelete();
                  controller.statusRequest = StatusRequest.none;
                },
                controller: controller.search,
                appBarTitle: "Find your product",
                onPressedIcon: () {}),
            handlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch
                    ? ListItemsSearch(
                        listdataModel: controller.listData,
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.7, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return CustomListMyFavoriteItems(
                            FavoriteItemsModel: controller.data[index],
                          );
                        },
                      )),
          ],
        ),
      ),
    ));
  }
}
