import 'package:flutter/material.dart';

void devPrint(String text, {PrintType type = PrintType.normal}) {
  switch (type) {
    case PrintType.normal:
      debugPrint(text);
      break;
    case PrintType.warning:
      devPrintWarning(text);
      break;
    case PrintType.error:
      devPrintError(text);
      break;
    case PrintType.success:
      devPrintSuccess(text);

  }
}

void devPrintWarning(String text) {
  debugPrint('\x1B[33m$text\x1B[0m');
}

void devPrintError(String text) {
  debugPrint('\x1B[31m$text\x1B[0m');
}

void devPrintSuccess(String text) {
  debugPrint('\x1B[32m$text\x1B[0m');
}

enum PrintType { normal, error, warning, success }