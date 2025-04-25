import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';
import 'package:ecommerce/shared/model/authorised/profile_fetch_model/profile_fetch.dart';

class ProfileRepo {
  Future<Users?> onProfileFetch() async {
    try {
      var res = await ApiHelper.getData(
          endPoint: '/profile/get-user-details',
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()?.accessToken));

      if (res.status == 200) {
        return ProfileFetchModel.fromJson(res.data).user;
      }
    } catch (e) {
      devPrintError('Catch error in profile fetch $e');
    }

    return null;
  }

  Future<ApiResponse?> onProfileUpdate(
      {required String name,
      required String address,
      required String phone,
      required String email,
      required String city,
      required String pinCode,
      required String profilePic}) async {
    try {
      var res = await ApiHelper.postData(
          endPoint: '/profile/edit',
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()?.accessToken),
          body: {
            " u_email": email,
            "u_phone": phone,
            // "city": city,
            "u_name": name,
            "u_address": address,
            // "u_profile_pic": profilePic,
            // "pin_code": pinCode,
          });

      if (res.status == 200) {
        return res;
      }
    } catch (e) {
      devPrint('post Error prodile = $e');
    }

    return null;
  }
  Future<ApiResponse?> onLogOut() async {
    try {
      var res = await ApiHelper.postData(
          endPoint: '/user/logout',
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()?.accessToken),);

      if (res.status == 200) {
        return res;
      }
    } catch (e) {
      devPrint('post Error prodile = $e');
    }

    return null;
  }
}
