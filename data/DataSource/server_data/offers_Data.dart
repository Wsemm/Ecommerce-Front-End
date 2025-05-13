import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class OffersData extends Api {
  Crud crud;

  OffersData(this.crud);

  getOffers(String id) async {
    try {
      final response = await api.post(EndPoint.offers, data: {});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  getData() async {
    var response = await crud.postData(AppLink.offers, {});

    return response.fold((l) => l, (r) => r);
  }
}
