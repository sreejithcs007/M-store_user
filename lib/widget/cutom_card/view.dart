import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String currentPrice;
  final String oldPrice;
  final String quantityInfo;
  final VoidCallback? onAddToCart;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? productDetailsPageOnTap;
  final bool isFavorite;

  final Widget? image;
  final bool isListingPage;
  final bool oldPriceNeeded;

  const ProductCard({
    super.key,
    required this.productName,
    required this.currentPrice,
    required this.oldPrice,
    required this.quantityInfo,
    this.onAddToCart,
    this.onFavoriteToggle,
    this.isFavorite = false,
 
    this.image,
    this.isListingPage = false,
    this.oldPriceNeeded = true,
    this.productDetailsPageOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: productDetailsPageOnTap,
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
        child: isListingPage ? _buildColumnLayout() : _buildRowLayout(),
      ),
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
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: image ??
                  const Icon(Icons.image, size: 40, color: Colors.grey)),
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
                style: AppTextStyle().br16w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: onFavoriteToggle,
              child: SvgPicture.asset(isFavorite ? Assets.images.svg.redheart :  Assets.images.svg.greyheart,height: 20,width: 20,),
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
              style: AppTextStyle()
                  .br16w600
                  .copyWith(color: const Color(0xFFEE9700)),
            ),
            const SizedBox(width: 6),
            // if (oldPrice.isNotEmpty)
            if (oldPriceNeeded)
              Text(oldPrice,
                  style: AppTextStyle().br16w600.copyWith(
                      color: const Color(0xFFEE9700),
                      decoration: TextDecoration.lineThrough,
                      decorationColor: const Color(0xFFEE9700))),
            const SizedBox(width: 6),
            Text(
              quantityInfo,
              style: const TextStyle(color: Colors.grey),
            ),
            if (isListingPage == true)
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap:  onAddToCart ,
                  child: const Align(
                      child: Icon(Icons.shopping_cart_outlined,
                          color: Colors.grey, size: 18)),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),

        // Add to cart
        if (isListingPage == false)
          GestureDetector(
            onTap:  onAddToCart ,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFEE9700).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Add to cart",
                    style: AppTextStyle().br16w400,
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.shopping_cart,
                      color: Color(0xFFEE9700), size: 18),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
