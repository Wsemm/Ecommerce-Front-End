import '../../../controller/Address/address_Controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/CustomButtonAuth.dart';
import '../../widget/auth/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Address/view_Controller.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AdressController controller = Get.put(AdressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('add new address'),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              child: CustomTextFormField(
                  label: "name",
                  hinttext: "enter your name",
                  iconData: Icons.person,
                  myController: controller.name!,
                  valid: (val) {}),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: CustomTextFormField(
                  label: "city",
                  hinttext: "enter your city",
                  iconData: Icons.location_city,
                  myController: controller.city!,
                  valid: (val) {}),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: CustomTextFormField(
                  label: "street",
                  hinttext: "enter your street",
                  iconData: Icons.streetview,
                  myController: controller.street!,
                  valid: (val) {}),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(15),
              child: CustomButtonAuth(
                title: "Add",
                onPressed: () {
                  controller.addAddress();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
