import 'package:ecommerce/shared/model/profile_model/profile_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxList<ProfileModel> profileHeaders = <ProfileModel>[
    ProfileModel(headerName: 'Name', value: 'sreejith'),
    ProfileModel(headerName: 'Email', value: 'sreejith@gmail.com'),
    ProfileModel(headerName: 'Address', value: 'Ernakulam'),
    ProfileModel(headerName: 'Phone No.', value: '98765432'),
    ProfileModel(headerName: 'State', value: 'Kerala'),
    ProfileModel(headerName: 'City', value: 'Ernakulam'),
    ProfileModel(headerName: 'Pincode', value: '1234'),
  ].obs;
}
