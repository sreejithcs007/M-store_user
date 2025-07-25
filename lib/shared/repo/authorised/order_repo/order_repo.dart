import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';
import 'package:ecommerce/shared/model/authorised/order_details_model/order_details_model.dart';
import 'package:ecommerce/shared/model/authorised/order_list/order_list.dart';

class OrderRepo {
  Future<List<Order>?> onOrderFetch() async {
    try {
      var res = await ApiHelper.getData(
          endPoint: '/user/orders',
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()?.accessToken));

      if (res.status == 200) {
        var OrderList = res.data['orders'] as List<dynamic>;
        return OrderList.map(
          (e) => Order.fromJson(e),
        ).toList();
      }
    } catch (e) {
      devPrintError('catch error in order list repo ==$e');
    }
    return null;
  }

  Future<OrderDetailsModel?> onOrderFetchWithId({required int id}) async {
    try {
      var res = await ApiHelper.getData(
          endPoint: '/orders/$id',
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()?.accessToken));

      if (res.status == 200) {
        // devPrintWarning('repo == ${res.data}');
        return OrderDetailsModel.fromJson(res.data);
      }
    } catch (e) {
      devPrintError('catch error in order list repo ==$e');
    }
    return null;
  }
}
