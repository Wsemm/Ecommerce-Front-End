import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class RateOrderData {
  Crud crud;

  RateOrderData(this.crud);
  rateOrder(String id, String rating, String comment) async {
    var response = await crud.postData(
        AppLink.rateing, {"id": id, "rating": rating, "ratingnote": comment});
    return response.fold((l) => l, (r) => r);
  }
}
