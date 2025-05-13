import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);
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
