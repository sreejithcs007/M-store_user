import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';
import 'package:ecommerce/shared/model/authorised/notification/model.dart';

class NotificationRepo {
  Future<List<Notification>> getAllNotification() async {
    try {
      var res = await ApiHelper.getData(
          endPoint: '/user/notifications',);

      if (res.status == 200) {
     
      return NotificationListModel.fromJson(res.data).notifications??[];
      }
    } catch (e) {
      devPrintError('Catch error in wishlist rep ==$e');
    }
    return [];
  }
}