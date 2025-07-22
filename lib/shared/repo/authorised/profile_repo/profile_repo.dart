import 'package:ecommerce/appconfig/appconfig.dart';
import 'package:ecommerce/core/db/hive_box_helper.dart';
import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';
import 'package:ecommerce/shared/model/authorised/profile_fetch_model/profile_fetch.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:http/http.dart' as http;

class ProfileRepo {
  /// Fetch user profile
  Future<Users?> onProfileFetch() async {
    try {
      devPrint('Fetching profile...');
      var res = await ApiHelper.getData(
        endPoint: '/profile/get-user-details',
        header: ApiHelper.getApiHeader(
          access: GetHiveHelper.getUserDetailsHive()?.accessToken,
        ),
      );

      if (res.status == 200) {
        devPrint('Profile fetch success');
        return ProfileFetchModel.fromJson(res.data).user;
      } else {
        devPrint('Profile fetch failed with status: ${res.status}');
      }
    } catch (e) {
      devPrintError('Catch error in profile fetch: $e');
    }

    return null;
  }

  /// Update user profile
  Future<ApiResponse?> onProfileUpdate({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String city,
    required String pinCode,
    http.MultipartFile? profilePic,
  }) async {
    try {
      final uri = Uri.parse('${AppConfig.baseurl}/profile/edit');

      var request = http.MultipartRequest('POST', uri);

      // Add headers
      request.headers.addAll(ApiHelper.getApiHeader(
        access: GetHiveHelper.getUserDetailsHive()?.accessToken,
      ));

      // Add form fields
      request.fields['u_email'] = email;
      request.fields['u_phone'] = phone;
      request.fields['u_name'] = name;
      request.fields['u_address'] = address;
      request.fields['city'] = city;
      request.fields['pin_code'] = pinCode;

      // Add profile picture
      if (profilePic != null) {
        request.files.add(profilePic);
      }

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      devPrint('Profile update response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        return ApiResponse(status: 200, msg: 'Success', data: "success");
      } else {
        devPrint('Profile update failed. Status code: ${response.statusCode}');
      }
    } catch (e) {
      devPrintError('Post Error profile = $e');
    }

    return null;
  }

  /// Logout user
  Future<ApiResponse?> onLogOut() async {
    try {
      devPrint('Logout called');

      final token = GetHiveHelper.getUserDetailsHive()?.accessToken;
      devPrint('Access Token: $token');

      var res = await ApiHelper.postData(
        endPoint: '/user/logout',
        header: ApiHelper.getApiHeader(access: token),
      );

      devPrint('Logout Response: ${res.status} - ${res.msg}');

      if (res.status == 200) {
        await HiveHelper.getUserDetailsHiveBox().clear(); // clear local session
        devPrint('User logged out successfully and local data cleared.');
        return res;
      } else {
        devPrint('Logout failed with status: ${res.status}');
      }
    } catch (e) {
      devPrintError('Logout Exception: $e');
    }

    return null;
  }
}

// import 'package:ecommerce/appconfig/appconfig.dart';
// import 'package:ecommerce/core/db/hive_helper.dart';
// import 'package:ecommerce/core/dev_tools/dev_tools.dart';
// import 'package:ecommerce/shared/api/api_helper.dart';
// import 'package:ecommerce/shared/model/authorised/profile_fetch_model/profile_fetch.dart';
// import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
// import 'package:http/http.dart';

// import 'package:http/http.dart' as http;


// class ProfileRepo {
//   Future<Users?> onProfileFetch() async {
//     try {
//       var res = await ApiHelper.getData(
//           endPoint: '/profile/get-user-details',
//           header: ApiHelper.getApiHeader(
//               access: GetHiveHelper.getUserDetailsHive()?.accessToken));

//       if (res.status == 200) {
//         return ProfileFetchModel.fromJson(res.data).user;
//       }
//     } catch (e) {
//       devPrintError('Catch error in profile fetch $e');
//     }

//     return null;
//   }


  
  
  
//   Future<ApiResponse?> onProfileUpdate({
//   required String name,
//   required String address,
//   required String phone,
//   required String email,
//   required String city,
//   required String pinCode,
//   http.MultipartFile? profilePic,
// }) async {
//   try {
//     final uri = Uri.parse('${AppConfig.baseurl}/profile/edit');

//     var request = http.MultipartRequest('POST', uri);

//     // Add headers
//     request.headers.addAll(ApiHelper.getApiHeader(
//       access: GetHiveHelper.getUserDetailsHive()?.accessToken,
//     ));

//     // Add fields
//     request.fields['u_email'] = email;
//     request.fields['u_phone'] = phone;
//     request.fields['u_name'] = name;
//     request.fields['u_address'] = address;
//     request.fields['city'] = city;
//     request.fields['pin_code'] = pinCode;

//     // Add file
//     if (profilePic != null) {
//       request.files.add(profilePic);
//     }

//     // Send request
//     var streamedResponse = await request.send();
//     var response = await http.Response.fromStream(streamedResponse);

//     if (response.statusCode == 200) {
//       return ApiResponse(status: 200, msg: 'Success', data: "success");
//     } else {
//       devPrint('Error status: ${response.statusCode}');
//     }
//   } catch (e) {
//     devPrint('Post Error profile = $e');
//   }

//   return null;
// }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
//   Future<ApiResponse?> onLogOut() async {
//     try {
//       var res = await ApiHelper.postData(
//           endPoint: '/user/logout',
//           header: ApiHelper.getApiHeader(
//               access: GetHiveHelper.getUserDetailsHive()?.accessToken),);

//       if (res.status == 200) {
//         return res;
//       }
//     } catch (e) {
//       devPrint('post Error prodile = $e');
//     }

//     return null;
//   }
// }
