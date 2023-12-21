import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/api_constants.dart';

class HttpService {
  Dio? _dio;

  HttpService() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));

    initializeInterceptor();
  }

  Future<Response> getRequest() async {
    Response response = await _dio!.get("");
    return response;
  }

  void initializeInterceptor() {
    _dio!.interceptors.add(PrettyDioLogger());
  }
}
