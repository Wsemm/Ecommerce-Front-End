import 'package:dio/dio.dart';
import 'package:ecommerce_project/core/web_services/api/api_consumer.dart';
import 'package:ecommerce_project/core/web_services/api/dio_consumer.dart';
import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';

import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  ApiConsumer api = DioConsumer(dio: Dio());

  signUp(String username, String password, String email, String phone) async {
    try {
      final response = await api.post(EndPoint.signUp, data: {
        "username": username,
        "password": password,
        "email": email,
        "phone": phone,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  postData(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });

    return response.fold((l) => l, (r) => r);
  }
}
