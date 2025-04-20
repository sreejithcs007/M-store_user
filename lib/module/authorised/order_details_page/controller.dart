import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/core/functions/date_function/date_function.dart';
import 'package:ecommerce/shared/model/my_order_model/my_order_model.dart';
import 'package:ecommerce/shared/repo/authorised/order_repo/order_repo.dart';
import 'package:get/get.dart';

class OrderDetailsPageController extends GetxController {
  OrderDetailsPageController({required this.id});
  int? id;

  RxList<MyOrderModel> orderedList = <MyOrderModel>[].obs;

  @override
  void onInit() {
    _initial();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> _initial() async {
    var response = await OrderRepo().onOrderFetchWithId(id: id!);

    devPrintError('response=== $response');

    if ((response != null)) {
      orderedList.value = response.order?.items
              ?.map(
                (e) => MyOrderModel(
                  createdAt: formatDateFromEpoch(
                          e.createdAt?.millisecondsSinceEpoch.toString()) ??
                      '',
                  deliveryStatus: response.order?.deliveryStatus ?? '',
                  paymentType: response.order?.paymentMethod ?? '',
                  itemName: e.product?.name ?? '',
                  itemOrderId: e.orderId.toString() ?? '',
                  itemQty:
                      double.tryParse(e.quantity.toString() ?? '0.0') ?? 0.0,
                  itemRate: double.tryParse(e.price ?? '0') ?? 0.0,
                  orderId: e.id.toString(),
                  imageUrl: e.product?.images ?? [],
                  unit: e.product?.quantityUnit ?? '',
                ),
              )
              .toList() ??
          [];
    }

    devPrintSuccess('orderdeyails length == ${orderedList.value.length} ');
  }
}
