import 'package:ecommerce/core/db/hive_box_helper.dart';
import 'package:ecommerce/core/db/hive_keys.dart';
import 'package:ecommerce/core/db/model/onboard/onboard.dart';
import 'package:ecommerce/core/db/model/user_details/user.dart';

//Accessing value stored in hive
class GetHiveHelper {
  static UserDetailsHive? getUserDetailsHive() {
    return HiveHelper.getUserDetailsHiveBox().get(DbKeys.userKey);
  }

  static OnBoardScreenHiveModel? getOnBoardDetailsHive() {
    return HiveHelper.getOnboardDetailsHiveBox().get(DbKeys.user1Key);
  }
}
