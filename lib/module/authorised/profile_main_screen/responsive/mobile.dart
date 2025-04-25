import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/core/db/hive_box_helper.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/profile_module/my_orders/screens.dart';
import 'package:ecommerce/module/authorised/profile_module/profile/view.dart';
import 'package:ecommerce/module/authorised/profile_main_screen/controller.dart';
import 'package:ecommerce/module/authorised/profile_module/wishlist/screens.dart';
import 'package:ecommerce/module/authorised/view_cart/screen.dart';
import 'package:ecommerce/module/unauthorised/authentication/view.dart';
import 'package:ecommerce/shared/repo/authorised/profile_repo/profile_repo.dart';
import 'package:ecommerce/widget/custom_cart_view/custom_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileSectionNavMobile extends StatelessWidget {
  const ProfileSectionNavMobile({super.key, required this.controller});
  final ProfileNavSectionController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          const Gap(50),
          Center(
            child: Container(
              height: 168,
              width: 250,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => CircleAvatar(
                        maxRadius: 40, // Adjust radius as needed
                        backgroundColor: Colors.red,
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
                              size: 36,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )),
                  Obx(() => Text(controller.nameText.value,
                      style: AppTextStyle().br16w600)),
                  SizedBox(height: 8),
                  Obx(
                    () => RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Super Coin ', style: AppTextStyle().br14w400),
                      TextSpan(
                          text: '${controller.superCoin.value} 🪙',
                          style: AppTextStyle()
                              .br14w400
                              .copyWith(color: Color(0xFFEE9700))),
                    ])),
                  )
                ],
              ),
            ),
          ),
          const Gap(50),
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(
                  context,
                  leadingWidget: SvgPicture.asset(Assets.images.svg.user),
                  label: 'Profile',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileMainScreen(),
                        ));
                  },
                ),
                _buildMenuItem(
                  context,
                  leadingWidget: SvgPicture.asset(Assets.images.svg.favorite),
                  label: 'Favorites',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WishlistScreen(),
                        ));
                  },
                ),
                _buildMenuItem(
                  context,
                  leadingWidget: SvgPicture.asset(Assets.images.svg.cart),
                  label: 'Cart',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartView()));
                  },
                ),
                _buildMenuItem(
                  context,
                  leadingWidget:
                      SvgPicture.asset(Assets.images.svg.shoppingBag),
                  label: 'Orders',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyOrdersScreen(),
                        ));
                  },
                ),
                _buildMenuItem(
                  context,
                  leadingWidget: SvgPicture.asset(Assets.images.svg.logOut),
                  label: 'Logout',
                  onTap: () {
                    controller.showCustomDialog(
                      context: context,
                      onPressed: () async {
                        await ProfileRepo().onLogOut();
                        await HiveHelper.getUserDetailsHiveBox().clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ));
                      },
                      title: 'Confirmation Dialogue',
                      content: 'Are you Sure You want to logout',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required Widget leadingWidget,
    required String label,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 0.5),
        ),
      ),
      child: ListTile(
        leading: leadingWidget,
        title: Text(
          label,
          style: AppTextStyle().br14w400,
        ),
        onTap: onTap,
      ),
    );
  }
}
