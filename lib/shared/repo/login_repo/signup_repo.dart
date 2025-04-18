import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';

class SignUpRepo {
  Future<ApiResponse?> onSignUp(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String address}) async {
    try {
      var response = await ApiHelper.postData(endPoint: '/newemployee', body: {
        "u_name": name,
        "u_email": email,
        "u_password": password,
        "u_phone": phone,
        "u_address": address
        // "u_employee_id": 0 (optional)
      });
      return response;
    } catch (e) {
      devPrintError('catch error in sign up repo = $e');
    }
    return null;
  }
}
