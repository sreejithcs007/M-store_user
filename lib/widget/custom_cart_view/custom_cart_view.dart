import 'package:ecommerce/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomViewCartScreen extends StatelessWidget {
  const CustomViewCartScreen({super.key, required this.detailsPageOnTap});
  final VoidCallback detailsPageOnTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(Assets.images.svg.arrowLeft)),
          title: const Text('Items in your cart'),
        ),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: InkWell(
                  onTap: detailsPageOnTap,
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
                ),
              );
            }));
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
          child: const Icon(Icons.image, size: 40, color: Colors.grey),
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

  Widget _buildDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product name + favorite
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                "productName",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                // isFavorite ? Icons.favorite  //: Icons.favorite_border,
                Icons.favorite,
                // color: isFavorite ? Colors.red : Colors.grey,
                color: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),

        // Price and quantity info
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "currentPrice",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 6),
            // if (oldPrice.isNotEmpty)
            const Text(
              "/quantityInfo",
              style: TextStyle(color: Colors.grey),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {}, //enableActions ? onAddToCart : null,
                child: const Align(
                    child: Icon(Icons.shopping_cart_outlined,
                        color: Colors.grey, size: 18)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Add to cart
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "remove",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(10),
                    SvgPicture.asset(Assets.images.svg.delete),
                  ],
                ),
              ),
            ),
            const Gap(20),
            SvgPicture.asset(Assets.images.svg.minusSquare),
            const Gap(5),
            const Text('2'),
            const Gap(5),
            SvgPicture.asset(Assets.images.svg.add),
          ],
        ),
      ],
    );
  }
}
