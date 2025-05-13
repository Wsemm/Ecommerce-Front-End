import 'package:ecommerce_project/core/class/handlingDataView.dart';
import 'package:ecommerce_project/core/class/statusRequest.dart';
import 'package:ecommerce_project/core/constant/routs.dart';
import 'package:ecommerce_project/data/model/items_Model.dart';
import 'package:ecommerce_project/view/widget/home/Custom_CardHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/Home_Controller.dart';
import '../../controller/Items_Controller.dart';
import '../../controller/ProductDetail_Controller.dart';
import '../../controller/orders/Order_Controller.dart';
import '../../controller/Search_Controller.dart';
import '../widget/Custom_AppBar.dart';
import '../widget/Search/Custom_ListItemsSearch.dart';
import '../widget/home/Custom_LisTItemsHome.dart';
import '../widget/home/Custom_ListCategoriesHome.dart';
import '../widget/home/Custom_TextHome.dart';

class HomePage extends GetView<HomeControllerImp> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    Get.put(HomeControllerImp());
    Get.put(MyOrder_Controller());

    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
              child: ListView(
                children: [
                  // Container(
                  //   child: MaterialButton(
                  //     onPressed: () {
                  //       controller.changelang();
                  //     },
                  //     child: Text("change lang"),
                  //   ),
                  // ),
                  CustomAppBar(
                      onPressedIconSearch: () {
                        controller.cheackSearch(controller.search!.text);
                      },
                      onPressedIconFavorite: () async {
                        Get.toNamed(AppRoute.myfavorite, arguments: {
                          "categories": [0],
                          "selectedCat": 0,
                          "catid": "0",
                        });
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
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (controller.textdata.isNotEmpty)
                                  CustomCardHome(
                                      title:
                                          "${controller.textdata[0]["text_title"]}",
                                      body:
                                          "${controller.textdata[0]["text_body"]}"),
                                const CustomListCategoriesHome(),
                                if (controller.topSellingItems.isNotEmpty)
                                  const CustomTextHome(title: "Top Selling"),
                                if (controller.topSellingItems.isNotEmpty)
                                  handlingDataView(
                                    statusRequest: controller.statusRequest,
                                    widget:
                                        const CustomListItemsHomeTopSelling(),
                                  ),
                                const CustomTextHome(title: "Incredible Offer"),
                                handlingDataView(
                                  statusRequest: controller.statusRequest,
                                  widget: const CustomListItemsHome(),
                                ),
                              ],
                            ))
                ],
              ),
            ));
  }
}
