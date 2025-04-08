// import 'package:ecommerce/module/authorised/dashboard/responsive/dashboard_view.dart';
// import 'package:ecommerce/module/authorised/view_all/screen.dart';
// import 'package:flutter/material.dart';
//
//
// class NavScreen extends StatefulWidget {
//   const NavScreen({super.key});
//
//   @override
//   State<NavScreen> createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<NavScreen> {
//   int index = 0;
//
//   final List<Widget> screens = [
//     DashboardScreen(), // Your main dashboard content
//     ViewAllScreen(),  // Replace with CartScreen or relevant screen
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[index],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (tapIndex) {
//           setState(() {
//             index = tapIndex;
//           });
//         },
//         currentIndex: index,
//         type: BottomNavigationBarType.shifting,
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.orange,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             activeIcon: Icon(Icons.home),
//             label: "Home",
//             backgroundColor: Colors.white,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_outlined),
//             activeIcon: Icon(Icons.shopping_cart),
//             label: "Cart",
//             backgroundColor: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/dashboard/responsive/dashboard_view.dart';
import 'package:ecommerce/module/authorised/view_all/screen.dart';
import 'package:ecommerce/module/authorised/profile_module/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      DashboardScreen(
        onViewAllTap: () {
          setState(() {
            index = 1;
          });
        },
      ),
      const ViewAllScreen(),
      const ProfileNavScreens()
    ];

    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapIndex) {
          setState(() {
            index = tapIndex;
          });
        },
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.orange,

        selectedItemColor: Colors.white,
        // unselectedItemColor: Colors.grey,
        
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.images.svg.home),
            // activeIcon: Icon(Icons.home),
            
            label: "",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.images.svg.shoppingBag),
            // activeIcon: Icon(Icons.shopping_cart),
            label: "",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.images.svg.user),
            // activeIcon: Icon(Icons.shopping_cart),
            label: "",
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
