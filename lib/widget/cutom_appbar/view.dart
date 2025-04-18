import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController? controller;
  final String hintText;
  final VoidCallback? onCartTap;
  final VoidCallback? onClearSearch;

  const CustomAppBar({
    super.key,
    this.controller,
    this.hintText = "Search",
    this.onCartTap,
    this.onClearSearch,
  });

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
      color: const Color(0xFFF5F5F5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cart Icon aligned right
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onCartTap,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.orange),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Search bar
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.black54),
                suffixIcon: GestureDetector(
                  onTap: onClearSearch,
                  child: const Icon(Icons.close, color: Colors.black54),
                ),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
