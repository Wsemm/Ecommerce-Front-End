import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/ImageAssets.dart';
import '../../../core/constant/color.dart';
import '../../../linkApi.dart';

class CustomListCartItems extends StatelessWidget {
  final String name, price, count;
  final String imagename;
  final void Function()? onAdd, onRemove;

  const CustomListCartItems(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.imagename,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageItems}/$imagename",
                  height: Get.height / 10,
                  fit: BoxFit.fill,
                )),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "$name",
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "sans",
                      ),
                    ),
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text("$price \$",
                        style: const TextStyle(
                          fontSize: 17,
                          color: (AppColor.primaryColor),
                          fontFamily: "sans",
                        )),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                Container(
                    height: Get.height / 24,
                    child: IconButton(onPressed: onAdd, icon: Icon(Icons.add))),
                Container(
                  margin: EdgeInsets.only(top: Get.height / 70),
                  child: Text(
                    "$count",
                    style: const TextStyle(fontFamily: "sans"),
                  ),
                ),
                Container(
                  height: Get.height / 24,
                  child:
                      IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
