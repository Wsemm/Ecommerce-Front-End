import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class VerifyCodeForgetPasswordData extends Api {
  Crud crud;

  VerifyCodeForgetPasswordData(this.crud);

  verifyCode(
    String email,
    String verifycode,
  ) async {
    try {
      final response = await api.post(EndPoint.verifyCodeForgetPassword, data: {
        "email": email,
        "verifycode": verifycode,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  postData(
    String email,
    String verifycode,
  ) async {
    var response = await crud.postData(AppLink.verifyCodeForgetPassword, {
      "email": email,
      "verifycode": verifycode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
