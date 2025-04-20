import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
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
          body: Center(
              child: CircularProgressIndicator(
            color: Color(0xFFEE9700),
          )),
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
                    onTap: () => controller.onCartTap(context),
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
                        iconAlignment: IconAlignment.end,
                        icon: SvgPicture.asset(Assets.images.svg.filter),
                        label: Text(
                          'Filters by',
                          style: AppTextStyle()
                              .br16w400
                              .copyWith(color: const Color(0xFFEE9700)),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        iconAlignment: IconAlignment.end,
                        onPressed: () {
                          // TODO: Sort logic
                        },
                        icon: SvgPicture.asset(Assets.images.svg.sort),
                        label: Text(
                          'Sort by',
                          style: AppTextStyle()
                              .br16w400
                              .copyWith(color: const Color(0xFFEE9700)),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      IconButton(
                          icon: SvgPicture.asset(
                            Assets.images.svg.grid,
                            color: controller.isList.value
                                ? const Color(0xFFB2B2B2)
                                : const Color(0xFFEE9700),
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
                    ? const SizedBox(
                        child: Center(
                            child: CircularProgressIndicator(
                        color: Color(0xFFEE9700),
                      )))
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

  Widget buildProductGrid(RxList<CartItemCustomModel> items) {
    if (items.isEmpty) {
      return const Center(child: Text('No data found'));
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(
        () =>  GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 3 / 3.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 195,
          ),
          itemBuilder: (_, index) {
            final item = items[index];
        
            return Container(
              width: 120,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Product Image
                  Stack(children: [
                    Container(
                      color: Colors.amber,
                      height: 100,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          formatImageUrl(item.imageUrl?.first),
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
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
                        item.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: item.isFavorite ? Colors.red : Colors.grey,
                        size: 18,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 8),
                  // Product Name
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  // const SizedBox(height: 4),
                  // Price Row
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '₹ ${item.price}',
                        style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' / ${item.quantity}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.shopping_cart_outlined,
                            color: Colors.grey),
                        onPressed: () {
                          // handle add to cart
                        },
                        iconSize: 20,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildProductList(List<CartItemCustomModel> items) {
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
              productDetailsPageOnTap: () =>
                  controller.onProductContainerTap(id: item.id, index: index),
              productName: item.name,
              currentPrice: item.price,
              oldPrice: '',
              quantityInfo: "${item.quantity}/ KG",
              isFavorite: false,
              enableActions: true,
              onAddToCart: () => print("Add to cart"),
              image: Image.network(
                formatImageUrl(item.imageUrl?.first),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image,
                  size: 36,
                  color: Colors.grey,
                ),
              ),
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
