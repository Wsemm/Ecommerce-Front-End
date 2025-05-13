import 'package:cached_network_image/cached_network_image.dart';
import '../../controller/Favorite_Controller.dart';
import '../../controller/Items_Controller.dart';
import '../../controller/Search_Controller.dart';
import '../../core/class/handlingDataView.dart';
import '../../core/constant/color.dart';
import '../../data/model/items_Model.dart';
import '../../linkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/MyFavorite_Controller.dart';
import '../../core/class/statusRequest.dart';
import '../../core/constant/routs.dart';
import '../widget/Custom_AppBar.dart';
import '../widget/Search/Custom_ListItemsSearch.dart';
import '../widget/items/Custom_ListItems.dart';
import '../widget/items/Custom_listCategoriesItmes.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController ControllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => CustomAppBar(
                  onPressedIconSearch: () {
                    controller.cheackSearch(controller.search!.text);
                  },
                  onPressedIconFavorite: () {
                    controller.goToPageFavorite();
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
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
              builder: (ItemsController) => handlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.isSearch
                      ? ListItemsSearch(
                          listdataModel: controller.listData,
                        )
                      : GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: ItemsController.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.7, crossAxisCount: 2),
                          itemBuilder: (BuildContext context, index) {
                            ControllerFav.isFavorite[ItemsController.data[index]
                                    ["item_id"]] =
                                ItemsController.data[index]['favorite'];
                            return CustomListItems(
                                itemsModel: ItemsModel.fromJson(
                                    ItemsController.data[index]));
                          })),
            ),
          ],
        ),
      ),
    );
  }
}
