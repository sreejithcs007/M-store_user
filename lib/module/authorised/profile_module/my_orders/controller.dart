import 'package:ecommerce/core/functions/date_function/date_function.dart';
import 'package:ecommerce/module/authorised/order_details_page/screens.dart';
import 'package:ecommerce/shared/model/my_order_model/my_order_model.dart';
import 'package:ecommerce/shared/repo/authorised/order_repo/order_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {
  RxList<MyOrderModel> orderedList = <MyOrderModel>[
    // MyOrderModel(
    //     itemName: 'tomato',
    //     itemQty: 100,
    //     itemRate: 29,
    //     orderId: '1234',
    //     paymentType: 1,
    //     createdAt: 1234567,
    //     deliveryStatus: 'ongoing',
    //     itemOrderId: ''),
    // MyOrderModel(
    //     itemName: 'onion',
    //     itemQty: 100,
    //     itemRate: 29,
    //     orderId: '1321',
    //     paymentType: 1,
    //     createdAt: 1234567,
    //     deliveryStatus: 'ongoing',
    //     itemOrderId: ''),
    // MyOrderModel(
    //     itemName: 'carrot',
    //     itemQty: 100,
    //     itemRate: 29,
    //     orderId: '11234',
    //     paymentType: 1,
    //     createdAt: 1234567,
    //     deliveryStatus: 'delivered',
    //     itemOrderId: ''),
    // MyOrderModel(
    //     itemName: 'carror',
    //     itemQty: 100,
    //     itemRate: 29,
    //     orderId: '11234',
    //     paymentType: 1,
    //     createdAt: 1234567,
    //     deliveryStatus: 'ongoing',
    //     itemOrderId: ''),
    // MyOrderModel(
    //     itemName: 'carror',
    //     itemQty: 100,
    //     itemRate: 29,
    //     orderId: '11234',
    //     paymentType: 1,
    //     createdAt: 1234567,
    //     deliveryStatus: 'ongoing',
    //     itemOrderId: ''),
  ].obs;
  RxList<MyOrderModel> trackingList = <MyOrderModel>[
    // MyOrderModel(
    //     itemName: 'tomato',
    //     itemQty: 100,
    //     itemRate: 29,
    //     orderId: '1234',
    //     paymentType: 1,
    //     createdAt: 1234567,
    //     deliveryStatus: 'ongoing',
    //     itemOrderId: ''),
    // MyOrderModel(
    //     itemName: 'onion',
    //     itemQty: 100,
    //     itemRate: 29,
    //     orderId: '1321',
    //     paymentType: 1,
    //     createdAt: 1234567,
    //     deliveryStatus: 'ongoing',
    //     itemOrderId: ''),
    // MyOrderModel(
    //     itemName: 'carrot',
    //     itemQty: 100,
    //     itemRate: 29,
    //     orderId: '11234',
    //     paymentType: 1,
    //     createdAt: 1234567,
    //     deliveryStatus: 'ongoing',
    //     itemOrderId: ''),
    // MyOrderModel(
    //     itemName: 'carror',
    //     itemQty: 100,
    //     itemRate: 29,
    //     orderId: '11234',
    //     paymentType: 1,
    //     createdAt: 1234567,
    //     deliveryStatus: 'ongoing',
    //     itemOrderId: ''),
    // MyOrderModel(
    //     itemName: 'carror',
    //     itemQty: 100,
    //     itemRate: 29,
    //     orderId: '11234',
    //     paymentType: 1,
    //     createdAt: 1234567,
    //     deliveryStatus: 'ongoing',
    //     itemOrderId: ''),
  ].obs;

  void onToDetailsPage(BuildContext context, {required int id}) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => OrderDetailsPage(
                id: id,
              )),
    );
  }

  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  Future<void> _initial() async {
    var response = await OrderRepo().onOrderFetch();

    if ((response != null) && (response.isNotEmpty)) {
      orderedList.value = response
          .where((e) =>
              e.items != null && e.items!.every((item) => item.product != null))
          .map(
            (e) => MyOrderModel(
              createdAt: formatDateFromEpoch(
                      e.createdAt?.millisecondsSinceEpoch.toString()) ??
                  '',
              deliveryStatus: e.deliveryStatus ?? '',
              paymentType: e.paymentMethod ?? '',
              itemName:
                  e.items?.map((element) => element.product?.name).join(',') ??
                      '',
              itemOrderId: e.id.toString(),
              itemQty: e.items?.fold<double>(
                    0.0,
                    (sum, element) =>
                        sum + (element.quantity?.toDouble() ?? 0.0),
                  ) ??
                  0.0,
              itemRate: double.tryParse(e.totalAmount ?? '0') ?? 0.0,
              orderId: e.id.toString(),
              imageUrl: e.items != null
                  ? e.items!
                      .map((item) => item.product?.images?.isNotEmpty == true
                          ? item.product!.images!.first
                          : null)
                      .whereType<String>()
                      .toList()
                  : [],
            ),
          )
          .toList();
    }
  }
}
