import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:k_task/core/app_string.dart';

class ProductRepo {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: AppString.baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<Map<String, dynamic>> getProducts() async {
    try {
      Response response = await dio.get(AppString.endPoint);
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return {};
    }
  }
}
