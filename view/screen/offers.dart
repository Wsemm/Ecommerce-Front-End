import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import '../../controller/Items_Controller.dart';
import '../../controller/MyFavorite_Controller.dart';
import '../../controller/offers_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/Favorite_Controller.dart';
import '../../core/class/handlingDataView.dart';
import '../../core/class/statusRequest.dart';
import '../../core/constant/ImageAssets.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routs.dart';
import '../../data/model/items_Model.dart';
import '../../linkApi.dart';
import '../widget/Custom_AppBar.dart';
import '../widget/Search/Custom_ListItemsSearch.dart';
import '../widget/items/Custom_ListItems.dart';
import '../widget/items/Custom_listCategoriesItmes.dart';
import '../widget/offers/CustomListOffersItems.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController ControllerFav = Get.put(FavoriteController());

    ItemsModel itemsModel = ItemsModel();
    // Get.put(ItemsControllerImp());
    return Scaffold(
      body: GetBuilder<OffersController>(
        builder: (controller) => ListView(
          children: [
            handlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => Container(
                    child: CustomListItemsOffers(
                        itemsModel: controller.data[index]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
