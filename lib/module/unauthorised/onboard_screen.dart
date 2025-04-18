import 'package:ecommerce/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
              const Text('Logo',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              Gap(30),
              RichText(
                text: TextSpan(
                  style: AppTextStyle().br38w700,
                  children: [
                    TextSpan(text: 'Choosing '),
                    TextSpan(
                        text: 'fresh\ngroceries',
                        style: AppTextStyle()
                            .br38w700
                            .copyWith(color: Color(0xFFEE9700))),
                    TextSpan(text: ' can\nmake\na difference\nto your health'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Get the best quality and most\ndelicious groceries in your area.',
                    style: AppTextStyle().br20w400,
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
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
