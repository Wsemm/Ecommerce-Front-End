import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);

  getDataDeliveryOnTheWay() async {
    var response =
        await crud.postData(AppLink.ordersDelivery, {"orderstatus": "2"});

    return response.fold((l) => l, (r) => r);
  }

  getData(String userid) async {
    var response = await crud.postData(AppLink.orders, {"userid": userid});

    return response.fold((l) => l, (r) => r);
  }

  deleteData(String ordersid) async {
    var response =
        await crud.postData(AppLink.orderDelete, {"ordersid": ordersid});

    return response.fold((l) => l, (r) => r);
  }

  ordersDone(String userid) async {
    var response = await crud.postData(AppLink.orderDone, {"userid": userid});

    return response.fold((l) => l, (r) => r);
  }

  ordersPending(String userid) async {
    var response =
        await crud.postData(AppLink.orderPending, {"userid": userid});

    return response.fold((l) => l, (r) => r);
  }
}
