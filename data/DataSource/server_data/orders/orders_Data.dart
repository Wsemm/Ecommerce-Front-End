import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../../linkApi.dart';

import '../../../../core/class/Crud.dart';

class OrdersData extends Api {
  Crud crud;

  OrdersData(this.crud);

  getUserOrders(String userid) async {
    try {
      final response = await api.post(EndPoint.orders, data: {
        "userid": userid,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  DeleteOrder(String ordersid) async {
    try {
      final response = await api.post(EndPoint.orderDelete, data: {
        "ordersid": ordersid,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  getDoneOrders(String userid) async {
    try {
      final response = await api.post(EndPoint.orderDone, data: {
        "userid": userid,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  getPendingOrders(String userid) async {
    try {
      final response = await api.post(EndPoint.orderPending, data: {
        "userid": userid,
      });
    } on ServerException catch (e) {
      return e.toString();
    }
  }

//=========================================

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
