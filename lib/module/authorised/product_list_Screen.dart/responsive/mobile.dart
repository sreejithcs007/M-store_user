import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/product_list_Screen.dart/controller.dart';
import 'package:ecommerce/shared/model/cart_item/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// class ShoppingPage extends StatelessWidget {
//   final ProductListScreenController controller;
//   final List<Map<String, String>> vegetables = [
//     {'name': 'Tomato', 'price': '25.00'},
//     {'name': 'Carrot', 'price': '65.00'},
//   ];

//   ShoppingPage({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: Colors.grey[50],
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.grey[50],
//           leading: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(Icons.shopping_cart_outlined, color: Colors.orange),
//           ),
//           actions: [
//             CircleAvatar(
//               backgroundColor: Colors.orange[100],
//               child: Icon(Icons.shopping_cart, color: Colors.orange),
//             ),
//             SizedBox(width: 16),
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             children: [
//               // Search Bar
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search',
//                   prefixIcon: Icon(Icons.search),
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: EdgeInsets.all(0),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//               // Filter and Sort
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.black,
//                       backgroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     onPressed: () {},
//                     icon: Icon(Icons.filter_list, color: Colors.orange),
//                     label: Text('Filters by'),
//                   ),
//                   ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.black,
//                       backgroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     onPressed: () {},
//                     icon: Icon(Icons.sort, color: Colors.orange),
//                     label: Text('Sort by'),
//                   ),
//                   Icon(Icons.grid_view, color: Colors.orange),
//                 ],
//               ),
//               SizedBox(height: 16),
//               // Tabs
//               TabBar(
//                 indicatorColor: Colors.orange,
//                 labelColor: Colors.black,
//                 unselectedLabelColor: Colors.grey,
//                 tabs: [
//                   Tab(text: 'Vegetables'),
//                   Tab(text: 'Fruits'),
//                   Tab(text: 'Stationery'),
//                 ],
//               ),
//               SizedBox(height: 16),
//               // Grid View
//               Expanded(
//                 child: TabBarView(
//                   children: [
//                     buildProductGrid(vegetables),
//                     Center(child: Text("Fruits")),
//                     Center(child: Text("Stationery")),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildProductGrid(List<Map<String, String>> items) {
//     return GridView.builder(
//       itemCount: items.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 3 / 3.8,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       itemBuilder: (_, index) {
//         final item = items[index];
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           padding: EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.topRight,
//                 child: Icon(Icons.favorite_border, color: Colors.red),
//               ),
//               Spacer(),
//               Text(
//                 item['name']!,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 "${item['price']} / 1 KG",
//                 style: TextStyle(
//                   color: Colors.orange,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Spacer(),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: Icon(Icons.shopping_cart_outlined, color: Colors.grey),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

/*
class ShoppingPage extends StatelessWidget {
  final ProductListScreenController controller;

  const ShoppingPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.categories.isEmpty) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      return DefaultTabController(
        length: controller.categories.length,
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey[50],
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart_outlined, color: Colors.orange),
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.orange[100],
                child: Icon(Icons.shopping_cart, color: Colors.orange),
              ),
              SizedBox(width: 16),
            ],
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.orange,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: controller.categories
                  .map((category) => Tab(text: category.categoryName))
                  .toList(),
            ),
          ),
          body: TabBarView(
            children: List.generate(controller.categories.length, (index) {
              final products = controller.productsPerTab[index];
              return buildProductGrid(products);
            }),
          ),
        ),
      );
    });
  }

  Widget buildProductGrid(List<Map<String, String>> items) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          final item = items[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.favorite_border, color: Colors.red),
                ),
                Spacer(),
                Text(
                  item['name']!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "${item['price']} / 1 KG",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.shopping_cart_outlined, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
*/

// class ShoppingPage extends StatelessWidget {
//   final ProductListScreenController controller;

//   const ShoppingPage({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (controller.categories.isEmpty) {
//         return Scaffold(
//           body: Center(child: CircularProgressIndicator()),
//         );
//       }

//       return DefaultTabController(
//         length: controller.categories.length,
//         child: Scaffold(
//           backgroundColor: Colors.grey[50],
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: Colors.grey[50],
//             leading: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(Icons.shopping_cart_outlined, color: Colors.orange),
//             ),
//             actions: [
//               CircleAvatar(
//                 backgroundColor: Colors.orange[100],
//                 child: Icon(Icons.shopping_cart, color: Colors.orange),
//               ),
//               SizedBox(width: 16),
//             ],
//             bottom: TabBar(
//               isScrollable: true,
//               indicatorColor: Colors.orange,
//               labelColor: Colors.black,
//               unselectedLabelColor: Colors.grey,
//               tabs: controller.categories
//                   .map((category) => Tab(text: category.categoryName))
//                   .toList(),
//             ),
//           ),
//           body: Column(
//             children: [
//               // 🔍 Search Bar
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//                 child: TextField(
//                   onChanged: (value) => null,
//                   decoration: InputDecoration(
//                     hintText: 'Search',
//                     prefixIcon: Icon(Icons.search),
//                     filled: true,
//                     fillColor: Colors.white,
//                     contentPadding: EdgeInsets.all(0),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               ),

//               // ⚙️ Filters and Sort Buttons
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         // TODO: Filter logic
//                       },
//                       icon: Icon(Icons.filter_list, color: Colors.orange),
//                       label: Text('Filters by'),
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.black,
//                         backgroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         // TODO: Sort logic
//                       },
//                       icon: Icon(Icons.sort, color: Colors.orange),
//                       label: Text('Sort by'),
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.black,
//                         backgroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                     ),
//                     Icon(Icons.grid_view, color: Colors.orange),
//                   ],
//                 ),
//               ),

//               // 🧾 Tabs Content
//               Expanded(
//                 child: TabBarView(
//                   children: List.generate(controller.categories.length, (index) {
//                     // final filteredProducts = controller.getFilteredProducts(index);
//                     return buildProductGrid(controller.productsPerTab[index]);
//                   }),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }

//   Widget buildProductGrid(List<Map<String, String>> items) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: GridView.builder(
//         itemCount: items.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 3 / 3.8,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemBuilder: (_, index) {
//           final item = items[index];
//           return Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             padding: EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Icon(Icons.favorite_border, color: Colors.red),
//                 ),
//                 Spacer(),
//                 Text(
//                   item['name']!,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   "${item['price']} / 1 KG",
//                   style: TextStyle(
//                     color: Colors.orange,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Spacer(),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Icon(Icons.shopping_cart_outlined, color: Colors.grey),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class ShoppingPage extends StatelessWidget {
  final ProductListScreenController controller;

  const ShoppingPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.categories.isEmpty) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      return DefaultTabController(
        length: controller.categories.length,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              leading: Text(''),
              //   IconButton(
              // onPressed: () {
              //   Navigator.pop(context);
              // },
              // icon: SvgPicture.asset(
              //   Assets.images.svg.arrowLeft,
              // )),
              elevation: 0,
              backgroundColor: Colors.grey[50],
              actions: [
                GestureDetector(
                  onTap: () => null,
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
                SizedBox(width: 16),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔍 Search Bar
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: TextField(
                    onChanged: (value) => null,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                // ⚙️ Filters and Sort Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Filter logic
                        },
                        icon: Icon(Icons.filter_list, color: Colors.orange),
                        label: Text('Filters by'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Sort logic
                        },
                        icon: Icon(Icons.sort, color: Colors.orange),
                        label: Text('Sort by'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Icon(Icons.grid_view, color: Colors.orange),
                    ],
                  ),
                ),

                // 🧾 TabBar placed BELOW filters
                TabBar(
                  onTap: (value) {
                    controller.productsPerTab.value = [];
                    controller.onTap(
                        index: value, id: controller.categories[value].id!);
                  },
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  indicatorColor: Colors.orange,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: controller.categories
                      .map((category) => Tab(text: category.categoryName))
                      .toList(),
                ),

                // 🔽 Tab content
                controller.isProductLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: TabBarView(
                          children: List.generate(controller.categories.length,
                              (index) {
                            final products =
                                index < controller.productsPerTab.length
                                    ? controller.productsPerTab[index]
                                    : [];
                            return buildProductGrid(controller.productsPerTab);
                          }),
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildProductGrid(List<CartItem> items) {
    if (items.isEmpty) {
      return const Center(child: Text('No data found'));
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          final item = items[index];

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.favorite_border, color: Colors.red),
                ),
                Spacer(),
                Text(
                  item.name ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "${item.price} / ${item.quantity} KG",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.shopping_cart_outlined, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
