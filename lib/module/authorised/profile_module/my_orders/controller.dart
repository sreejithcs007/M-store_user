import 'package:ecommerce/shared/model/my_order_model/my_order_model.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController{

  RxList<MyOrderModel>orderedList = <MyOrderModel>[
    MyOrderModel(
      itemName: 'tomato',
      itemQty: 100,
      itemRate: 29,
      orderId: '1234',
      paymentType: 1,
      createdAt: 1234567,
      deliveryStatus: 'ongoing'
    ),
    MyOrderModel(
      itemName: 'onion',
      itemQty: 100,
      itemRate: 29,
      orderId: '1321',
      paymentType: 1,
      createdAt: 1234567,
      deliveryStatus: 'ongoing'

    ),
    MyOrderModel(
      itemName: 'carrot',
      itemQty: 100,
      itemRate: 29,
      orderId: '11234',
      paymentType: 1,
      createdAt: 1234567,
      deliveryStatus: 'delivered'

    ),
    MyOrderModel(
      itemName: 'carror',
      itemQty: 100,
      itemRate: 29,
      orderId: '11234',
      paymentType: 1,
      createdAt: 1234567,
      deliveryStatus: 'ongoing'

    ),
    MyOrderModel(
      itemName: 'carror',
      itemQty: 100,
      itemRate: 29,
      orderId: '11234',
      paymentType: 1,
      createdAt: 1234567,
      deliveryStatus: 'ongoing'

    ),

  ].obs;
  RxList<MyOrderModel>trackingList = <MyOrderModel>[
    MyOrderModel(
      itemName: 'tomato',
      itemQty: 100,
      itemRate: 29,
      orderId: '1234',
      paymentType: 1,
      createdAt: 1234567,
      deliveryStatus: 'ongoing'

    ),
    MyOrderModel(
      itemName: 'onion',
      itemQty: 100,
      itemRate: 29,
      orderId: '1321',
      paymentType: 1,
      createdAt: 1234567,
      deliveryStatus: 'ongoing'

    ),
    MyOrderModel(
      itemName: 'carrot',
      itemQty: 100,
      itemRate: 29,
      orderId: '11234',
      paymentType: 1,
      createdAt: 1234567,
      deliveryStatus: 'ongoing'

    ),
    MyOrderModel(
      itemName: 'carror',
      itemQty: 100,
      itemRate: 29,
      orderId: '11234',
      paymentType: 1,
      createdAt: 1234567,
      deliveryStatus: 'ongoing'

    ),
    MyOrderModel(
      itemName: 'carror',
      itemQty: 100,
      itemRate: 29,
      orderId: '11234',
      paymentType: 1,
      createdAt: 1234567,
      deliveryStatus: 'ongoing'

    ),

  ].obs;

}