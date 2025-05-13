import 'package:dio/dio.dart';
import 'package:ecommerce_project/core/web_services/api/api_consumer.dart';
import 'package:ecommerce_project/core/web_services/api/dio_consumer.dart';
import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/repository.dart';
import 'package:get/get.dart';

import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

import '../../../../linkApi.dart';
import '../../../../core/class/Crud.dart';

class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);
  ApiConsumer api = DioConsumer(dio: Dio());

  sendVerifyCode(String email, String verifycode) async {
    try {
      final response = await api.post(EndPoint.verifyCodeSignUP, data: {
        "email": email,
        "verifycode": verifycode,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  reSendVerifyCode(
    String email,
  ) async {
    try {
      final response = await api.post(EndPoint.resendverifyCode, data: {
        "email": email,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifyCodeSignUP, {
      "email": email,
      "verifycode": verifycode,
    });

    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resendverifyCode, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
