import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final String productName;
  final String price;
  final String quantity;
  final bool isFavorite;
  final VoidCallback onAddToCart;
  final VoidCallback onFavoriteToggle;

  const ProductListItem({
    super.key,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.isFavorite,
    required this.onAddToCart,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 60,
          height: 60,
          color: Colors.orange[50], // Placeholder for image
          child: const Icon(Icons.image, color: Colors.orange),
        ),
        title: Text(productName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$price / $quantity", style: const TextStyle(color: Colors.grey)),
        trailing: Column(
          children: [
            IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
              onPressed: onFavoriteToggle,
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.orange),
              onPressed: onAddToCart,
            ),
          ],
        ),
      ),
    );
  }
}
