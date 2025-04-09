class MyOrderModel {
  String orderId;
  String itemName;
  double itemRate;
  double itemQty;
  int paymentType;
  String deliveryStatus;
  double createdAt;

  MyOrderModel(
      {required this.orderId,
      required this.itemName,
      required this.itemRate,
      required this.itemQty,
      required this.paymentType,
      required this.createdAt,
      required this.deliveryStatus
      });
}
