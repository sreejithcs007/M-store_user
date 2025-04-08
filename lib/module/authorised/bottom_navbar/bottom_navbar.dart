import 'package:ecommerce/module/authorised/dashboard/responsive/dashboard_view.dart';
import 'package:flutter/material.dart';


class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<NavScreen> {
  int index = 0;

  final List<Widget> screens = [
    DashboardScreen(), // Your main dashboard content
    Placeholder(),  // Replace with CartScreen or relevant screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapIndex) {
          setState(() {
            index = tapIndex;
          });
        },
        currentIndex: index,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: "Cart",
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
