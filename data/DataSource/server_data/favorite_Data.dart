import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class FavoriteData extends Api {
  Crud crud;
  FavoriteData(this.crud);

  addToFavorite(String userid, String itemid) async {
    try {
      final response = await api.post(EndPoint.favoriteAdd,
          data: {"userid": userid, "itemid": itemid});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  removeFromFavorite(String userid, String itemid) async {
    try {
      final response = await api.post(EndPoint.favoriteRemove,
          data: {"userid": userid, "itemid": itemid});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  addFavorite(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.favoriteAdd, {"userid": userid, "itemsid": itemid});

    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String userid, String itemid) async {
    var response = await crud.postData(
        AppLink.favoriteRemove, {"userid": userid, "itemsid": itemid});

    return response.fold((l) => l, (r) => r);
  }
}
