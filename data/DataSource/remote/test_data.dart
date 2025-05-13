import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';
import '../../../core/class/statusRequest.dart';
import '../../../core/functions/handlingData_controller.dart';

class TestData {
  Crud crud;
  StatusRequest statusRequest = StatusRequest.none;
  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.testlogin,
        {"email": "wsem.dawoodi2001@gmail.com", "password": "wsemwsem2"});
    var test = response;
    print("==================${response} aaaaaaaaaaaaaaaaaaaaaaaaa");

    return response.fold((l) => l, (r) => r);
  }

  getData2() async {
    statusRequest = StatusRequest.loading;
    var response = await getData();
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
  }
}
