import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../core/class/Crud.dart';
import '../../../linkApi.dart';

class MyFavoriteData extends Api {
  Crud crud;

  MyFavoriteData(this.crud);

  getMyFavorite(String id) async {
    try {
      final response = await api.post(EndPoint.myFavorite, data: {"id": id});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  deleteMyFavorite(String id) async {
    try {
      final response =
          await api.post(EndPoint.deleteMyFavorite, data: {"id": id});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  getSingleItem(String id) async {
    try {
      final response = await api.post(EndPoint.soloItem, data: {"id": id});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  getData(String id) async {
    var response = await crud.postData(AppLink.myFavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deleteMyFavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  getSoloItemData(String id) async {
    var response = await crud.postData(AppLink.soloItem, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
