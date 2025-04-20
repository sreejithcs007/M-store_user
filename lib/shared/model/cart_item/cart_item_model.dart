class CartItemCustomModel {
  final int id;
  final int productId;
  final String name;
  final String price;
  int? quantity;
  final bool isFavorite;
  final String unit;
  final List<String>? imageUrl;

  CartItemCustomModel(
      {required this.id,
      required this.productId,
      required this.name,
      required this.price,
      required this.quantity,
      required this.isFavorite,
      this.imageUrl,
      this.unit = 'KG'});
}
