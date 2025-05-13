import 'package:dio/dio.dart';
import 'package:ecommerce_project/core/web_services/api/api_consumer.dart';
import 'package:ecommerce_project/core/web_services/api/dio_consumer.dart';
import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

abstract class Api {
  ApiConsumer api = DioConsumer(dio: Dio());
  ApiDataRepository repository = Get.find();
}
