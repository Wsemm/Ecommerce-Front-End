import 'Cart_Controller.dart';

import '../core/constant/routs.dart';
import '../core/services/services.dart';
import '../data/DataSource/remote/home_Data.dart';
import 'package:get/get.dart';
import '../core/class/statusRequest.dart';
import '../core/functions/handlingData_controller.dart';
import '../core/localization/changeLocal_controller.dart';
import 'Search_Controller.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryid);
  changelang();
}

class HomeControllerImp extends MySearchController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  Home_Data homeData = Home_Data(Get.find());
  List categories = [], items = [], topSellingItems = [], textdata = [];
  LocaleController localcontroller = Get.put(LocaleController());
  String? username, lang, id;

  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  changelang() {
    localcontroller.changeLang(
        myServices.sharedPreferences.getString("lang") == "ar" ? "en" : "ar");
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    // print("=============================== Controllerdasdsa $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        textdata.addAll(response["text"]['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  getTopSellingData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getTopSellingData();
    // print("=============================== Controllerdasdsa $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'success') {
        // categories.addAll(response['categories']['data']);
        topSellingItems.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  //   List<ItemsModel> listData = [];
  // TextEditingController? search;
  // bool isSearch = false;
  // search = TextEditingController();

  // cheackSearch(String val) {
  //   if (val == "") {
  //     isSearch = false;
  //     update();
  //   }
  // }

  // onSearchItems() {
  //   isSearch = true;
  //   SearchData();
  //   update();
  // }

  // SearchData() async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await homeData.searchData(search!.text);
  //   // print("=============================== Controllerdasdsa $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.sucess == statusRequest) {
  //     if (response['status'] == 'success') {
  //       listData.clear();
  //       List responsedata = response['data'];
  //       listData.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
  //     } else {
  //       statusRequest = StatusRequest.failuer;
  //     }
  //   }
  //   update();
  // }

  // goToPageProductDetails(itemsModel) {
  //   Get.toNamed(AppRoute.productDetails, arguments: {"itemsmodel": itemsModel});
  // }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.itemScreen, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catid": categoryid,
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    getdata();
    getTopSellingData();
    initialData();
    super.onInit();
  }
}
