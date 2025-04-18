import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/product_list_Screen.dart/controller.dart';
import 'package:ecommerce/shared/model/cart_item/cart_item_model.dart';
import 'package:ecommerce/widget/cutom_card/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  final ProductListScreenController controller;

  const ShoppingPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.categories.isEmpty) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      return DefaultTabController(
        initialIndex: controller.index ?? 0,
        length: controller.categories.length,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    Assets.images.svg.arrowLeft,
                  )),
              elevation: 0,
              backgroundColor: Colors.grey[50],
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: GestureDetector(
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
                ),
                const SizedBox(width: 16),
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
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(0),
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
                        icon:
                            const Icon(Icons.filter_list, color: Colors.orange),
                        label: const Text('Filters by'),
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
                        icon: const Icon(Icons.sort, color: Colors.orange),
                        label: const Text('Sort by'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      IconButton(
                          icon: SvgPicture.asset(
                            Assets.images.svg.grid,
                            color: controller.isList.value
                                ? const Color(0xFFB2B2B2)
                                :  const Color(0xFFEE9700),
                          ),
                          onPressed: () {
                            controller.isList.value = false;
                            controller.isList.refresh();
                          }),
                      IconButton(
                        icon: SvgPicture.asset(Assets.images.svg.list,
                            color: controller.isList.value
                                ? const Color(0xFFEE9700)
                                : const Color(0xFFB2B2B2)),
                        onPressed: () {
                          controller.isList.value = true;
                           controller.isList.refresh();
                        },
                      )
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
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: TabBarView(
                          children: List.generate(controller.categories.length,
                              (index) {
                            final products =
                                index < controller.productsPerTab.length
                                    ? controller.productsPerTab[index]
                                    : [];
                            return controller.isList.value
                                ? buildProductList(controller.productsPerTab)
                                : buildProductGrid(controller.productsPerTab);
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
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.favorite_border, color: Colors.red),
                ),
                const Spacer(),
                Text(
                  item.name ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  "${item.price} / ${item.quantity} KG",
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Align(
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

  Widget buildProductList(List<CartItem> items) {
    if (items.isEmpty) {
      return const Center(child: Text('No data found'));
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
          child: ProductCard(
              productDetailsPageOnTap: () => null,
              productName: item.name,
              currentPrice: item.price,
              oldPrice: '',
              quantityInfo: "${item.quantity}/ KG",
              isFavorite: false,
              enableActions: true,
              onAddToCart: () => print("Add to cart"),
              onFavoriteToggle: () {
                print(
                    "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                print(
                    "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
              },
              // image: Image.asset('', fit: BoxFit.cover),
              oldPriceNeeded: false),
        );
      },
    );
  }
}
