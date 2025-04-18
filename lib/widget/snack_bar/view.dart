import 'package:ecommerce/core/constants/enum/snackbar_type.dart';
import 'package:ecommerce/widget/snack_bar/snackbar.dart';

void fnShowSnackBarError(String text) {
  showDesktopSnackbar(text: text, type: SnackbarType.error);
}

void fnShowSnackBarSucess(String text) {
  showDesktopSnackbar(text: text, type: SnackbarType.success);
}

void fnShowSnackBarWarning(String text) {
  showDesktopSnackbar(text: text, type: SnackbarType.warning);
}
