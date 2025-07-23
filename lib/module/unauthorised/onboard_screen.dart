import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/core/db/hive_box_helper.dart';
import 'package:ecommerce/core/db/hive_keys.dart';
import 'package:ecommerce/core/db/model/onboard/onboard.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/unauthorised/authentication/view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GroceryPromoScreen extends StatelessWidget {
  const GroceryPromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Gradient and Content
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.05),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 255, 253, 253), Color(0xFFE3DED2)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.05,
                  child: Assets.images.company.companyLogo.image(fit: BoxFit.contain),
                ),
                Gap(height * 0.09),
                RichText(
                  text: TextSpan(
                    style: AppTextStyle().br48w700.copyWith(fontSize: width * 0.085),
                    children: [
                      const TextSpan(text: 'Choosing '),
                      TextSpan(
                        text: 'fresh\ngroceries',
                        style: AppTextStyle()
                            .br48w700
                            .copyWith(color: const Color(0xFFEE9700), fontSize: width * 0.085),
                      ),
                      const TextSpan(text: ' can\nmake\na difference\nto your health'),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Get the best quality and most\ndelicious groceries in your area.',
                    style: AppTextStyle().br20w400.copyWith(fontSize: width * 0.045),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),

          // Bottom right image
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              width: width * 0.45,
              child: Assets.images.company.image18.image(fit: BoxFit.contain),
            ),
          ),

          // Button on image
          Positioned(
            bottom: height * 0.06,
            right: width * 0.35,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.015),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () async {
                await saveOnboardingSeen();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Shop now',
                    style: AppTextStyle().br16w400.copyWith(
                          color: Colors.white,
                          fontSize: width * 0.04,
                        ),
                  ),
                  SizedBox(width: width * 0.02),
                  const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveOnboardingSeen() async {
    var box = HiveHelper.getOnboardDetailsHiveBox();
    var id = OnBoardScreenHiveModel(isSeen: true);
    await box.put(DbKeys.user1Key, id);
  }
}
