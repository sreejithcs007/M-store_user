// import 'package:ecommerce/core/utils/tag_generator/helper.dart';
// import 'package:ecommerce/module/authorised/profile_main_screen/controller.dart';
// import 'package:ecommerce/module/authorised/profile_main_screen/responsive/mobile.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ProfileNavScreens extends StatefulWidget {
//   const ProfileNavScreens({super.key});

//   @override
//   State<ProfileNavScreens> createState() => _ProfileNavScreensState();
// }

// class _ProfileNavScreensState extends State<ProfileNavScreens> {
//   late ProfileNavSectionController controller;
//   final tag = fnTagGenerator();

//   @override
//   void initState() {
//     controller = Get.put(ProfileNavSectionController(), tag: tag);
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   void dispose() {
//     Get.delete<ProfileNavSectionController>(tag: tag);
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ProfileSectionNavMobile(
//       controller: controller,
//     );
//   }
// }
