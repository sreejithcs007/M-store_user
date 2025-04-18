import 'package:flutter/material.dart';

class CategoryGridItem extends StatefulWidget {
  final String title;

  final VoidCallback onContainerTap;

  const CategoryGridItem(
      {super.key, required this.title, required this.onContainerTap});

  @override
  State<CategoryGridItem> createState() => _CategoryGridItemState();
}

class _CategoryGridItemState extends State<CategoryGridItem> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onContainerTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isFavorited = !isFavorited;
                });
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.favorite_border,
                  color: isFavorited ? Colors.red : Colors.black,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
