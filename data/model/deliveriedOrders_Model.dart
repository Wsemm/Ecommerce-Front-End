class DeliveriesOrders_Model {
  int? ordersdeliveredId;
  int? ordersdeliveredDeliveryid;
  int? ordersdeliveredOrderid;
  int? ordersdeliveredPrice;
  int? ordersdeliveredPricedelivery;
  String? ordersdeliveredDate;

  DeliveriesOrders_Model(
      {this.ordersdeliveredId,
      this.ordersdeliveredDeliveryid,
      this.ordersdeliveredOrderid,
      this.ordersdeliveredPrice,
      this.ordersdeliveredPricedelivery,
      this.ordersdeliveredDate});

  DeliveriesOrders_Model.fromJson(Map<String, dynamic> json) {
    ordersdeliveredId = json['ordersdelivered_id'];
    ordersdeliveredDeliveryid = json['ordersdelivered_deliveryid'];
    ordersdeliveredOrderid = json['ordersdelivered_orderid'];
    ordersdeliveredPrice = json['ordersdelivered_price'];
    ordersdeliveredPricedelivery = json['ordersdelivered_pricedelivery'];
    ordersdeliveredDate = json['ordersdelivered_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ordersdelivered_id'] = this.ordersdeliveredId;
    data['ordersdelivered_deliveryid'] = this.ordersdeliveredDeliveryid;
    data['ordersdelivered_orderid'] = this.ordersdeliveredOrderid;
    data['ordersdelivered_price'] = this.ordersdeliveredPrice;
    data['ordersdelivered_pricedelivery'] = this.ordersdeliveredPricedelivery;
    data['ordersdelivered_date'] = this.ordersdeliveredDate;
    return data;
  }
}
