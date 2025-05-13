import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class ItemsData extends Api {
  Crud crud;

  ItemsData(this.crud);

  searchProducts(String id, String userid) async {
    try {
      final response = await api.post(EndPoint.items,
          data: {"id": id.toString(), "userid": userid.toString()});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  getData(String id, String userid) async {
    var response = await crud.postData(
        AppLink.items, {"id": id.toString(), "userid": userid.toString()});

    return response.fold((l) => l, (r) => r);
  }
}
