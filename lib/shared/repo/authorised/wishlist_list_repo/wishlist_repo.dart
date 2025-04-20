import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';
import 'package:ecommerce/shared/model/authorised/wishlist_Model/wishlist_model.dart';

class WishListRepo {
  Future<WishListFetchModel?> onWishListFetch() async {
    try {
      var res = await ApiHelper.getData(
          endPoint: '/favorite/list',
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()?.accessToken));

      if (res.status == 200) {
        return WishListFetchModel.fromJson(res.data);
      }
    } catch (e) {
      devPrintError('Catch error in wishlist rep ==$e');
    }
    return null;
  }
}
