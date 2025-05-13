class AppLink {
  // static const String server = "http://192.168.1.9/ecommerce";
  static const String server = "http://www.php-api.fwh.is/?i=2";

  // static const String server = "waseemdawoodi.onlinewebshop.net";
  // static const String server = "https://sql303.infinityfree.com/ecommerce";
  // static const String server = "https://myecommerce.wuaze.com/ecommerce";

//====================  Image ============================================================

  static const String imagestatic = "$server/upload";

  static const String imageCategories = "$imagestatic/categories";

  static const String imageItems = "$imagestatic/items";
//====================  Test ============================================================

  static const String test = "$server/test.php";

//====================  Notfication  ============================================================
  static const String notfication = "$server/send_notfication.php";

//====================  Auth user ============================================================

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifyCodeSignUP = "$server/auth/verfiycode.php";
  static const String resendverifyCode = "$server/auth/resendVerifycode.php";

//====================  Forget Password ============================================================
  static const String checkEmail = "$server/ForgetPassword/checkEmail.php";
  static const String resetPassword =
      "$server/ForgetPassword/resetPassword.php";
  static const String verifyCodeForgetPassword =
      "$server/ForgetPassword/verifyCode.php";

//====================  Home ============================================================
  static const String HomePage = "$server/home.php";

//====================  Items ============================================================

  static const String items = "$server/items/items.php";
  static const String search = "$server/items/search.php";
  static const String topSelling = "$server/topselling.php";

//====================  Favorite ============================================================
  static const String favoriteAdd = "$server/items/favorite/add.php";
  static const String favoriteRemove = "$server/items/favorite/remove.php";
  static const String myFavorite = "$server/items/favorite/view.php";
  static const String deleteMyFavorite =
      "$server/items/favorite/deleteFromMyFavorite.php";
  static const String soloItem = "$server/items/favorite/item.php";

//====================  Cart ============================================================
  static const String cartView = "$server/cart/view.php";
  static const String cartAdd = "$server/cart/add.php";
  static const String cartRemove = "$server/cart/remove.php";
  static const String cartItemsCount = "$server/cart/countCartItems.php";

  //====================  Address ============================================================
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String addressEdit = "$server/address/edit.php";
  //====================  Cupoun ============================================================
  static const String couponCheck = "$server/coupon/couponCheck.php";
  //====================  Orders ============================================================
  static const String checkOut = "$server/orders/checkout.php";
  static const String orders = "$server/orders/orders.php";
  static const String ordersDetails = "$server/orders/deatils.php";
  static const String orderDelete = "$server/orders/delete.php";
  static const String orderDone = "$server/orders/done.php";
  static const String orderPending = "$server/orders/pending.php";
  static const String offers = "$server/offers.php";
  static const String rateing = "$server/orders/rating.php";

//=========================== Delivery ===========================

//====================  Auth Delivery ============================================================
  static const String loginDelivery = "$server/delivery/auth/login.php";
//====================  Orders Delivery ============================================================
  static const String ordersDelivery = "$server/delivery/orders/view.php";
  static const String takeorder = "$server/delivery/orders/takeorder.php";
  static const String cancelorder = "$server/delivery/orders/cancelorder.php";
  static const String currentorders =
      "$server/delivery/orders/currentorders.php";
  static const String ordersdelivered =
      "$server/delivery/orders/ordersdelivered.php";
  static const String ordersdeliveredview =
      "$server/delivery/orders/ordersdeliveredview.php";

//=========================== Admin ===========================

//=========================== Auth ===========================
  static const String loginAdmin = "$server/admin/auth/login.php";

//=========================== Orders ===========================

  static const String getAllOrders = "$server/admin/orders/getallorders.php";
  static const String getorders = "$server/admin/orders/getorders.php";
  static const String getOrderDetailsAdmin =
      "$server/admin/orders/getorderdetails.php";
  static const String getordersitems =
      "$server/admin/orders/getordersitems.php";
  static const String users = "$server/admin/users.php";
  static const String category = "$server/admin/category.php";
  static const String editcategory = "$server/admin/editcategory.php";
  static const String searchData = "$server/admin/search.php";
  static const String editUser = "$server/admin/edituser.php";
  static const String deleteuser = "$server/admin/deleteuser.php";
  static const String getItemsAdminView = "$server/admin/items.php";
  static const String getAdminsView = "$server/admin/admins.php";
  static const String getDeliveriesData = "$server/admin/deliveries.php";
  static const String addItems = "$server/admin/additems.php";
  static const String edititems = "$server/admin/edititems.php";
  static const String deleteItems = "$server/admin/deleteitems.php";

  static const String approveOrder = "$server/admin/orders/approveorder.php";

  static const String addDelivery = "$server/admin/signup.php";
  static const String editDelivery = "$server/admin/editdelivery.php";
  static const String editAdmin = "$server/admin/editadmin.php";
  static const String addAdmin = "$server/admin/signupadmin.php";
  static const String addcategory = "$server/admin/addcategory.php";

  static const String testlogin =
      "https://lemon-backend-kcmg.onrender.com/auth/register";
}
