import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';
import 'package:ecommerce/shared/model/authorised/wishlist_Model/wishlist_model.dart';

class WishListRepo {
  Future<List<WishListFetchModel>?> onWishListFetch() async {
    try {
      var res = await ApiHelper.getData(
          endPoint: '/favorite/list',
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()?.accessToken));

      if (res.status == 200) {
           List<WishListFetchModel> wishList = (res.data as List)
          .map((item) => WishListFetchModel.fromJson(item))
          .toList();
      
      return wishList;
      }
    } catch (e) {
      devPrintError('Catch error in wishlist rep ==$e');
    }
    return null;
  }

  Future<ApiResponse?> onWishListPostAdd({required int productId}) async {
    try {
      var res = await ApiHelper.postDatas(
          endPoint: '/favorite/add',
          body: {
            "user_id": GetHiveHelper.getUserDetailsHive()?.accessToken,
            "product_id": productId
          },
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()?.accessToken));
    } catch (e) {
      devPrintError('catch Error in wishlist post  == $e');
    }

    return null;
  }
Future<ApiResponse?> onWishListPostDelete({required int productId}) async {
  try {
    final accessToken = GetHiveHelper.getUserDetailsHive()?.accessToken;

    var res = await ApiHelper.delete(
      endPoint: '/favorite/remove',
      header: ApiHelper.getApiHeader(access: accessToken),
      body: {"product_id": productId}, // ✅ Correct body
    );

    if (res.status == 200) {
      return res;
    } else {
      devPrintError('Failed to remove wishlist item. Status: ${res.status}');
    }
  } catch (e) {
    devPrintError('Catch Error in wishlist post == $e');
  }

  return null;
}


}
