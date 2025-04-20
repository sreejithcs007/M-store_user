class MyOrderModel {
  String orderId;
  String itemName;
  String itemOrderId;
  double itemRate;
  double itemQty;
  String paymentType;
  String deliveryStatus;
  String createdAt;
  List<String> imageUrl;
  String unit;

  MyOrderModel(
      {required this.orderId,
      required this.itemName,
      required this.itemRate,
      required this.itemQty,
      required this.paymentType,
      required this.createdAt,
      required this.deliveryStatus,
      required this.itemOrderId,
      required this.imageUrl,
      this.unit = '',
      });
}
