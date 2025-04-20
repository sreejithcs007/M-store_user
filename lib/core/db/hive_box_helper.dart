import 'package:ecommerce/core/db/hive_keys.dart';
import 'package:ecommerce/core/db/model/onboard/onboard.dart';
import 'package:ecommerce/core/db/model/user_details/user.dart';
import 'package:hive/hive.dart';

//store to hive
class HiveHelper {
  static Box<UserDetailsHive> getUserDetailsHiveBox() =>
      Hive.box(DbKeys.userDetails);
  static Box<OnBoardScreenHiveModel> getOnboardDetailsHiveBox() =>
      Hive.box(DbKeys.user1Details);
}
