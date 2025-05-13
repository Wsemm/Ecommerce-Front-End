class EndPoint {
  static const String baseUrl = "http://192.168.1.6/ecommerce/";
  //====================  Notfication  ============================================================
  static const String notfication = "send_notfication.php";
  //====================  Auth user ============================================================

  static const String signUp = "auth/signup.php";
  static const String login = "auth/login.php";
  static const String verifyCodeSignUP = "auth/verfiycode.php";
  static const String resendverifyCode = "auth/resendVerifycode.php";

  //====================  Forget Password ============================================================
  static const String checkEmail = "ForgetPassword/checkEmail.php";
  static const String resetPassword = "ForgetPassword/resetPassword.php";
  static const String verifyCodeForgetPassword =
      "ForgetPassword/verifyCode.php";

//====================  Home ============================================================
  static const String homePage = "home.php";

//====================  Items ============================================================

  static const String items = "items/items.php";
  static const String search = "items/search.php";
  static const String topSelling = "topselling.php";

//====================  Favorite ============================================================
  static const String favoriteAdd = "items/favorite/add.php";
  static const String favoriteRemove = "items/favorite/remove.php";
  static const String myFavorite = "items/favorite/view.php";
  static const String deleteMyFavorite =
      "items/favorite/deleteFromMyFavorite.php";
  static const String soloItem = "items/favorite/item.php";

//====================  Cart ============================================================
  static const String cartView = "cart/view.php";
  static const String cartAdd = "cart/add.php";
  static const String cartRemove = "cart/remove.php";
  static const String cartItemsCount = "cart/countCartItems.php";

  //====================  Address ============================================================
  static const String addressView = "address/view.php";
  static const String addressAdd = "address/add.php";
  static const String addressDelete = "address/delete.php";
  static const String addressEdit = "address/edit.php";
  //====================  Cupoun ============================================================
  static const String couponCheck = "coupon/couponCheck.php";
  //====================  Orders ============================================================
  static const String checkOut = "orders/checkout.php";
  static const String orders = "orders/orders.php";
  static const String ordersDetails = "orders/deatils.php";
  static const String orderDelete = "orders/delete.php";
  static const String orderDone = "orders/done.php";
  static const String orderPending = "orders/pending.php";
  static const String offers = "offers.php";
  static const String rateing = "orders/rating.php";
}

class ApiKey {
  static String email = "email";
  static String message = "message";
  static String statusCode = "statusCode";
  static String accessToken = "accessToken";
  static String authorization = "Authorization";
  static String error = "error";
}
