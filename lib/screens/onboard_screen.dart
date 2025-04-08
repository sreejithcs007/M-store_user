import 'package:flutter/material.dart';

class GroceryPromoScreen extends StatelessWidget {
  const GroceryPromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFF2EBD8)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Logo', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              const SizedBox(height: 24),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 28, height: 1.4, fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(text: 'Choosing '),
                    TextSpan(text: 'fresh groceries', style: TextStyle(color: Colors.orange)),
                    TextSpan(text: ' can\nmake\na difference\nto your health'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Get the best quality and most\ndelicious groceries in your area.',
                style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Shop now', style: TextStyle(color: Colors.white)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
