import 'package:dio/dio.dart';
import 'package:ecommerce_project/core/web_services/api/api_consumer.dart';
import 'package:ecommerce_project/core/web_services/api/dio_consumer.dart';
import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/repository.dart';
import 'package:get/get.dart';

import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  ApiConsumer api = DioConsumer(dio: Dio());
  ApiDataRepository repository = Get.find();
  login(
    String email,
    String password,
    String token,
  ) async {
    try {
      final response = await api.post(EndPoint.login, data: {
        "email": email,
        "password": password,
        "token": token,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  postData(
    String email,
    String password,
    String token,
  ) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
      "token": token,
    });

    return response.fold((l) => l, (r) => r);
  }
}
