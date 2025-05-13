import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);
  viewData(String userid) async {
    var response = await crud.postData(AppLink.addressView, {"userid": userid});

    return response.fold((l) => l, (r) => r);
  }

  addData(String userid, name, city, street, lat, lang) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "userid": userid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "lang": lang,
    });

    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response = await crud.postData(AppLink.addressDelete, {
      "addressid": addressid,
    });

    return response.fold((l) => l, (r) => r);
  }

  EditData(String userid, name, city, street, lat, lang, int addressid) async {
    var response = await crud.postData(AppLink.addressEdit, {
      "userid": userid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "lang": lang,
      "addressid": addressid,
    });

    return response.fold((l) => l, (r) => r);
  }
}
