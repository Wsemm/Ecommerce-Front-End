import 'Home_Controller.dart';
import 'Search_Controller.dart';

import '../core/constant/routs.dart';
import '../core/services/services.dart';
import '../data/DataSource/remote/Items_Data.dart';
import '../data/model/items_Model.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/functions/handlingData_controller.dart';
import 'Cart_Controller.dart';
import 'MyFavorite_Controller.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends MySearchController {
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  List categories = [];
  int? selectedCat;
  String? catid;
  HomeControllerImp homeController = Get.find();

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catid = Get.arguments['catid'];

    getItems(catid!);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);

    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData(
        categoryid, myServices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(itemsModel) async {
    // testController.itemsModel = itemsModel;
    await Get.toNamed(AppRoute.productDetails,
        arguments: {"itemsmodel": itemsModel});
  }

  goToPageFavorite() {
    Get.toNamed(AppRoute.myfavorite, arguments: {
      "catid": catid.toString(),
    });
  }
}
