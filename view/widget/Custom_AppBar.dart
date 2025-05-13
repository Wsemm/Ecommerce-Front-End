import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String appBarTitle;
  final void Function()? onPressedIcon;
  final void Function()? onPressedIconFavorite;
  final void Function()? onPressedIconSearch;
  final void Function()? onTextDelete;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  const CustomAppBar(
      {super.key,
      required this.appBarTitle,
      this.onPressedIcon,
      required this.onChanged,
      required this.onPressedIconFavorite,
      required this.controller,
      required this.onPressedIconSearch, this.onTextDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.015),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: onPressedIconSearch, icon: Icon(Icons.search)),
                suffixIcon: IconButton(
                    onPressed: onTextDelete ,
                    icon: Icon(Icons.delete_forever_outlined)),
                hintText: appBarTitle,
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none)),
          )),
          // SizedBox(
          //   width: Get.width * 0.03,
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       borderRadius: BorderRadius.circular(20)),
          //   height: Get.height * 0.08,
          //   width: Get.width * 0.15,
          //   child: IconButton(
          //       onPressed: onPressedIcon,
          //       icon: Icon(
          //         Icons.notifications_active_outlined,
          //         size: 30,
          //         color: Colors.grey[600],
          //       )),
          // ),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)),
            height: Get.height * 0.08,
            width: Get.width * 0.15,
            child: IconButton(
                onPressed: onPressedIconFavorite,
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.grey[600],
                )),
          )
        ],
      ),
    );
  }
}
