import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/profile_module/profile/create/controller.dart';
import 'package:ecommerce/widget/custom_save_cancel_button/save_cancel_button.dart';
import 'package:ecommerce/widget/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileCreateMobile extends StatelessWidget {
  const ProfileCreateMobile({super.key, required this.controller});
  final ProfileCreateEditController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              Assets.images.svg.arrowLeft,
            )),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => Column(
            children: [
              CircleAvatar(
                maxRadius: 80,
                backgroundColor: Colors.red,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.network(
                    formatImageUrl(controller.imageUrl.value),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image,
                      size: 36,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const Gap(15),
              LabeledTextField(
                isBorderNeed: true,
                hintText: 'Name',
                label: 'Name',
                controller: controller.nameController,
                fillColor: Colors.white,
              ),
              const Gap(5),
              LabeledTextField(
                isBorderNeed: true,
                hintText: 'Address',
                label: 'Address',
                controller: controller.addressController,
                fillColor: Colors.white,
              ),
              const Gap(5),
              LabeledTextField(
                isBorderNeed: true,
                hintText: 'Phone No',
                label: 'Phone No',
                controller: controller.phoneNoController,
                fillColor: Colors.white,
              ),
              const Gap(5),
              LabeledTextField(
                isBorderNeed: true,
                hintText: 'Email',
                label: 'Email',
                controller: controller.emailController,
                fillColor: Colors.white,
              ),
              const Gap(5),
              LabeledTextField(
                isBorderNeed: true,
                hintText: 'State',
                label: 'State',
                controller: controller.stateController,
                fillColor: Colors.white,
              ),
              const Gap(5),
              LabeledTextField(
                isBorderNeed: true,
                hintText: 'City',
                label: 'City',
                controller: controller.cityController,
                fillColor: Colors.white,
              ),
              const Gap(10),
              LabeledTextField(
                isBorderNeed: true,
                hintText: 'Pincode',
                label: 'Pincode',
                controller: controller.pinCodeController,
                fillColor: Colors.white,
              ),
              CustomSaveCancel(
                cancelOnPress: () {},
                saveOnPress: () {
                  controller.onSave(
                      address: controller.addressController.text,
                      city: controller.cityController.text,
                      email: controller.emailController.text,
                      name: controller.nameController.text,
                      phone: controller.phoneNoController.text,
                      pinCode: controller.pinCodeController.text,
                      profilePic: controller.imageUrl.value ?? '');
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
