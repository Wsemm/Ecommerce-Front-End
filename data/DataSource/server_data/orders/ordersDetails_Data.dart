import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class OrdersDetailsData extends Api {
  Crud crud;
  OrdersDetailsData(this.crud);

  getOrdersDetails(String id) async {
    try {
      final response = await api.post(EndPoint.ordersDetails, data: {
        "id": id,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  getData(String id) async {
    var response = await crud.postData(AppLink.ordersDetails, {"id": id});

    return response.fold((l) => l, (r) => r);
  }
}
