import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/shared/repo/authorised/profile_repo/profile_repo.dart';
import 'package:ecommerce/widget/custom_details_page/custom_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileNavSectionController extends GetxController {
  RxString imageUrl = ''.obs;
  RxString nameText = ''.obs;
  RxString superCoin = ''.obs;
  void showCustomDialog({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              SvgPicture.asset(Assets.images.svg.alertCircle),
              Text(title),
            ],
          ),
          content: Text(content),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20)),
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xFFEE9700)),
                shape: WidgetStateProperty.all(
                  BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                      side: const BorderSide(color: Color(0xFFEE9700))),
                ),
              ),
              onPressed: onPressed,
              child: const Text(
                'yes',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void onToDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CustomDetailsPage()),
    );
  }

  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  Future<void> _initial() async {
    var response = await ProfileRepo().onProfileFetch();
    if (response != null) {
      imageUrl.value = response.uProfilePic ?? '';
      nameText.value = response.uName ?? '';
      superCoin.value = response.superCoins.toString() ?? '';
    }
  }
}
