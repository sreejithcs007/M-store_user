
import 'package:ecommerce/widget/custom_list_view/view.dart';
import 'package:ecommerce/widget/cutom_card/view.dart';
import 'package:flutter/material.dart';


class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key});

  @override
  _ViewAllScreenState createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> with TickerProviderStateMixin {
  bool isGridView = true;
  final List<Map<String, String>> products = [
    {"title": "Tomato", "price": "25.00", "quantity": "1 KG"},
    {"title": "Carrot", "price": "65.00", "quantity": "1 KG"},
    {"title": "Onion", "price": "40.00", "quantity": "1 KG"},
    {"title": "Potato", "price": "33.00", "quantity": "1 KG"},
    {"title": "Capsicum", "price": "72.00", "quantity": "1 KG"},
    {"title": "Broccoli", "price": "60.00", "quantity": "1 KG"},
    {"title": "Cabbage", "price": "30.00", "quantity": "1 KG"},
    {"title": "Beetroot", "price": "35.00", "quantity": "1 KG"},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          title: const Text("Vegetables", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.orange),
              onPressed: () {},
            )
          ],
          bottom: const TabBar(
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Vegetables"),
              Tab(text: "Fruits"),
              Tab(text: "Stationery"),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_alt_outlined, color: Colors.orange),
                    label: const Text("Filters by", style: TextStyle(color: Colors.orange)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.sort, color: Colors.orange),
                    label: const Text("Sort by", style: TextStyle(color: Colors.orange)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      isGridView ? Icons.grid_view : Icons.view_list,
                      color: Colors.orange,
                    ),
                    onPressed: () => setState(() => isGridView = !isGridView),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                children: List.generate(3, (index) {
                  return isGridView ? _buildGridView() : _buildListView();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 3 / 3.5,
        ),
        itemBuilder: (context, index) {
          final item = products[index];
          return ProductCard(
            isListingPage: true,
            productName: item["title"]!,
            currentPrice: item["price"]!,
            oldPrice: '',
            quantityInfo: "/ ${item["quantity"]!}",
            isFavorite: false,
            enableActions: true,
            onAddToCart: () {},
            onFavoriteToggle: () {},
            image: Image.asset('assets/carrot.png', fit: BoxFit.cover),
          );
        },
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final item = products[index];
        return ProductListItem(
          productName: item["title"]!,
          price: item["price"]!,
          quantity: item["quantity"]!,
          isFavorite: false,
          onAddToCart: () {},
          onFavoriteToggle: () {},
        );
      },
    );
  }
}
