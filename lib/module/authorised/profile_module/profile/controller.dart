import 'package:ecommerce/shared/model/profile_model/profile_model.dart';
import 'package:ecommerce/shared/repo/authorised/profile_repo/profile_repo.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxList<ProfileModel> profileHeaders = <ProfileModel>[].obs;

  RxString imageUrl = ''.obs;
  RxInt superCoin = 0.obs;

  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  RxString email = ''.obs;
  RxString name = ''.obs;

  Future<void> _initial() async {
    var responses = await ProfileRepo().onProfileFetch();
    if (responses != null) {
      imageUrl.value = responses.uProfilePic ?? '';
      name.value = responses.uName ?? '';
      email.value = responses.uEmail ?? '';
      superCoin.value = responses.superCoins ?? 0;
    }

    var response = await ProfileRepo().onProfileFetch();

    if (response != null) {
      imageUrl.value = response.uProfilePic ?? '';

      profileHeaders.value = [
        ProfileModel(headerName: 'Name', value: response.uName ?? '-'),
        ProfileModel(headerName: 'Email', value: response.uEmail ?? '-'),
        ProfileModel(headerName: 'Address', value: response.uAddress ?? '-'),
        ProfileModel(headerName: 'Phone No.', value: response.uPhone ?? '-'),
        // ProfileModel(headerName: 'State', value:  response.``),
        ProfileModel(headerName: 'City', value: response.city ?? '-'),
        ProfileModel(headerName: 'Pincode', value: response.pinCode ?? '-'),
      ];
    }
  }
}
