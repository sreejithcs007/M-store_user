import 'package:ecommerce/shared/model/categories/model.dart';
import 'package:ecommerce/shared/repo/authorised/dashboard_repo/dash_board_repo.dart';
import 'package:get/get.dart';

class ViewAllController extends GetxController {
  RxBool isGridView = true.obs;

   RxList<CategoryModel> categories = <CategoryModel>[].obs;


  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  Future<void> _initial() async{

       var categoryResponse = await DashBoardRepo().onCategoryFetch();
    if ((categoryResponse != null) && (categoryResponse.isNotEmpty)) {
      categories.value = categoryResponse
          .map(
            (e) => CategoryModel(
                categoryName: e.name ?? '', imageUrl: e.image ?? '', id: e.id),
          )
          .toList();
    }



  }
}
