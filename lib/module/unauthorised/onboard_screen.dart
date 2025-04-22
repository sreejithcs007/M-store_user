import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/core/db/hive_box_helper.dart';
import 'package:ecommerce/core/db/hive_keys.dart';
import 'package:ecommerce/core/db/model/onboard/onboard.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/unauthorised/authentication/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class GroceryPromoScreen extends StatelessWidget {
  const GroceryPromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          //!.. Background Gradient with content
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // colors: [Color(0xFFF0EEEB), Color(0xFFE3DED2)],
                colors: [Color.fromARGB(255, 255, 253, 253), Color(0xFFE3DED2)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Assets.images.company.companyLogo.image(fit: BoxFit.cover),
                const Gap(70),
                RichText(
                  text: TextSpan(
                    style: AppTextStyle().br48w700,
                    children: [
                      const TextSpan(text: 'Choosing '),
                      TextSpan(
                        text: 'fresh\ngroceries',
                        style: AppTextStyle()
                            .br48w700
                            .copyWith(color: const Color(0xFFEE9700)),
                      ),
                      const TextSpan(
                          text: ' can\nmake\na difference\nto your health'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Get the best quality and most\ndelicious groceries in your area.',
                    style: AppTextStyle().br20w400,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),

          // Bottom right image over the content
          Positioned(
            bottom: 0,
            right: 0,
            child: Assets.images.company.image18.image(),
          ),

          // Optional: Add a button on top of the image (if needed)
          Positioned(
            bottom: 50,
            right: 220,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: ()async {
  await saveOnboardingSeen();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginView(),
                    ));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Shop now',
                      style: AppTextStyle()
                          .br16w400
                          .copyWith(color: Colors.white)),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 16),
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
