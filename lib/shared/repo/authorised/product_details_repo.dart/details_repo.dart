import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';

class ProductDetailsRepo {
  Future<ApiResponse?> onProductDetailsFetch({required int id}) async {
    try {
      var res = await ApiHelper.getData(
          endPoint: '/products/$id',
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()!.accessToken));

      if (res.status == 200) {
        return res;
      }
    } catch (e) {
      devPrintError('catch error in productDetails repo == $e');
    }

    return null;
  }

  Future<ApiResponse?> onAddToCart(
      {required int productId, required int quantity}) async {
    try {
      devPrintWarning('Userid = ${GetHiveHelper.getUserDetailsHive()?.id}');
      devPrintWarning('productId = $productId');
      devPrintWarning('quantity = $quantity');
      var response = ApiHelper.postData(endPoint: '/cart/add', body: {
        "user_id": GetHiveHelper.getUserDetailsHive()?.id,
        "product_id": productId,
        "quantity": quantity
      },
      header: ApiHelper.getApiHeader(
        access: GetHiveHelper.getUserDetailsHive()?.accessToken,
      )
      );
      return response;
    } catch (e) {
      devPrintError('catch error in product details post catch = $e');
    }

    return null;
  }
}
