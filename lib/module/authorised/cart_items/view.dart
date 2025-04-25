import 'package:ecommerce/shared/model/cart_item/cart_item_model.dart';
import 'package:ecommerce/widget/custom_list_view/view.dart';
import 'package:flutter/material.dart';
// Assuming you put the CartItem model in a separate file

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  // Sample static cart list
  final List<CartItemCustomModel> cartItems = [
    // CartItemCustomModel(
    //     productId: 1,
    //     name: "Tomato",
    //     price: "100.00",
    //     quantity: 2,
    //     isFavorite: true,
    //     id: 1),
    // CartItemCustomModel(
    //     productId: 1,
    //     name: "Carrot",
    //     price: "130.00",
    //     quantity: 2,
    //     isFavorite: true,
    //     id: 1),
    // CartItemCustomModel(
    //     productId: 1,
    //     name: "Onion",
    //     price: "40.00",
    //     quantity: 1,
    //     isFavorite: false,
    //     id: 1),
    // CartItemCustomModel(
    //     productId: 1,
    //     name: "Broccoli",
    //     price: "120.00",
    //     quantity: 2,
    //     isFavorite: false,
    //     id: 1),
    // CartItemCustomModel(
    //     productId: 1,
    //     name: "Potato",
    //     price: "33.00",
    //     quantity: 1,
    //     isFavorite: false,
    //     id: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Cart'),
        leading: const Icon(Icons.arrow_back),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.shopping_cart, size: 28),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                  child: Text(
                    "${cartItems.length}",
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ProductListItem(
                  productName: item.name,
                  price: item.price,
                  quantity: item.quantity ?? 1,
                  isFavorite: item.isFavorite,
                  isCart: true,
                  onRemove: () {}, // hook up logic later
                  onFavoriteToggle: () {},
                  onQuantityAdd: () {},
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Subtotal (5 items):", style: TextStyle(fontSize: 16)),
                Text("₹423.00",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.shopping_bag),
                label: const Text("Proceed to Buy"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
