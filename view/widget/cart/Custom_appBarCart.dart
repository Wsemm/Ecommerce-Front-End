import '../../../core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/items_Model.dart';

class CustomAppBarCart extends StatelessWidget {
  const CustomAppBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsModel? itemsModel;
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                "cart",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
