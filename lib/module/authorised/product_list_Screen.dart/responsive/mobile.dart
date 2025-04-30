import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/product_list_Screen.dart/controller.dart';
import 'package:ecommerce/shared/model/cart_item/cart_item_model.dart';
import 'package:ecommerce/shared/model/categories/model.dart';
import 'package:ecommerce/widget/custom_drawer/custom_drawer.dart';
import 'package:ecommerce/widget/cutom_auto_complete/custom_autocomplete.dart';
import 'package:ecommerce/widget/cutom_card/view.dart';
import 'package:ecommerce/widget/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
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
            drawer: Obx(
              () => MyCustomDrawer(
                email: controller.email.value,
                imageUrl: controller.imageUrl.value,
                name: controller.name.value,
              ),
            ),
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  // maxRadius: 10,
                  child: Builder(
                    builder: (context) => GestureDetector(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Assets.images.company.companyLogo.image(
                          fit: BoxFit.cover,
                          width: 50,
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.grey[50],
              actions: [
                Obx(() => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CircleAvatar(
                        maxRadius: 20, // Adjust radius as needed
                        backgroundColor: Colors.grey[100],
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.network(
                            formatImageUrl(controller.imageUrl.value),
                            fit: BoxFit.cover,
                            width: 80, // match the maxRadius * 2
                            height: 80,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.image,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    )),
                const Gap(10),
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
                // Padding(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 16.0, vertical: 8),
                //     child:

                //         AutocompleteWidget(
                //       autoCompleteTileBuilder: (CategoryModel option) =>
                //           Text(option.categoryName),
                //       displayStringForOption: (CategoryModel option) =>
                //           option.categoryName,
                //       // controller: controller.bundleCreateModel[index].bcodeCont,
                //       initialvalue: '',
                //       hintText: 'Search category',
                //       optionsBuilder: (String value) async {
                //         if (value.isEmpty) return controller.categories;

                //         final input = value.toLowerCase();

                //         return controller.categories.where(
                //           (cat) =>
                //               cat.categoryName.toLowerCase().contains(input),
                //         );
                //       },

                //       // maxWidth: 500,
                //       onSelect: (value) {
                //         int index = controller.categories.indexOf(value);
                //         controller.index = index;

                //         print('    controller.index  == ${controller.index}');
                //         final tabController = DefaultTabController.of(
                //             knNavGlobalKey.currentContext!);
                //         if (tabController != null) {
                //           tabController
                //               .animateTo(index); // Switch to the selected tab
                //         }
                //         controller.onTap(
                //             index: index,
                //             id: controller.categories[index].id ?? 1);
                //       },
                //       selectedBuilder: (CategoryModel selected) =>
                //           Text(selected.categoryName),
                //     )),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Builder(
                    builder: (context) => AutocompleteWidget(
                      autoCompleteTileBuilder: (CategoryModel option) =>
                          Text(option.categoryName),
                      displayStringForOption: (CategoryModel option) =>
                          option.categoryName,
                      initialvalue: '',
                      hintText: 'Search category',
                      optionsBuilder: (String value) async {
                        if (value.isEmpty) return controller.categories;

                        final input = value.toLowerCase();

                        return controller.categories.where(
                          (cat) =>
                              cat.categoryName.toLowerCase().contains(input),
                        );
                      },
                      onSelect: (value) {
                        int index = controller.categories.indexOf(value);
                        controller.index = index;

                        // ✅ Proper context here
                        final tabController = DefaultTabController.of(context);
                        if (tabController != null) {
                          tabController.animateTo(index);
                        }

                        controller.onTap(
                          index: index,
                          id: controller.categories[index].id ?? 1,
                        );
                      },
                      selectedBuilder: (CategoryModel selected) =>
                          Text(selected.categoryName),
                    ),
                  ),
                ),

                // ⚙️ Filters and Sort Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Filter Button
                      Flexible(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Filter by Cost'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      LabeledTextField(
                                        hintText: 'Minimum Cost',
                                        label: 'Minimum Cost',
                                        controller:
                                            controller.minCostController,
                                        keyboardType: TextInputType.number,
                                        // decoration: const InputDecoration(
                                        //   labelText: 'Minimum Cost',
                                        //   prefixIcon: Icon(Icons.money),
                                        // ),
                                      ),
                                      const SizedBox(height: 12),
                                      LabeledTextField(
                                        hintText: 'Maximum Cost',
                                        label: 'Maximum Cost',
                                        controller:
                                            controller.maxCostController,
                                        keyboardType: TextInputType.number,
                                        // decoration: const InputDecoration(
                                        //   labelText: 'Maximum Cost',
                                        //   prefixIcon:
                                        //       Icon(Icons.money_outlined),
                                        // ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Clear values
                                        controller.minCostController.clear();
                                        controller.maxCostController.clear();
                                        controller.onTap(
                                            index: controller.index ?? 0,
                                            id: controller.id ?? 1);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Clear',
                                        style: AppTextStyle().br14w600,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        devPrintError(
                                            'ind = ${controller.index}');
                                        devPrintError(
                                            'onpresse ${controller.categories.value[controller.index ?? 0].id}');
                                        final min = double.tryParse(controller
                                                .minCostController.text) ??
                                            0;
                                        final max = double.tryParse(controller
                                                .maxCostController.text) ??
                                            double.infinity;
                                        controller.onFilterApply(
                                            ids: controller
                                                    .categories
                                                    .value[
                                                        controller.index ?? 0]
                                                    .id ??
                                                1,
                                            min: min.toString(),
                                            max: max.toString());
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Apply',
                                        style: AppTextStyle().br14w600,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          iconAlignment: IconAlignment.end,
                          icon: SvgPicture.asset(Assets.images.svg.filter),
                          label: Text(
                            'Filters',
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
                      ),
                      const SizedBox(width: 8), // Space between buttons

                      // Sort Button
                      // Flexible(
                      //   child: ElevatedButton.icon(
                      //     iconAlignment: IconAlignment.end,
                      //     onPressed: () {
                      //       // TODO: Sort logic
                      //     },
                      //     icon: SvgPicture.asset(Assets.images.svg.sort),
                      //     label: Text(
                      //       'Sort by',
                      //       style: AppTextStyle()
                      //           .br16w400
                      //           .copyWith(color: const Color(0xFFEE9700)),
                      //     ),
                      //     style: ElevatedButton.styleFrom(
                      //       foregroundColor: Colors.black,
                      //       backgroundColor: Colors.white,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(width: 8), // Space between buttons

                      // Grid View Icon Button
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
                        },
                      ),
                      // List View Icon Button
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.images.svg.list,
                          color: controller.isList.value
                              ? const Color(0xFFEE9700)
                              : const Color(0xFFB2B2B2),
                        ),
                        onPressed: () {
                          controller.isList.value = true;
                          controller.isList.refresh();
                        },
                      ),
                    ],
                  ),
                ),

                // 🧾 TabBar placed BELOW filters
                TabBar(
                  onTap: (value) {
                    controller.productsPerTab.value = [];
                    controller.index = value;
                    controller.id = controller.categories[value].id!;
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
        () => GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 4, // Adjust for better aspect responsiveness
          ),
          itemBuilder: (_, index) {
            final item = items[index];

            return GestureDetector(
              onTap: () =>
                  controller.onProductContainerTap(index: index, id: item.id),
              child: Container(
                constraints: const BoxConstraints(minHeight: 220),
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
                  children: [
                    // 🖼️ Image (flexible and minimum height)
                    Expanded(
                      flex: 6,
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(minHeight: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[300],
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                formatImageUrl(item.imageUrl?.first),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Center(
                                  child: Icon(
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
                              child: GestureDetector(
                                onTap: () =>
                                    controller.onFavoriteToggle(index: index),
                                child: SvgPicture.asset(
                                  item.isFavorite
                                      ? Assets.images.svg.redheart
                                      : Assets.images.svg.greyheart,
                                  height: 20,
                                  width: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // 📝 Text Info (fixed height)
                    SizedBox(
                      height: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                '₹ ${item.price}',
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' / 1 ${item.unit}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
              isFavorite: item.isFavorite,
              onAddToCart: () => controller.onAddToCart(
                  productId: item.productId, quantity: 1),
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
                controller.onFavoriteToggle(index: index);
              },
              // image: Image.asset('', fit: BoxFit.cover),
              oldPriceNeeded: false),
        );
      },
    );
  }
}
