import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyOrderCard extends StatelessWidget {
  final String productName;
  final String currentPrice;
  final String quantityInfo;
  final String deliveryStatus;
  final String orderId;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavoriteToggle;
  final bool enableActions;
  final Widget? image;
  final bool isListingPage;
  final VoidCallback containerOntap;

  const MyOrderCard(
      {super.key,
      required this.productName,
      required this.currentPrice,
      required this.quantityInfo,
      this.onAddToCart,
      this.onFavoriteToggle,
      this.enableActions = false,
      this.image,
      this.isListingPage = false,
      required this.deliveryStatus,
      required this.orderId,
      required this.containerOntap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: containerOntap,
      child: Container(
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
        child: _buildRowLayout(),
      ),
    );
  }

  Widget _buildRowLayout() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Order Id - $orderId'), Text(deliveryStatus)],
        ),
        Row(
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
              child: image ??
                  const Icon(Icons.image, size: 40, color: Colors.grey),
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
        ),
      ],
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
            const Gap(6),
            Text(
              quantityInfo,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const Gap(6),
        Text(
          'prepaid',
          style: const TextStyle(color: Colors.grey),
        ),
        const Gap(6),
        Text(
          '12/1/2025',
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
