import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class Home_Data {
  Crud crud;

  Home_Data(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.HomePage, {});

    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.search, {"search": search});

    return response.fold((l) => l, (r) => r);
  }

  getTopSellingData() async {
    var response = await crud.postData(AppLink.topSelling, {});

    return response.fold((l) => l, (r) => r);
  }
}
