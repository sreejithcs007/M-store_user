import 'package:ecommerce/shared/model/categories/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllController extends GetxController {
  RxBool isGridView = true.obs;
  final List<Map<String, String>> products = [
    {"title": "Tomato", "price": "25.00", "quantity": "1 KG"},
    {"title": "Carrot", "price": "65.00", "quantity": "1 KG"},
    {"title": "Onion", "price": "40.00", "quantity": "1 KG"},
    {"title": "Potato", "price": "33.00", "quantity": "1 KG"},
    {"title": "Capsicum", "price": "72.00", "quantity": "1 KG"},
    {"title": "Broccoli", "price": "60.00", "quantity": "1 KG"},
    {"title": "Cabbage", "price": "30.00", "quantity": "1 KG"},
    {"title": "Beetroot", "price": "35.00", "quantity": "1 KG"},
  ];

    final List<String> categories = [
    'vegetables',
    'fruits',
    'stationery'
  ]; 



  RxList<Widget> productsList = <Widget>[

  ].obs;


//Cart View tab names
  RxList<Widget> cartTabName = <Widget>[   
    Text(
      'Vegetables'
    ),
    Text(
      'Fruit'
    ),
    Text(
      'Stationery'
    ),
  ].obs;
}
