import 'dart:convert';

import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/shared/api/api_helper.dart';
import 'package:ecommerce/shared/model/authorised/related_products/related_products.dart';

class ProductDetailsRepo {
  Future<ApiResponse?> onProductDetailsFetch({required int id}) async {
    try {
      var res = await ApiHelper.getData(
          endPoint: '/products/$id',
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()!.accessToken));

      if (res.status == 200) {
        return res;
      }
    } catch (e) {
      devPrintError('catch error in productDetails repo == $e');
    }

    return null;
  }

  Future<List<RelatedProductsModel>?> onRelatedProductDetailsFetch(
      {required int id}) async {
    try {
      var res = await ApiHelper.getData(
          endPoint: '/products/$id/related',
          header: ApiHelper.getApiHeader(
              access: GetHiveHelper.getUserDetailsHive()!.accessToken));

      if (res.status == 200) {
        List data = res.data;
        return data
            .map(
              (e) => RelatedProductsModel.fromJson(e),
            )
            .toList();
      }
    } catch (e) {
      devPrintError('catch error in productDetails repo == $e');
    }

    return null;
  }

  Future<ApiResponse?> onAddToCart(
      {required int productId, required int quantity}) async {
    try {
      devPrintWarning('Userid = ${GetHiveHelper.getUserDetailsHive()?.id}');
      devPrintWarning('productId = $productId');
      devPrintWarning('quantity = $quantity');
      var response = ApiHelper.postData(
          endPoint: '/cart/add',
          body: {
            "user_id": GetHiveHelper.getUserDetailsHive()?.id,
            "product_id": productId,
            "quantity": quantity
          },
          header: ApiHelper.getApiHeader(
            access: GetHiveHelper.getUserDetailsHive()?.accessToken,
          ));
      return response;
    } catch (e) {
      devPrintError('catch error in product details post catch = $e');
    }

    return null;
  }

  // Future<ApiResponse?> onBuyNow(
  //     {required int productId,
  //     required int quantity,
  //     required int price,
  //     Map<String, dynamic>? body}) async {
  //   try {
  //     var response = ApiHelper.postData(
  //         endPoint: '/orders/cod',
  //         body: {
  //           "user_id": GetHiveHelper.getUserDetailsHive()?.id,
  //           "payment_method": "cod",
  //           "items": [
  //             {"product_id": productId, "quantity": quantity, "price": price}
  //           ]
  //         },
  //         header: ApiHelper.getApiHeader(
  //           access: GetHiveHelper.getUserDetailsHive()?.accessToken,
            
  //         ));
  //     return response;
  //   } catch (e) {
  //     devPrintError('catch error in product details post catch = $e');
  //   }

  //   return null;
  // }

  Future<ApiResponse?> onBuyNow({
  required int productId,
  required int quantity,
  required int price,
  Map<String, dynamic>? body,
}) async {
  try {
    // Prepare the request body
    Map<String, dynamic> requestBody = {
      "user_id": GetHiveHelper.getUserDetailsHive()?.id,
      "payment_method": "cod",
      "items": [
        {"product_id": productId, "quantity": quantity, "price": price}
      ]
    };

    // Log the request body for debugging
    devPrintError('Request Body: ${json.encode(requestBody)}');

    // Make the API call
   var response = await ApiHelper.postDatas(
  endPoint: '/orders/cod',
  body: 
    {
    "user_id": GetHiveHelper.getUserDetailsHive()?.id,
    "payment_method": "cod",
    "items": [
        {
            "product_id": productId,
            "quantity": quantity,
            "price": price
        }
    ]

  },
  header: ApiHelper.getApiHeader(
    access: GetHiveHelper.getUserDetailsHive()?.accessToken,
    // contentType: "application/json",
  ),
);


    return response;
  } catch (e) {
    devPrintError('Catch error in product details post: $e');
  }

  return null;
}

}
