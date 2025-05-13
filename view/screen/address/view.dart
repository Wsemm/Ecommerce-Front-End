import '../../../core/class/handlingDataView.dart';
import '../../../core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Address/view_Controller.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addAddress);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('address'),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) => handlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => Container(
                      child: Card(
                        child: ListTile(
                            title:
                                Text('${controller.data[index].addressName}'),
                            subtitle:
                                Text('${controller.data[index].addressCity}'),
                            trailing: IconButton(
                                onPressed: () {
                                  controller.deleteAddress(controller
                                      .data[index].addressId
                                      .toString());
                                },
                                icon: Icon(Icons.delete))),
                      ),
                    ))),
      ),
    );
  }
}
