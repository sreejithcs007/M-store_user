
import 'package:ecommerce/widget/cutom_appbar/view.dart';
import 'package:ecommerce/widget/cutom_card/view.dart';
import 'package:ecommerce/widget/grid_view_dashboard/view.dart';
import 'package:flutter/material.dart';

import '../view_all/screen.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"title": "Vegetables"},
    {"title": "Groceries"},
    {"title": "Fruits"},
    {"title": "Stationery"},
  ];

   DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFF59E0B),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: const Color(0xFFF5F5F5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                onCartTap: () => print("Cart tapped"),
                onClearSearch: () => print("Clear search"),
              ),

              // Banner
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Container(
                      width: 100,
                      height: 20,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),
              const Center(child: Icon(Icons.more_horiz)),

              // Categories Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    GestureDetector(
                        onTap: ()=> Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ViewAllScreen()),
                        ),
                        child: const Text("View All",
                            style: TextStyle(color: Colors.orange))),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Grid View
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 2.5,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryGridItem(title: categories[index]["title"]!);
                  },
                ),
              ),

              // Today's Offer
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("Today's Offer",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ProductCard(
                  productName: "Carrot",
                  currentPrice: "55.00",
                  oldPrice: "65.00",
                  quantityInfo: "/ 1 KG",
                  isFavorite: false,
                  enableActions: true,
                  onAddToCart: () => print("Add to cart"),
                  onFavoriteToggle: () => print("Toggle fav"),
                  image: Image.asset('assets/carrot.png', fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
