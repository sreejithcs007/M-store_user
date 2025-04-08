import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String currentPrice;
  final String oldPrice;
  final String quantityInfo;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavoriteToggle;
  final bool isFavorite;
  final bool enableActions;
  final Widget? image;
  final  bool isListingPage;

  const ProductCard({
    super.key,
    required this.productName,
    required this.currentPrice,
    required this.oldPrice,
    required this.quantityInfo,
    this.onAddToCart,
    this.onFavoriteToggle,
    this.isFavorite = false,
    this.enableActions = false,
    this.image,
    this.isListingPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: isListingPage ? _buildColumnLayout() : _buildRowLayout(),
    );
  }

  Widget _buildRowLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Prevent overflow
      children: [
        // Image on the left
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: image ?? const Icon(Icons.image, size: 40, color: Colors.grey),
        ),
        const SizedBox(width: 16),

        // Details next to image
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildDetails()],
          ),
        ),
      ],
    );
  }

  Widget _buildColumnLayout() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image on top
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                image ?? const Icon(Icons.image, size: 30, color: Colors.grey),
          ),
          const SizedBox(height: 12),

          // Product details below image
          _buildDetails(),
        ],
      ),
    );
  }

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product name + favorite
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                productName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: enableActions ? onFavoriteToggle : null,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),

        // Price and quantity info
        Row(
           mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              currentPrice,
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 6),
            if (oldPrice.isNotEmpty)
              Text(
                oldPrice,
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.orange,
                ),
              ),
            const SizedBox(width: 6),
            Text(
              quantityInfo,
              style: const TextStyle(color: Colors.grey),
            ),
            if(isListingPage == true)
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: enableActions ? onAddToCart : null,
                  child: const Align(
                      child: Icon(Icons.shopping_cart_outlined,
                          color: Colors.grey, size: 18)),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),

        // Add to cart
        if(isListingPage == false)
        GestureDetector(
          onTap: enableActions ? onAddToCart : null,
          child: Container(
            padding:  const EdgeInsets.symmetric(horizontal: 12, vertical:6),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Add to cart",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.shopping_cart, color: Colors.orange, size: 18),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
