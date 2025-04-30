import 'package:ecommerce/core/db/hive_box_helper.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/bottom_navbar/bottom_navbar.dart';
import 'package:ecommerce/module/authorised/profile_module/my_orders/screens.dart';
import 'package:ecommerce/module/authorised/profile_module/wishlist/screens.dart';
import 'package:ecommerce/module/unauthorised/authentication/view.dart';
import 'package:ecommerce/shared/repo/authorised/profile_repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCustomDrawer extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;

  const MyCustomDrawer({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer( 
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Custom centered header
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(formatImageUrl(imageUrl)),
                  onBackgroundImageError: (_, __) {},
                ),
                const SizedBox(height: 12),
                Text(
                  name,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),

          // Profile
          ListTile(
            leading: SvgPicture.asset(Assets.images.svg.user),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NavScreen(index: 2),
                ),
              );
            },
          ),

          // Favorites
          ListTile(
            leading: SvgPicture.asset(Assets.images.svg.favorite),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WishlistScreen(),
                ),
              );
            },
          ),

          // Orders
          ListTile(
            leading: SvgPicture.asset(Assets.images.svg.shoppingBag),
            title: const Text('Orders'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyOrdersScreen(),
                ),
              );
            },
          ),

          const Divider(),

          // Logout
          ListTile(
            leading: SvgPicture.asset(Assets.images.svg.logOut),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              showCustomDialog(
                context: context,
                title: 'Confirmation Dialogue',
                content: 'Are you sure you want to logout?',
                onPressed: () async {
                  Navigator.pop(context); // Close dialog
                  await ProfileRepo().onLogOut();
                  await HiveHelper.getUserDetailsHiveBox().clear();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                    (route) => false,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

void showCustomDialog({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Assets.images.svg.alertCircle),
              const SizedBox(height: 8),
              Text(title, textAlign: TextAlign.center),
            ],
          ),
        ),
        content: Text(content),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20),
              ),
              backgroundColor: WidgetStateProperty.all(const Color(0xFFEE9700)),
              shape: WidgetStateProperty.all(
                BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                  side: const BorderSide(color: Color(0xFFEE9700)),
                ),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
