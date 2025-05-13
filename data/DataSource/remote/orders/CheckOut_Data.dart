import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class CheckOutData {
  Crud crud;

  CheckOutData(this.crud);
  checkOut(Map data) async {
    var response = await crud.postData(AppLink.checkOut, data);
    return response.fold((l) => l, (r) => r);
  }
}
