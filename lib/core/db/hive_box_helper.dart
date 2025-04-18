import 'package:ecommerce/core/db/hive_keys.dart';
import 'package:ecommerce/core/db/model/user_details/user.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static Box<UserDetailsHive> getUserDetailsHiveBox() =>
      Hive.box(DbKeys.userDetails);
}
