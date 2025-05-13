import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class RateOrderData extends Api {
  Crud crud;
  RateOrderData(this.crud);

  rateOrders(String id, String rating, String comment) async {
    try {
      final response = await api.post(EndPoint.rateing,
          data: {"id": id, "rating": rating, "ratingnote": comment});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  rateOrder(String id, String rating, String comment) async {
    var response = await crud.postData(
        AppLink.rateing, {"id": id, "rating": rating, "ratingnote": comment});
    return response.fold((l) => l, (r) => r);
  }
}
