import 'package:flutter/material.dart';

class HeaderWithSubhead extends StatelessWidget {
  const HeaderWithSubhead(
      {super.key, required this.headerName, required this.subHeaderName});

  final String headerName;
  final String subHeaderName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(headerName),
        SizedBox(
          height: 20,
        ),
        Text(subHeaderName)
      ],
    );
  }
}
