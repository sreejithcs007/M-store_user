import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final String productName;
  final String price;
  final int quantity;
  final bool isFavorite;

  // Modes: Cart or Product
  final bool isCart;

  // Cart mode actions
  final VoidCallback? onRemove;
  final VoidCallback? onQuantityAdd;

  // Common actions
  final VoidCallback? onAddToCart;
  final VoidCallback onFavoriteToggle;

  const ProductListItem({
    super.key,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.isFavorite,
    this.isCart = false,
    this.onRemove,
    this.onQuantityAdd,
    this.onAddToCart,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isCart)
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, color: Colors.orange),
              ),
            if (!isCart) const SizedBox(width: 12),
            // Main content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productName,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("$price / $quantity",
                      style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  isCart
                      ? GestureDetector(
                          onTap: onRemove,
                          child: const Row(
                            children: [
                              Icon(Icons.delete_outline,
                                  color: Colors.orange, size: 20),
                              SizedBox(width: 4),
                              Text("Remove",
                                  style: TextStyle(color: Colors.orange)),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: onFavoriteToggle,
                ),
                isCart
                    ? Row(
                        children: [
                          Text('$quantity',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: onQuantityAdd,
                            child: const Icon(Icons.add_box_outlined,
                                color: Colors.orange),
                          ),
                        ],
                      )
                    : IconButton(
                        icon: const Icon(Icons.shopping_cart_outlined,
                            color: Colors.orange),
                        onPressed: onAddToCart,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
