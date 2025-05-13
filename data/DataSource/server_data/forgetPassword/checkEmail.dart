import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class CheckEmailData extends Api {
  Crud crud;
  CheckEmailData(this.crud);

  checkEmail(
    String email,
  ) async {
    try {
      final response =
          await api.post(EndPoint.checkEmail, data: {"email": email});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  postData(
    String email,
  ) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
