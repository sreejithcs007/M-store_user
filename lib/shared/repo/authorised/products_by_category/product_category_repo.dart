import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';
import 'package:ecommerce/shared/model/authorised/product_category_model/product_cat_model.dart';

class ProductCategoryRepo {
  Future<List<ProductCategoryModel>?> onProductCategoryFetch(
      {required int id}) async {
    try {
      var response = await ApiHelper.getData(
          endPoint: '/products/category/$id',
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()!.accessToken));

      if (response.status == 200) {
        List data = response.data;

        return data
            .map(
              (e) => ProductCategoryModel.fromJson(e),
            )
            .toList();
      }
    } catch (e) {
      devPrint('productCategory repo catch $e');
    }

    return null;
  }
}
