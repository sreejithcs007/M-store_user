import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/profile_module/my_orders/controller.dart';
import 'package:ecommerce/module/authorised/profile_module/my_orders/widget/my_order_screen/my_order_Screen.dart';
import 'package:ecommerce/module/authorised/profile_module/my_orders/widget/tracking_order/tracking_order.dart';
import 'package:ecommerce/widget/custom_tab_bar_view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyOrderMobileScreen extends StatelessWidget {
  const MyOrderMobileScreen({super.key, required this.controller});
  final MyOrderController controller;

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
          'My Orders',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: CustomTabView(
        tabCount: 2,
        tabs: const [
          Text('Ordered'),
          Text('Tracking'),
        ],
        tabViews: [
          MyOrderViewScreen(
            controller: controller,
          ),
          TrackinOrderViewScreen(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
