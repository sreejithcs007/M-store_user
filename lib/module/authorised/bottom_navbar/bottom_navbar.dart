import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/dashboard/view.dart';
import 'package:ecommerce/module/authorised/product_list_Screen.dart/screen.dart';
import 'package:ecommerce/module/authorised/profile_main_screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavScreen extends StatefulWidget {
   NavScreen({super.key, this.index = 0});
   int index;

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  // int index = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const DashboardView(),
      const ProductListScreen(),
      const ProfileNavScreens(),
    ];

    return Scaffold(
      body: screens[widget.index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapIndex) {
          setState(() {
           widget.index = tapIndex;
          });
        },
        currentIndex: widget.index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              svgPath: Assets.images.svg.home,
              isSelected: widget.index == 0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              svgPath: Assets.images.svg.shoppingBag,
              isSelected: widget.index == 1,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              svgPath: Assets.images.svg.user,
              isSelected: widget.index == 2,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon({required String svgPath, required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: isSelected
          ? const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            )
          : null,
      child: SvgPicture.asset(
        svgPath,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.black : Colors.grey,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
