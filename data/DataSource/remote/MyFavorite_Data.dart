import '../../../core/class/Crud.dart';
import '../../../linkApi.dart';

class MyFavoriteData {
  Crud crud;

  MyFavoriteData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.myFavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

   deleteData(String id) async {
    var response = await crud.postData(AppLink.deleteMyFavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

   getSoloItemData(String id) async {
    var response = await crud.postData(AppLink.soloItem, {"id": id});
    return response.fold((l) => l, (r) => r);
  }


 
}
