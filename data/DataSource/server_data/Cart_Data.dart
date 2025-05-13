import 'package:ecommerce_project/core/web_services/api/end_points.dart';
import 'package:ecommerce_project/core/web_services/errors/exspitions.dart';
import 'package:ecommerce_project/data/DataSource/server_data/api.dart';

import '../../../linkApi.dart';

import '../../../core/class/Crud.dart';

class CartData extends Api {
  Crud crud;
  CartData(this.crud);

  addCart(String userid, String itemid) async {
    try {
      final response = await api
          .post(EndPoint.cartAdd, data: {"userid": userid, "itemid": itemid});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  removeCart(String userid, String itemid) async {
    try {
      final response = await api.post(EndPoint.cartRemove,
          data: {"userid": userid, "itemid": itemid});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  getCartItemCount(String userid, String itemid) async {
    try {
      final response = await api.post(EndPoint.cartItemsCount,
          data: {"userid": userid, "itemid": itemid});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  getCart(String userid) async {
    try {
      final response =
          await api.post(EndPoint.cartView, data: {"userid": userid});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  checkCoupon(String couponName) async {
    try {
      final response = await api
          .post(EndPoint.couponCheck, data: {"couponname": couponName});
    } on ServerException catch (e) {
      return e.toString();
    }
  }

  //=============================================
}
