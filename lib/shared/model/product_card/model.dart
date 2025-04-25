class ProductCardModel {
  String itemName;
  double itemCost;
  double previousCost;
  double qty;
  bool wishList;
  int id;
  String unit;
  String imageUrl;
  int? productId;

  ProductCardModel(
      {required this.itemName,
      required this.itemCost,
      required this.previousCost,
      required this.qty,
      required this.wishList,
      required this.id,
      this.unit = 'KG',
      required this.imageUrl,
      this.productId ,
      });
}
