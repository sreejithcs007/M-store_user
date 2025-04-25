import 'package:ecommerce/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyOrderCard extends StatelessWidget {
  final String productName;
  final String paymentType;
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
  final String orderDate;

  const MyOrderCard({
    super.key,
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
    required this.containerOntap,
    this.paymentType = 'Cash on Delivery',
    required this.orderDate,
  });

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
          children: [
            Text(
              'Order Id - $orderId',
              style: AppTextStyle().br14w600,
            ),
            Text(
              deliveryStatus,
              style: AppTextStyle().br16w600,
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Prevent overflow
          children: [
            // Image on the left
            Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: image ??
                    const Icon(Icons.image, size: 40, color: Colors.grey),
              ),
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
                style: AppTextStyle().br16w600,
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
            Text(currentPrice,
                style:
                    AppTextStyle().br14w600.copyWith(color: const Color(0xFFEE9700))),
            const Gap(6),
            Text(
              '/ $quantityInfo',
              style: AppTextStyle().br14w600.copyWith(color: const Color(0xFFB3B3B3)),
            ),
          ],
        ),
        const Gap(6),
        Text(
          paymentType,
          style: AppTextStyle().br16w400.copyWith(color: const Color(0xFF14AE5C)),
        ),
        const Gap(6),
        Text(
          orderDate,
          style: AppTextStyle().br14w400,
        ),
      ],
    );
  }
}
