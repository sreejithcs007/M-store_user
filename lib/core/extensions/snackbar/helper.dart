import 'package:ecommerce/core/constants/enum/snackbar_type.dart';
import 'package:flutter/material.dart';

extension SnackBarExtension on SnackbarType {
  Color getBgColor(BuildContext context) {
    return _bgColor(context)[this]!;
  }

  Color getTextColor(BuildContext context) {
    return _textColor(context)[this]!;
  }
}

Map<SnackbarType, Color> _bgColor(context) => {
      SnackbarType.error: const Color.fromARGB(255, 225, 106, 97),
      SnackbarType.success: const Color.fromARGB(255, 146, 237, 149),
      SnackbarType.warning: const Color.fromARGB(255, 244, 164, 46),
    };

Map<SnackbarType, Color> _textColor(context) => {
      SnackbarType.error: const Color.fromARGB(255, 225, 106, 97),
      SnackbarType.success: const Color.fromARGB(255, 146, 237, 149),
      SnackbarType.warning: const Color.fromARGB(255, 244, 164, 46),
    };
