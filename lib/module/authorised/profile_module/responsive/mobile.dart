import 'package:ecommerce/module/authorised/profile/view.dart';
import 'package:ecommerce/module/authorised/profile_module/controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
              color: Colors.amber,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nimisha',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Super Coin: 25', style: TextStyle(fontSize: 16)),
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
                  icon: Icons.person_outline,
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
                  icon: Icons.favorite_border,
                  label: 'Favorites',
                  onTap: () {
                    Navigator.pushNamed(context, '/favorites');
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.shopping_cart_outlined,
                  label: 'Cart',
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.inventory_2_outlined,
                  label: 'Orders',
                  onTap: () {
                    Navigator.pushNamed(context, '/orders');
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.logout,
                  label: 'Logout',
                  onTap: () {
                    controller.showCustomDialog(
                        context: context,
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
    required IconData icon,
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
        leading: Icon(icon),
        title: Text(label),
        onTap: onTap,
      ),
    );
  }
}
