import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/profile_module/profile/create/controller.dart';
import 'package:ecommerce/widget/custom_save_cancel_button/save_cancel_button.dart';
import 'package:ecommerce/widget/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';

class ProfileCreateMobile extends StatefulWidget {
  const ProfileCreateMobile({super.key, required this.controller});
  final ProfileCreateEditController controller;

  @override
  State<ProfileCreateMobile> createState() => _ProfileCreateMobileState();
}

class _ProfileCreateMobileState extends State<ProfileCreateMobile> {
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    // if (kIsWeb) {
    //   // Web platform
    //   final bytes = await ImagePickerWeb.getImageAsBytes();
    //   if (bytes != null) {
    //     setState(() {
    //       _imageBytes = bytes;
    //       widget.controller.imageBytes = bytes;

    //       // print(
    //       //     ' widget.controller.imageBytes -- ${widget.controller.imageBytes}');
    //     });
    //   }
    // } else {
      // Mobile platforms
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _imageBytes = bytes;
          widget.controller.imageBytes = bytes;

          print(
              ' widget.controller.imageBytes -- ${widget.controller.imageBytes}');
        });
      // }
    }
  }

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
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Obx(
              () => Column(
                children: [
                  // CircleAvatar(
                  //   maxRadius: 80,
                  //   backgroundColor: Colors.grey[100],
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(80),
                  //     child: Image.network(
                  //       formatImageUrl(controller.imageUrl.value),
                  //       fit: BoxFit.cover,
                  //       errorBuilder: (context, error, stackTrace) => const Icon(
                  //         Icons.image,
                  //         size: 36,
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        maxRadius: 80,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: _imageBytes != null
                            ? MemoryImage(_imageBytes!)
                            : null,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: _imageBytes == null
                              ? widget.controller.imageUrl.value.isNotEmpty
                                  ? Image.network(
                                      formatImageUrl(
                                          widget.controller.imageUrl.value),
                                      fit: BoxFit.cover,
                                      width: 160,
                                      height: 160,
                                    )
                                  : const Icon(
                                      Icons.image,
                                      size: 36,
                                      color: Colors.grey,
                                    )
                              : null,
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(15),
                  LabeledTextField(
                    isBorderNeed: true,
                    hintText: 'Name',
                    label: 'Name',
                    controller: widget.controller.nameController,
                    fillColor: Colors.white,
                  ),
                  const Gap(5),
                  LabeledTextField(
                    isBorderNeed: true,
                    hintText: 'Address',
                    label: 'Address',
                    controller: widget.controller.addressController,
                    fillColor: Colors.white,
                  ),
                  const Gap(5),
                  LabeledTextField(
                    isBorderNeed: true,
                    hintText: 'Phone No',
                    label: 'Phone No',
                    controller: widget.controller.phoneNoController,
                    fillColor: Colors.white,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  const Gap(5),
                  LabeledTextField(
                    isBorderNeed: true,
                    hintText: 'Email',
                    label: 'Email',
                    controller: widget.controller.emailController,
                    fillColor: Colors.white,
                  ),
                  const Gap(5),
                  LabeledTextField(
                    isBorderNeed: true,
                    hintText: 'State',
                    label: 'State',
                    controller: widget.controller.stateController,
                    fillColor: Colors.white,
                  ),
                  const Gap(5),
                  LabeledTextField(
                    isBorderNeed: true,
                    hintText: 'City',
                    label: 'City',
                    controller: widget.controller.cityController,
                    fillColor: Colors.white,
                  ),
                  const Gap(10),
                  LabeledTextField(
                    isBorderNeed: true,
                    hintText: 'Pincode',
                    label: 'Pincode',
                    controller: widget.controller.pinCodeController,
                    fillColor: Colors.white,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  CustomSaveCancel(
                    cancelOnPress: () {
                      Navigator.pop(context);
                    },
                    saveOnPress: () {
                      widget.controller.onSave(
                        address: widget.controller.addressController.text,
                        city: widget.controller.cityController.text,
                        email: widget.controller.emailController.text,
                        name: widget.controller.nameController.text,
                        phone: widget.controller.phoneNoController.text,
                        pinCode: widget.controller.pinCodeController.text,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
