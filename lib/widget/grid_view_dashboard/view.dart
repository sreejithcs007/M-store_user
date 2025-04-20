// import 'package:ecommerce/core/constants/text_style.dart';
// import 'package:flutter/material.dart';

// class CategoryGridItem extends StatefulWidget {
//   final String title;

//   final VoidCallback onContainerTap;

//   const CategoryGridItem(
//       {super.key, required this.title, required this.onContainerTap});

//   @override
//   State<CategoryGridItem> createState() => _CategoryGridItemState();
// }

// class _CategoryGridItemState extends State<CategoryGridItem> {
//   bool isFavorited = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onContainerTap,
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   isFavorited = !isFavorited;
//                 });
//               },
//               child: Align(
//                 alignment: Alignment.topRight,
//                 child: Icon(
//                   Icons.favorite_border,
//                   color: isFavorited ? Colors.red : Colors.black,
//                 ),
//               ),
//             ),
//             const Spacer(),
//             Center(
//               child: Text(
//                 widget.title,
//                 style: AppTextStyle().br16w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// // }

// import 'package:flutter/material.dart';

// class CategoryGridItem extends StatelessWidget {
//   final String imageUrl;
//   final bool isFavourite;
//   final String title;
//   final VoidCallback? onTap;

//   const CategoryGridItem({
//     super.key,
//     required this.imageUrl,
//     required this.isFavourite,
//     required this.title,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         // width: 120,
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 4,
//               offset: Offset(2, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.network(
//                     imageUrl,
//                     // width: 100,
//                     // height: 100,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => Container(
//                       // width: 100,
//                       // height: 100,
//                       width: double.infinity,
//                       color: Colors.grey.shade200,
//                       child: const Icon(Icons.broken_image, color: Colors.grey),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 4,
//                   right: 4,
//                   child: Icon(
//                     isFavourite ? Icons.favorite : Icons.favorite_border,
//                     color: isFavourite ? Colors.red : Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
        width: 100,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
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
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 90,
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
                Positioned(
                  top: 6,
                  right: 6,
                  child: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: isFavourite ? Colors.red : Colors.grey,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(title, style: AppTextStyle().br16w600),
          ],
        ),
      ),
    );
  }
}
