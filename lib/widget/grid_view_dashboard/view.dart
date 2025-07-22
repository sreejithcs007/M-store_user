

import 'package:ecommerce/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  final String imageUrl;
  final bool isFavourite;
  final String title;
  final VoidCallback? onTap;

  const CategoryGridItem({
    super.key,
    required this.imageUrl,
    required this.isFavourite,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 180,
          maxHeight: 220,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Flexible image that grows but respects min/max
            Expanded(
              flex: 4,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 80,
                  maxHeight: 120,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.image,
                        size: 36,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Fixed space for text at the bottom
            SizedBox(
              height: 20,
              child: Center(
                child: Text(
                  title,
                  style: AppTextStyle().br16w600,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
