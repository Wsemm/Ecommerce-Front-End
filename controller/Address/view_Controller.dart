import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/constant/routs.dart';
import '../../core/functions/handlingData_controller.dart';
import '../../core/services/services.dart';
import '../../data/DataSource/remote/Address_Data.dart';
import '../../data/model/Address_Model.dart';

class AddressViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  TextEditingController? name, city, street;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  List<AddressModel> data = [];

  double lat = 0, lang = 0;

  @override
  void onInit() {
    viewAddress();
    super.onInit();
  }

  deleteAddress(String addressId) {
    addressData.deleteData(addressId);
    data.removeWhere((element) => element.addressId == int.parse(addressId));
    update();
  }

  viewAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .viewData(myServices.sharedPreferences.getString("id").toString());

    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
