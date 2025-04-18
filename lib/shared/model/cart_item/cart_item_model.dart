class CartItem {
  final int id;
  final String name;
  final String price;
  final int quantity;
  final bool isFavorite;

  CartItem( {
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.isFavorite,
  });
}
