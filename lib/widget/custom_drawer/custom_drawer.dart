import 'package:ecommerce/core/db/hive_box_helper.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/bottom_navbar/bottom_navbar.dart';
import 'package:ecommerce/module/authorised/profile_module/my_orders/screens.dart';
import 'package:ecommerce/module/authorised/profile_module/wishlist/screens.dart';
import 'package:ecommerce/module/unauthorised/authentication/view.dart';
import 'package:ecommerce/shared/repo/authorised/profile_repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyCustomDrawer extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;

  MyCustomDrawer(
      {required this.name, required this.email, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Header of the drawer
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xFFEE9700)),
            accountName: Text(name),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                formatImageUrl(imageUrl),
                // fit: BoxFit.cover,
                // width: 80,
                // height: 80,
                // errorBuilder: (context, error, stackTrace) => const Icon(
                //   Icons.image,
                //   size: 20,
                //   color: Color.fromARGB(255, 78, 77, 77),
                // ),
              ), // Your company logo
            ),
          ),
          // Drawer items
          ListTile(
            leading: SvgPicture.asset(Assets.images.svg.user),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NavScreen(
                          index: 2,
                        )),
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset(Assets.images.svg.favorite),
            title: Text('Favorites'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WishlistScreen(),
                  ));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(Assets.images.svg.shoppingBag),
            title: Text('Orders'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyOrdersScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: SvgPicture.asset(Assets.images.svg.logOut),
            title: Text('Logout'),
            onTap: () {
              showCustomDialog(
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
        title: Column(
          children: [
            SvgPicture.asset(Assets.images.svg.alertCircle),
            Text(title),
          ],
        ),
        content: Text(content),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20)),
              backgroundColor: WidgetStateProperty.all(const Color(0xFFEE9700)),
              shape: WidgetStateProperty.all(
                BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                    side: const BorderSide(color: Color(0xFFEE9700))),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              'yes',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
