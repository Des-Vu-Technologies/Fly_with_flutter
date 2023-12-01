import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpService {
  Dio? _dio;

  final baseUrl = "https://reqres.in";

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async {
    Response? res;

    try {
      log(endPoint);
      res = await _dio!.get(endPoint);
      log("Response Status Code: ${res.statusCode}");

      // Check if response data is available and not null
      if (res.data != null) {
        log("Response Data: ${json.encode(res.data)}");
      } else {
        log("Empty Response Data");
      }
    } on DioException catch (e) {
      log("Dio Error: ${e.message}");
      throw Exception(e.message);
    }
    return res;
  }

  initializeInterceptors() {
    _dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }
}
