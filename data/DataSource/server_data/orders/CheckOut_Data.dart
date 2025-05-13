import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class CheckOutData extends Api {
  Crud crud;

  CheckOutData(this.crud);

  sendVerifyCode(Map data) async {
    try {
      final response = await api.post(EndPoint.checkOut, data: data);
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  checkOut(Map data) async {
    var response = await crud.postData(AppLink.checkOut, data);
    return response.fold((l) => l, (r) => r);
  }
}
