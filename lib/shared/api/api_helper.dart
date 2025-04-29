import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce/appconfig/appconfig.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Map<String, String> getApiHeader({String? access, String? dbName}) {
    if (access != null) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $access',
      };
    } else if (dbName != null) {
      return {'Content-Type': 'application/json', 'dbName': dbName};
    } else {
      return {'Content-Type': 'application/json'};
    }
  }

  static Future<ApiResponse> getData({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    log("Api-helper -> getData");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("header=$header");
    log("$url");

    try {
      var response = await http.get(url, headers: header);
      log("ApiHelper>>Api Called => status code=${response.statusCode}");
      var decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(
          status: response.statusCode,
          msg: "Success",
          data: decodedData,
        );
      } else {
        log("Else Condition -> Api failed");
        return ApiResponse(
          status: response.statusCode,
          msg: "Failed",
          data: decodedData,
        );
      }
    } catch (e) {
      log("$e");
      rethrow;
    }
  }

  static Future<ApiResponse> postData({
    required String endPoint,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  }) async {
    log("Api-helper -> postData");
    devPrintError("$body");

    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("header=$header");
    log("$url");

    // Convert body safely to Map<String, String>
    final safeBody = <String, String>{};
    body?.forEach((key, value) {
      if (value != null) {
        safeBody[key] = value.toString();
      }
    });

    devPrintSuccess('safeBody \n $safeBody'); 

    try {
      var response = await http.post(url, body: safeBody, headers: header);
      log("ApiHelper>>Api Called => status code=${response.statusCode}");
      var decodedData = jsonDecode(response.body);

      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return ApiResponse(
          status: response.statusCode,
          msg: "Success",
          data: decodedData,
        );
      } else {
        print("Else Condition -> Api failed  ");
        return ApiResponse(
          status: response.statusCode,
          msg: "Failed",
          data: decodedData,
        );
      }
    } catch (e) {
      print('catch error api helper : $e');
      log("$e");
      rethrow;
    }
  }

static Future<ApiResponse?> postDatas({
  required String endPoint,
  required Map<String, dynamic> body,
  required Map<String, String> header,
}) async {
  try {
    var url = Uri.parse(AppConfig.baseurl + endPoint);
    
    // Ensure body is encoded properly as JSON
    var response = await http.post(
      url,
      headers: header,
      body: jsonEncode(body),  // Ensure the body is JSON-encoded
    );

    if (response.statusCode == 200) {
      return ApiResponse(
          status: response.statusCode,
          msg: "Success",
          data: response.body,
        );
    } else {
      // Handle error response
      return ApiResponse(
          status: response.statusCode,
          msg: "Failed",
          data: response.body,
        );
    }
  } catch (e) {
    throw Exception('Error in postData: $e');
  }
}

  
  
  static Future<ApiResponse> delete({
    required String endPoint,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  }) async {
    log("Api-helper -> delete()");
    log("$body");

    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("header=$header");
    log("final url -> $url");

    // Convert body safely to Map<String, String>
    final safeBody = <String, String>{};
    body?.forEach((key, value) {
      if (value != null) {
        safeBody[key] = value.toString();
      }
    });

    try {
      var response = await http.delete(url, body: safeBody, headers: header);
      log("ApiHelper -> Api Called -> status code=${response.statusCode}");

      var decodedData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(
          status: response.statusCode,
          msg: "Success",
          data: decodedData,
        );
      } else {
        log("Else Condition -> Api failed");
        return ApiResponse(
          status: response.statusCode,
          msg: "Failed",
          data: decodedData,
        );
      }
    } catch (e) {
      log("catch error api helper : $e");
      rethrow;
    }
  }

  static Future<ApiResponse> postMultipartData({
    required String endPoint,
    Map<String, dynamic>? fields,
    Map<String, String>? headers,
    List<http.MultipartFile>? files,
  }) async {
    final uri = Uri.parse(AppConfig.baseurl + endPoint);
    log("📤 Posting to: $uri");
    print("📦 Fields: $fields");

    var request = http.MultipartRequest('POST', uri);

    if (headers != null) {
      request.headers.addAll(headers);
    }

    if (fields != null) {
      // Convert values to String, filter out nulls
      fields.forEach((key, value) {
        if (value != null) {
          request.fields[key] = value.toString();
        }
      });
    }

    if (files != null) {
      request.files.addAll(files);
    }

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      log("✅ Status Code: ${response.statusCode}");

      final data = jsonDecode(response.body);

      return ApiResponse(
        status: response.statusCode,
        msg: (response.statusCode == 200 || response.statusCode == 201)
            ? 'Success'
            : 'Failed',
        data: data,
      );
    } catch (e) {
      log("❌ Error: $e");
      rethrow;
    }
  }
}

class ApiResponse {
  final int status;
  final String msg;
  final dynamic data;

  ApiResponse({required this.status, required this.msg, required this.data});
}
