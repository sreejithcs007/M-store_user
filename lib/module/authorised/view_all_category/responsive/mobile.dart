import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/details_page/responsive/details_page.dart';
import 'package:ecommerce/module/authorised/view_all_category/controller.dart';
import 'package:ecommerce/widget/custom_list_view/view.dart';
import 'package:ecommerce/widget/cutom_card/view.dart';
import 'package:ecommerce/widget/grid_view_dashboard/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// class ViewAllMobileScreen extends StatefulWidget {
//   const ViewAllMobileScreen({super.key, required this.controller});
//   final ViewAllController controller;

//   @override
//   _ViewAllMobileScreenState createState() => _ViewAllMobileScreenState();
// }

// class _ViewAllMobileScreenState extends State<ViewAllMobileScreen>
//     with TickerProviderStateMixin {
//   bool isGridView = true;
//   final List<Map<String, String>> products = [
//     {"title": "Tomato", "price": "25.00", "quantity": "1 KG"},
//     {"title": "Carrot", "price": "65.00", "quantity": "1 KG"},
//     {"title": "Onion", "price": "40.00", "quantity": "1 KG"},
//     {"title": "Potato", "price": "33.00", "quantity": "1 KG"},
//     {"title": "Capsicum", "price": "72.00", "quantity": "1 KG"},
//     {"title": "Broccoli", "price": "60.00", "quantity": "1 KG"},
//     {"title": "Cabbage", "price": "30.00", "quantity": "1 KG"},
//     {"title": "Beetroot", "price": "35.00", "quantity": "1 KG"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF5F5F5),
//         appBar: AppBar(
//           title:
//               const Text("Vegetables", style: TextStyle(color: Colors.black)),
//           backgroundColor: Colors.white,
//           elevation: 0,
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.shopping_cart_outlined,
//                   color: Colors.orange),
//               onPressed: () {},
//             )
//           ],
//           bottom: const TabBar(
//             labelColor: Colors.orange,
//             unselectedLabelColor: Colors.grey,
//             tabs: [
//               Tab(text: "Vegetables"),
//               Tab(text: "Fruits"),
//               Tab(text: "Stationery"),
//             ],
//           ),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
//               child: Row(
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.filter_alt_outlined,
//                         color: Colors.orange),
//                     label: const Text("Filters by",
//                         style: TextStyle(color: Colors.orange)),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         side: const BorderSide(color: Colors.orange),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   ElevatedButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.sort, color: Colors.orange),
//                     label: const Text("Sort by",
//                         style: TextStyle(color: Colors.orange)),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         side: const BorderSide(color: Colors.orange),
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     icon: Icon(
//                       isGridView ? Icons.view_list : Icons.grid_view,
//                       color: Colors.orange,
//                     ),
//                     onPressed: () => setState(() => isGridView = !isGridView),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Expanded(
//               child: TabBarView(
//                 children: List.generate(3, (index) {
//                   return isGridView ? _buildGridView() : _buildListView();
//                 }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildGridView() {
//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: GridView.builder(
//         itemCount: products.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           childAspectRatio: 3 / 3.5,
//         ),
//         itemBuilder: (context, index) {
//           final item = products[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => ProductDetailScreen(
//                     productName: item["title"]!,
//                     price: item["price"]!,
//                     quantity: item["quantity"]!,
//                   ),
//                 ),
//               );
//             },
//             child: ProductCard(
//               isListingPage: true,
//               productName: item["title"]!,
//               currentPrice: item["price"]!,
//               oldPrice: '',
//               quantityInfo: "/ ${item["quantity"]!}",
//               isFavorite: false,
//               enableActions: true,
//               onAddToCart: () {},
//               onFavoriteToggle: () {},
//             ),
//           );
//         },
//       ),
//     );
//   }

//   // Widget _buildListView() {
//   //   return ListView.builder(
//   //     itemCount: products.length,
//   //     itemBuilder: (context, index) {
//   //       final item = products[index];
//   //       return ProductListItem(
//   //         productName: item["title"]!,
//   //         price: item["price"]!,
//   //         quantity: item["quantity"]!,
//   //         isFavorite: false,
//   //         onAddToCart: () {},
//   //         onFavoriteToggle: () {},
//   //       );
//   //     },
//   //   );
//   // }

//   Widget _buildListView() {
//     return ListView.builder(
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         final item = products[index];
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => ProductDetailScreen(
//                   productName: item["title"]!,
//                   price: item["price"]!,
//                   quantity: item["quantity"]!,
//                 ),
//               ),
//             );
//           },
//           child: ProductListItem(
//             productName: item["title"]!,
//             price: item["price"]!,
//             quantity: item["quantity"]!,
//             isFavorite: false,
//             onAddToCart: () {},
//             onFavoriteToggle: () {},
//           ),
//         );
//       },
//     );
//   }
// }

class ViewAllCategoryMobileScreen extends StatelessWidget {
  const ViewAllCategoryMobileScreen({super.key, required this.controller});
  final ViewAllController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              Assets.images.svg.arrowLeft,
            )),
        title: Text('Categories',style: TextStyle(color: Colors.black),),
      ),
      body: Obx(
        () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 2.5,
          ),
          itemCount: controller.categories.value.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
              child: CategoryGridItem(
                  onContainerTap: () => null,
                  title: controller.categories.value[index].categoryName),
            );
          },
        ),
      ),
    );
  }
}
