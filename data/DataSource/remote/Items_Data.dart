import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getData(String id, String userid) async {
    var response = await crud.postData(
        AppLink.items, {"id": id.toString(), "userid": userid.toString()});

    return response.fold((l) => l, (r) => r);
  }
}
