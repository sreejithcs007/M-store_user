import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/view_all_category/controller.dart';
import 'package:ecommerce/widget/grid_view_dashboard/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
        title: Text(
          'Categories',
          style: AppTextStyle().br16w600,
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 170,
                ),
                itemCount: controller.categories.value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: CategoryGridItem(
                        onContainerTap: () => controller.onCategoryContainerTap(
                            index: index,
                            id: controller.categories.value[index].id!),
                        title: controller.categories.value[index].categoryName),
                  );
                },
              ),
      ),
    );
  }
}
