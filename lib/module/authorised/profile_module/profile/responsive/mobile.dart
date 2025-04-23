import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/profile_module/profile/controller.dart';
import 'package:ecommerce/module/authorised/profile_module/profile/create/screen.dart';
import 'package:ecommerce/widget/custom_header_subhead/header_subhead.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ProfileMobileScreen extends StatelessWidget {
  const ProfileMobileScreen({super.key, required this.controller});

  final ProfileController controller;

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileCreateEditScreen()),
                  );
                },
                icon: SvgPicture.asset(Assets.images.svg.edit8)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CircleAvatar(
              maxRadius: 80,
              backgroundColor: Colors.red,
            ),
            const Gap(15),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  // maxWidth: 700,
                  minWidth: 300),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 100,
                    crossAxisSpacing: 50,
                    childAspectRatio: 1,
                    crossAxisCount: 2),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return HeaderWithSubhead(
                    headerName: controller.profileHeaders[index].headerName,
                    subHeaderName: controller.profileHeaders[index].value,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
