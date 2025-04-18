import 'package:ecommerce/shared/model/cart_item/cart_item_model.dart';
import 'package:ecommerce/shared/model/categories/model.dart';
import 'package:ecommerce/shared/repo/authorised/dashboard_repo/dash_board_repo.dart';
import 'package:ecommerce/shared/repo/authorised/products_by_category/product_category_repo.dart';
import 'package:get/get.dart';

class ProductListScreenController extends GetxController {
  RxBool isProductLoading = false.obs;
  int? index;
  ProductListScreenController(this.index);
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final tabs = <String>[
    'Vegetables',
    'Fruits',
    'Stationery',
  ];

  // final productsPerTab = <List<Map<String, String>>>[
  //   [
  //     {'name': 'Tomato', 'price': '25.00'},
  //     {'name': 'Carrot', 'price': '65.00'},
  //   ],
  //   [
  //     {'name': 'Apple', 'price': '120.00'},
  //     {'name': 'Banana', 'price': '40.00'},
  //   ],
  //   [
  //     {'name': 'Notebook', 'price': '30.00'},
  //     {'name': 'Pen', 'price': '10.00'},
  //   ],
  //   [
  //     {'name': 'Notebook', 'price': '30.00'},
  //     {'name': 'Pen', 'price': '10.00'},
  //   ],
  //   [
  //     {'name': 'Notebook', 'price': '30.00'},
  //     {'name': 'Pen', 'price': '10.00'},
  //   ],
  // ];

  RxList<CartItem> productsPerTab = <CartItem>[].obs;

  void onTap({required int index, required int id}) async {
    isProductLoading.value = true;
    var responnse = await ProductCategoryRepo().onProductCategoryFetch(id: id);

    if ((responnse != null) && (responnse.isNotEmpty)) {
      productsPerTab.value = responnse
          .map(
            (e) => CartItem(
              isFavorite: false,
              name: e.name ?? '',
              price: e.price ?? '',
              quantity: e.quantity ?? 0,
              id: e.id!,
            ),
          )
          .toList();
    } else {
      productsPerTab.value = [];
    }
    isProductLoading.value = false;
  }

  @override
  void onInit() {
    _initial();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> _initial() async {
    var categoryResponse = await DashBoardRepo().onCategoryFetch();
    if ((categoryResponse != null) && (categoryResponse.isNotEmpty)) {
      categories.value = categoryResponse
          .map(
            (e) => CategoryModel(
                categoryName: e.name ?? '', imageUrl: e.image ?? '', id: e.id),
          )
          .toList();
    }

    onTap(index: index ?? 0, id: categories.value[index ?? 0].id!);
  }
}
