import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class Home_Data extends Api {
  Crud crud;

  Home_Data(this.crud);

  getCategories() async {
    try {
      final response = await api.post(EndPoint.homePage, data: {});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  searchProducts(String search) async {
    try {
      final response =
          await api.post(EndPoint.search, data: {"search": search});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  getTopSelling() async {
    try {
      final response = await api.post(EndPoint.topSelling, data: {});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  getData() async {
    var response = await crud.postData(AppLink.HomePage, {});

    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.search, {"search": search});

    return response.fold((l) => l, (r) => r);
  }

  getTopSellingData() async {
    var response = await crud.postData(AppLink.topSelling, {});

    return response.fold((l) => l, (r) => r);
  }
}
