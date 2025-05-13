import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class ResetPasswordData extends Api {
  Crud crud;

  ResetPasswordData(this.crud);

  checkEmail(
    String email,
    String password,
  ) async {
    try {
      final response =
          await api.post(EndPoint.resetPassword, data: {"email": email});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  postData(
    String email,
    String password,
  ) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "email": email,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
