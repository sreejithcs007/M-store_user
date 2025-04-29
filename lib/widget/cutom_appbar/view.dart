import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

// class CustomAppBar extends StatelessWidget{
//   final TextEditingController? controller;
//   final String hintText;
//   final VoidCallback? onCartTap;
//   final VoidCallback? onClearSearch;
//   final RxString? imageUrl;

//   const CustomAppBar(
//       {super.key,
//       this.controller,
//       this.hintText = "Search",
//       this.onCartTap,
//       this.onClearSearch,
//       this.imageUrl});



//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
//       color: const Color(0xFFF5F5F5),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Cart Icon aligned right
//           Row(
//             // mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(40),
//                 child:
//                     Assets.images.company.companyLogo.image(fit: BoxFit.cover),
//               ),
//               Spacer(),
//               Obx(() => CircleAvatar(
//                     maxRadius: 20, // Adjust radius as needed
//                     backgroundColor: const Color.fromARGB(255, 166, 164, 164),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(40),
//                       child: Image.network(
//                         formatImageUrl(imageUrl?.value),
//                         fit: BoxFit.cover,
//                         width: 80, // match the maxRadius * 2
//                         height: 80,
//                         errorBuilder: (context, error, stackTrace) => Icon(
//                           Icons.image,
//                           size: 20,
//                           color: const Color.fromARGB(255, 78, 77, 77),
//                         ),
//                       ),
//                     ),
//                   )),
//               Gap(10),
//               GestureDetector(
//                 onTap: onCartTap,
//                 child: Container(
//                   width: 50,
//                   height: 50,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(Icons.shopping_cart_outlined,
//                       color: Colors.orange),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           // Search bar
//           Container(
//             height: 50,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(30),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 4,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 isDense: true,
//                 hintText: hintText,
//                 hintStyle: const TextStyle(color: Colors.grey),
//                 prefixIcon: const Icon(Icons.search, color: Colors.black54),
//                 suffixIcon: GestureDetector(
//                   onTap: onClearSearch,
//                   child: const Icon(Icons.close, color: Colors.black54),
//                 ),
//                 border: InputBorder.none,
//                 contentPadding:
//                     const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





class CustomAppBar extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final VoidCallback? onCartTap;
  final VoidCallback? onClearSearch;
  final RxString? imageUrl;

  const CustomAppBar({
    super.key,
    this.controller,
    this.hintText = "Search",
    this.onCartTap,
    this.onClearSearch,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
      color: const Color(0xFFF5F5F5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            children: [
              // Logo as drawer button
              Builder(
                builder: (context) => GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Assets.images.company.companyLogo.image(
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Obx(() => CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: const Color.fromARGB(255, 166, 164, 164),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        formatImageUrl(imageUrl?.value),
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.image,
                          size: 20,
                          color: Color.fromARGB(255, 78, 77, 77),
                        ),
                      ),
                    ),
                  )),
              const Gap(10),
              GestureDetector(
                onTap: onCartTap,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.orange),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Search bar
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.black54),
                suffixIcon: GestureDetector(
                  onTap: onClearSearch,
                  child: const Icon(Icons.close, color: Colors.black54),
                ),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
