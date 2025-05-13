import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class AddressData extends Api {
  Crud crud;
  AddressData(this.crud);

  getAddress(String userid) async {
    try {
      final response =
          await api.post(EndPoint.addressView, data: {"userid": userid});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  addAddres(String userid, name, city, street, lat, lang) async {
    try {
      final response = await api.post(EndPoint.addressAdd, data: {
        "userid": userid,
        "name": name,
        "city": city,
        "street": street,
        "lat": lat,
        "lang": lang,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  deleteAddres(String addressid) async {
    try {
      final response = await api.post(EndPoint.addressDelete, data: {
        "addressid": addressid,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  editAddres(
      String userid, name, city, street, lat, lang, int addressid) async {
    try {
      final response = await api.post(EndPoint.addressAdd, data: {
        "userid": userid,
        "name": name,
        "city": city,
        "street": street,
        "lat": lat,
        "lang": lang,
        "addressid": addressid,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

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
