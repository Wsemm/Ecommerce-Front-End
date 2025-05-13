import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/items_Model.dart';
import '../../../linkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Search_Controller.dart';

class ListItemsSearch extends StatelessWidget {
  final List<ItemsModel> listdataModel;

  const ListItemsSearch({
    super.key,
    required this.listdataModel,
  });

  @override
  Widget build(BuildContext context) {
    MySearchController controller = Get.put(MySearchController());
    return ListView.builder(
      itemCount: listdataModel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          controller.goToPageProductDetails(listdataModel[index]);
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Card(
            shadowColor: AppColor.Deepgrey,
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: CachedNetworkImage(
                        height: Get.height * 0.13,
                        width: Get.width * 0.15,
                        imageUrl:
                            "${AppLink.imageItems}/${listdataModel[index].itemImage}")),
                Expanded(
                    flex: 4,
                    child: ListTile(
                      title: Text("${listdataModel[index].itemName}"),
                      subtitle: Text("${listdataModel[index].categoriesName}"),
                    )),
                Expanded(
                    flex: 1, child: Text("${listdataModel[index].itemPrice}"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
