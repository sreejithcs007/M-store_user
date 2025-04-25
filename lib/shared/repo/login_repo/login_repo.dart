import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';

class LoginRepo {
  Future<ApiResponse?> onLogin(
      {required String email, required String password}) async {
    try {
      var response = ApiHelper.postData(
          endPoint: '/user/login',
          body: {"identifier": email, "password": password});

      return response;
    } catch (e) {
      devPrintError('catchs = $e');
      return ApiResponse(status: 500, msg: 'failed', data: null);
    }
    return null;
  }
}
