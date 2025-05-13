class MyOrders_Model {
  int? orderId;
  int? orderUserid;
  int? orderAddress;
  int? orderType;
  int? orderPricedelivry;
  int? orderPrice;
  int? orderTotalprice;
  int? orderCoupon;
  String? orderDatetime;
  int? orderPaymentmethod;
  int? orderStatus;
  int? ordersRating;
  String? ordersNoterating;
  int? addressId;
  int? addressUserid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  int? addressLat;
  int? addressLang;

  MyOrders_Model(
      {this.orderId,
      this.orderUserid,
      this.orderAddress,
      this.orderType,
      this.orderPricedelivry,
      this.orderPrice,
      this.orderTotalprice,
      this.orderCoupon,
      this.orderDatetime,
      this.orderPaymentmethod,
      this.orderStatus,
      this.ordersRating,
      this.ordersNoterating,
      this.addressId,
      this.addressUserid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLang});

  MyOrders_Model.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderAddress = json['order_address'];
    orderType = json['order_type'];
    orderPricedelivry = json['order_pricedelivry'];
    orderPrice = json['order_price'];
    orderTotalprice = json['order_totalprice'];
    orderCoupon = json['order_coupon'];
    orderDatetime = json['order_datetime'];
    orderPaymentmethod = json['order_paymentmethod'];
    orderStatus = json['order_status'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLang = json['address_lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_userid'] = this.orderUserid;
    data['order_address'] = this.orderAddress;
    data['order_type'] = this.orderType;
    data['order_pricedelivry'] = this.orderPricedelivry;
    data['order_price'] = this.orderPrice;
    data['order_totalprice'] = this.orderTotalprice;
    data['order_coupon'] = this.orderCoupon;
    data['order_datetime'] = this.orderDatetime;
    data['order_paymentmethod'] = this.orderPaymentmethod;
    data['order_status'] = this.orderStatus;
    data['orders_rating'] = this.ordersRating;
    data['orders_noterating'] = this.ordersNoterating;
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_lang'] = this.addressLang;
    return data;
  }
}
