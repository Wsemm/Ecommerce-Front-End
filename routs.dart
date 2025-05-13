import 'core/constant/routs.dart';
import 'view/screen/auth/ForgetPassword/ForgetPassword.dart';
import 'view/screen/auth/ForgetPassword/ResetPassword.dart';
import 'view/screen/auth/ForgetPassword/SuccessResetPassword.dart';
import 'view/screen/auth/SuccessSignUp.dart';
import 'view/screen/auth/ForgetPassword/VerfiyCode.dart';
import 'view/screen/auth/VerifiyCodeSignUp.dart';
import 'view/screen/homeScreen.dart';
import 'view/screen/itemsScreen.dart';
import 'view/screen/myFavorite.dart';
import 'view/screen/offers.dart';
import 'view/screen/onboarding.dart';
import 'view/screen/auth/signUp.dart';
import 'view/screen/orders/CheckOut.dart';
import 'view/screen/orders/details.dart';
import 'view/test_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'core/middleware/MyMiddleWare.dart';
import 'view/screen/orders/my_order.dart';
import 'view/screen/address/add.dart';
import 'view/screen/address/view.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/cart.dart';
import 'view/screen/language.dart';
import 'view/screen/productDetails.dart';

class AppRoute {
  static const String login = "/login";
  static const String onBoarding = "/onboarding";
  static const String singUp = "/singUp";
  static const String forgetPassword = "/forgetpassword";
  static const String verfiyCode = "/verfiycode";
  static const String resetPassword = "/resetpassword";
  static const String successSignUp = "/successsingup";
  static const String successResetPassword = "/successresetpassword";
  static const String verfiyCodeSignUp = "/verifiycodesignup";
  static const String homePage = "/homePage";
  static const String itemScreen = "/itemsScreen";
  static const String productDetails = "/productDetails";
  static const String myfavorite = "/myfavorite";
  static const String cart = "/cart";
  static const String addressView = "/addressView";
  static const String addAddress = "/addAddress";
  static const String checkOut = "/checkout";
  static const String myOrder = "/myorder";
  static const String orderDetails = "/orderDetails";
  static const String offers = "/offers";
}

// CacheHelper().getDataString(key: "step")!=1? AppRoute.homePage :
List<GetPage<dynamic>>? getPages = [
  // Auth

  GetPage(
      name: "/", page: () => const language(), middlewares: [MyMiddleWare()]),

  // name: "/", page: () => const Cart(),),

  //   name: "/", page: () => const TestView(),
  // ),

  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.singUp, page: () => const SignUp()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  // OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //====================== App Pages ======================
  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.itemScreen, page: () => const ItemsScreen()),
  GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  //====================== Address ======================

  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addAddress, page: () => const AddressAdd()),
  GetPage(name: AppRoute.checkOut, page: () => const CheckOut()),
  GetPage(name: AppRoute.myOrder, page: () => const My_Order()),
  GetPage(name: AppRoute.orderDetails, page: () => const OrderDetails()),
  GetPage(name: AppRoute.offers, page: () => const Offers()),
];
