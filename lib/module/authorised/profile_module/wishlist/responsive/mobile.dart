import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/profile_module/wishlist/controller.dart';
import 'package:ecommerce/module/authorised/profile_module/wishlist/responsive/widgets/viewed/viewed_wishlist.dart';
import 'package:ecommerce/module/authorised/profile_module/wishlist/responsive/widgets/wishlist_view/wishlist_view.dart';
import 'package:ecommerce/widget/custom_tab_bar_view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WishlistMobileScreen extends StatelessWidget {
  const WishlistMobileScreen({super.key, required this.controller});
  final WishlistController controller;

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
        title: const Text(
          'My products',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: CustomTabView(
        tabCount: 2,
        tabs: const [
          Text('Wish list'),
          Text('Viewed'),
        ],
        tabViews: [
          WishlistViewScreen(
            controller: controller,
          ),
          ViewedWishListScreen(
            controller: controller,
          )
        ],
      ),
    );
  }
}
