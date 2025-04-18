import 'package:ecommerce/core/db/hive_box_helper.dart';
import 'package:ecommerce/core/db/hive_keys.dart';
import 'package:ecommerce/core/db/model/user_details/user.dart';

class GetHiveHelper {
  static UserDetailsHive? getUserDetailsHive() {
    return HiveHelper.getUserDetailsHiveBox().get(DbKeys.userKey);
  }
}
