import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/bottom_navbar/bottom_navbar.dart';
import 'package:ecommerce/module/authorised/dashboard/controller.dart';
import 'package:ecommerce/shared/model/categories/model.dart';
import 'package:ecommerce/widget/cutom_auto_complete/custom_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomAppBar<T> extends StatelessWidget {
  final String hintText;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onClearSearch;
  final RxString? imageUrl;
  final DashboardController controller;

  const CustomAppBar({
    super.key,
    required this.controller,
    this.hintText = "Search",
    this.onNotificationTap,
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

              const Gap(10),
              GestureDetector(
                onTap: onNotificationTap,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.circle_notifications_outlined,
                    color: Colors.orange,
                    size: 30, // Increase this as needed
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          AutocompleteWidget(
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
                (cat) => cat.categoryName.toLowerCase().contains(input),
              );
            },
            onSelect: (value) {
              int index = controller.categories.indexOf(value);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavScreen(
                    index: 1,
                    id: controller.categories.value[index].id!,
                    tabIndex: index,
                  ),
                ),
              );
            },
            selectedBuilder: (CategoryModel selected) =>
                Text(selected.categoryName),
          )
        ],
      ),
    );
  }
}
