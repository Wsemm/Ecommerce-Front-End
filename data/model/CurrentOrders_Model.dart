class CurrentOrders_Model {
  int? ordersdeliveryId;
  int? ordersdeliveryDeliveryid;
  int? ordersdeliveryOrderid;
  String? userName;
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

  CurrentOrders_Model(
      {this.ordersdeliveryId,
      this.ordersdeliveryDeliveryid,
      this.ordersdeliveryOrderid,
      this.userName,
      this.orderId,
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
      });

  CurrentOrders_Model.fromJson(Map<String, dynamic> json) {
    ordersdeliveryId = json['ordersdelivery_id'];
    ordersdeliveryDeliveryid = json['ordersdelivery_deliveryid'];
    ordersdeliveryOrderid = json['ordersdelivery_orderid'];
    userName = json['user_name'];
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
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ordersdelivery_id'] = this.ordersdeliveryId;
    data['ordersdelivery_deliveryid'] = this.ordersdeliveryDeliveryid;
    data['ordersdelivery_orderid'] = this.ordersdeliveryOrderid;
    data['user_name'] = this.userName;
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
    
    return data;
  }
}
