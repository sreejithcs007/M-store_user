import 'package:ecommerce/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class OrderDetailsPageScreen extends StatelessWidget {
  const OrderDetailsPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(Assets.images.svg.arrowLeft),
        ),
        title: Text('My Orders'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFirstContainer(),
            const SizedBox(height: 16),
            _buildSecondDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstContainer() {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Order Id - 11111'), Text('Ongoing')],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image on the left
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.image, size: 40, color: Colors.grey),
              ),
              const SizedBox(width: 16),

              // Product details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_buildDetails()],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetails() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "productName",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Text(
              "₹123",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Gap(6),
            Text(
              "1 KG",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Gap(6),
        Text('Prepaid', style: TextStyle(color: Colors.grey)),
        Gap(6),
        Text('12/1/2025', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildSecondDetails() {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text('Delivery Address'),),
          Text('Nisha', style: TextStyle(color: Colors.grey)),
          Gap(6),
          Text('nisha@gmail.com', style: TextStyle(color: Colors.grey)),
          Gap(6),
          Text('12 Kollam', style: TextStyle(color: Colors.grey)),
          Gap(6),
          Text('Kerala, Nadakav', style: TextStyle(color: Colors.grey)),
          Gap(6),
          Text('1234', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
