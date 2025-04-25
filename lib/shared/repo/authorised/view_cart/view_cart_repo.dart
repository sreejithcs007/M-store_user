import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';
import 'package:ecommerce/shared/model/authorised/cart_model/view_cart_model.dart';

// class ViewCartRepo {
//   Future<List<CartModel>?> onViewCart() async {
//     try {
//       var userId = GetHiveHelper.getUserDetailsHive()!.id;
//       var res = await ApiHelper.getData(
//         endPoint: '/cart/user/$userId',
//         header: ApiHelper.getApiHeader(
//             access: GetHiveHelper.getUserDetailsHive()!.accessToken),
//       );

//       devPrintSuccess('datasss== ${res.data}');
//       if (res.status == 200) {
//         return res.data;
//       }
//     } catch (e) {
//       devPrintError('catch error in view cart repo == $e');
//     }
//   }
// }

class ViewCartRepo {
  Future<List<CartItem>?> onViewCart() async {
    try {
      var userId = GetHiveHelper.getUserDetailsHive()!.id;
      var res = await ApiHelper.getData(
        endPoint: '/cart/user/$userId',
        header: ApiHelper.getApiHeader(
          access: GetHiveHelper.getUserDetailsHive()!.accessToken,
        ),
      );

      devPrintSuccess('datasss == ${res.data}');

      if (res.status == 200) {
        final cartItemsJson = res.data['cart_items'] as List<dynamic>?;

        if (cartItemsJson != null) {
          return cartItemsJson.map((e) => CartItem.fromJson(e)).toList();
        }
      }
    } catch (e) {
      devPrintError('catch error in view cart repo == $e');
    }
    return null;
  }

  Future<ApiResponse?> onDeleteCartItem({required int cartId}) async {
    try {
      var res = await ApiHelper.delete(
          endPoint: '/cart/remove/$cartId',
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()?.accessToken));

      if (res.status == 200) {
        return res;
      }
    } catch (e) {
      devPrintError('catch error in cart view delete == $e');
    }
    return null;
  }

  Future<ApiResponse?> onQuantutyUpdateCartItem(
      {required int cartId, required int quantity}) async {
    try {
      var res = await ApiHelper.postData(
          endPoint: '/cart/update',
          body: {'cart_id': cartId, 'quantity': quantity},
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()?.accessToken));

      if (res.status == 200) {
        return res;
      }
    } catch (e) {
      devPrintError('catch error in cart view delete == $e');
    }

    return null;
  }
}
