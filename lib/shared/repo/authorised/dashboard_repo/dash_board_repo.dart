import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';
import 'package:ecommerce/shared/model/authorised/banner_list/banner_list';
import 'package:ecommerce/shared/model/authorised/category_list/category_list.dart';

class DashBoardRepo {
  Future<List<CategoryListModel>?> onCategoryFetch() async {
    try {
      var data = await ApiHelper.getData(
          endPoint: '/user/categories',
          header: ApiHelper.getApiHeader(
            access: GetHiveHelper.getUserDetailsHive()!.accessToken,
          ));
      if (data.status == 200) {
        List res = data.data;

        return res.map((e) => CategoryListModel.fromJson(e),).toList();
      }
    } catch (e) {
      devPrintError('catch error in dashBoard category repo == $e');
    }
    return null;
  }
  Future<List<BannerModel>?> onBannerFetch() async {
    try {
      var data = await ApiHelper.getData(
          endPoint: '/user/banners',
          header: ApiHelper.getApiHeader(
            access: GetHiveHelper.getUserDetailsHive()!.accessToken,
          ));
      if (data.status == 200) {
        List res = data.data;

        return res.map((e) => BannerModel.fromJson(e),).toList();
      }
    } catch (e) {
      devPrintError('catch error in dashBoard category repo == $e');
    }
    return null;
  }
}
