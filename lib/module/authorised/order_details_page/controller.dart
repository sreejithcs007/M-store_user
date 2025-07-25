import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/core/functions/date_function/date_function.dart';
import 'package:ecommerce/shared/model/my_order_model/my_order_model.dart';
import 'package:ecommerce/shared/repo/authorised/order_repo/order_repo.dart';
import 'package:ecommerce/widget/custom_time_line/custome_time_line.dart';
import 'package:get/get.dart';

class OrderDetailsPageController extends GetxController {
  OrderDetailsPageController({required this.id});
  int? id;

  RxList<MyOrderModel> orderedList = <MyOrderModel>[].obs;
  RxString deliveryName = ''.obs;
  RxString deliveryGmail = ''.obs;
  RxString deliveryAddress = ''.obs;
  RxString deliveryPincode = ''.obs;

  RxList<TimelineStep> deliverySteps = <TimelineStep>[].obs;
  RxString currentStatus = "".obs;

  @override
  void onInit() {
    _initial();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> _initial() async {
    var response = await OrderRepo().onOrderFetchWithId(id: id!);

    // devPrintError('response=== $response');

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

      deliveryName.value = response.order?.user?.uName ?? '';
      deliveryGmail.value = response.order?.user?.uEmail ?? '';
      deliveryAddress.value = response.order?.user?.uAddress ?? '';
      deliveryPincode.value = response.order?.user?.pinCode ?? '';

      deliverySteps.value = [
        TimelineStep(
            title: "Product collected",
            time: formatTimestamp(response.order?.collectedAt == null
                    ? '1'
                    : (response.order?.collectedAt.toString() ?? '')) ??
                ''),
        TimelineStep(
            title: "On going",
            time: formatTimestamp(response.order?.onGoingAt == null
                    ? ''
                    : (response.order?.onGoingAt.toString() ?? '')) ??
                ''),
        TimelineStep(
            title: "Delivered",
            time: formatTimestamp(response.order?.deliveredAt == null
                    ? ''
                    : (response.order?.deliveredAt.toString() ?? '')) ??
                ''),
      ];
      currentStatus.value = capitalizeFirst(response.order?.status) ?? 'Pending';
      // print('currentStatus =$currentStatus');

    }

    // devPrintSuccess('orderdeyails length == ${orderedList.value.length} ');
  }
}
