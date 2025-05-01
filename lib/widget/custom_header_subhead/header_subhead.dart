import 'package:ecommerce/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HeaderWithSubhead extends StatelessWidget {
  const HeaderWithSubhead(
      {super.key, required this.headerName, required this.subHeaderName});

  final String headerName;
  final String subHeaderName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0,right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerName,
            style: AppTextStyle().br14w400,
          ),
          const Gap(10),
          Text(
            subHeaderName,
            style: AppTextStyle().br16w600,
          )
        ],
      ),
    );
  }
}
