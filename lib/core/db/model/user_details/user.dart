import 'package:hive/hive.dart';

part 'user.g.dart';
@HiveType(typeId: 0)
class UserDetailsHive extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String userEmail;
  @HiveField(2)
  late String userPhoneNo;
  @HiveField(3)
  late String accessToken;


UserDetailsHive({
required this.id,
required this.userEmail,
required this.userPhoneNo,
required this.accessToken,
});


}
