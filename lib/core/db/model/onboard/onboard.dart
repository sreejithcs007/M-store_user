import 'package:hive/hive.dart';
part 'onboard.g.dart';

@HiveType(typeId: 1)
class OnBoardScreenHiveModel {
  @HiveField(0)
  bool? isSeen;

  OnBoardScreenHiveModel({this.isSeen = false});
}
