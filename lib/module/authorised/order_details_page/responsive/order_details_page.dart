import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/order_details_page/controller.dart';
import 'package:ecommerce/widget/custom_time_line/custome_time_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OrderDetailsPageScreen extends StatelessWidget {
  const OrderDetailsPageScreen({super.key, required this.controller});
  final OrderDetailsPageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(Assets.images.svg.arrowLeft),
        ),
        title: const Text('My Orders'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.orderedList.value.length,
                itemBuilder: (context, index) {
                  return _buildFirstContainer(index: index);
                },
              ),
            ),
            const SizedBox(height: 16),
            _buildSecondDetails(),
            const SizedBox(height: 16),
            Obx(() => _buildThirdContainer()),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstContainer({required int index}) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Id - ${controller.orderedList[index].itemOrderId}',
                style: AppTextStyle().br14w600,
              ),
              Text(
                controller.orderedList[index].deliveryStatus,
                style: AppTextStyle().br16w600,
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image on the left
              Container(
                width: 80,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    formatImageUrl(
                        controller.orderedList[index].imageUrl.first),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image,
                      size: 36,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Product details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_buildDetails(index: index)],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetails({required int index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                controller.orderedList[index].itemName,
                style: AppTextStyle().br16w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text('${controller.orderedList[index].itemRate}',
                style: AppTextStyle()
                    .br14w600
                    .copyWith(color: const Color(0xFFEE9700))),
            const Gap(6),
            Text(
              '/ ${controller.orderedList[index].itemQty} ${controller.orderedList[index].unit}',
              style: AppTextStyle()
                  .br14w600
                  .copyWith(color: const Color(0xFFB3B3B3)),
            )
          ],
        ),
        const Gap(6),
        Text(
          controller.orderedList[index].paymentType,
          style:
              AppTextStyle().br16w400.copyWith(color: const Color(0xFF14AE5C)),
        ),
        const Gap(6),
        Text(
          controller.orderedList[index].createdAt,
          style: AppTextStyle().br14w400,
        ),
      ],
    );
  }

  Widget _buildSecondDetails() {
    return Container(
      height: 160,
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
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Delivery Address',
                style: AppTextStyle().br16w400,
              ),
            ),
            Text(controller.deliveryName.value, style: AppTextStyle().br16w600),
            const Gap(6),
            Text(controller.deliveryGmail.value,
                style: AppTextStyle().br16w400),
            const Gap(6),
            Text(controller.deliveryAddress.value,
                style: AppTextStyle().br16w400),
            const Gap(6),
            Text(controller.deliveryPincode.value,
                style: AppTextStyle().br16w400),
            // Gap(6),
            // Text('1234', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildThirdContainer() {
    print(
        "controller.currentStatus.value == ${controller.currentStatus.value}");
    if ((controller.currentStatus.value == "Pending") ||
        (controller.currentStatus.value == " ")) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: DeliveryTimeline(
          steps: [
            TimelineStep(title: "Pending", time: 'yet to dispatch'),
            TimelineStep(title: "Product collected", time: ''),
            TimelineStep(title: "On going", time: ''),
            TimelineStep(title: "Delivered", time: ''),
          ],
          currentStatus: 'Pending',
        ),
      );
    }
    return Obx(
      () => Container(
        // height: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: DeliveryTimeline(
          steps: controller.deliverySteps,
          currentStatus: controller.currentStatus.value,
        ),
      ),
    );
  }
}
