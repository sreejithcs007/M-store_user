class ProductCardModel {
  String itemName;
  double itemCost;
  double previousCost;
  double qty;
  bool wishList;
  int id;

  ProductCardModel(
      {required this.itemName,
      required this.itemCost,
      required this.previousCost,
      required this.qty,
      required this.wishList,
      required this.id
      
      });
}
