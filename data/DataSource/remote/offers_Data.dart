import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class OffersData {
  Crud crud;

  OffersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.offers, {});

    return response.fold((l) => l, (r) => r);
  }
}
