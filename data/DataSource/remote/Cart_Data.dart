import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class CartData {
  Crud crud;

  CartData(this.crud);
  addCart(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.cartAdd, {"userid": userid, "itemid": itemid});

    return response.fold((l) => l, (r) => r);
  }

  removeCart(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.cartRemove, {"userid": userid, "itemid": itemid});

    return response.fold((l) => l, (r) => r);
  }

  CartItemsCount(String userid, String itemid) async {
    var response = await crud
        .postData(AppLink.cartItemsCount, {"userid": userid, "itemid": itemid});

    return response.fold((l) => l, (r) => r);
  }

  CartView(String userid) async {
    var response = await crud.postData(AppLink.cartView, {
      "userid": userid,
    });

    return response.fold((l) => l, (r) => r);
  }

  CheckCoupon(String couponname) async {
    var response = await crud.postData(AppLink.couponCheck, {
      "couponname": couponname,
    });

    return response.fold((l) => l, (r) => r);
  }
}
