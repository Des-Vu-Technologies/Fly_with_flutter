import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/api_constants.dart';

class HttpService {
  Dio? _dio;

  HttpService() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));

    initializeInterceptor();
  }

  Future<Response> getRequest(String? endpoint) async {
    Response response = await _dio!.get(endpoint!, queryParameters: {
      "lat": 28.1885407,
      "lon": 84.0322231,
      "appid": "5ab38c588a5e81b2b76217f4052bac04",
      "units": "metric"
    });
    //Response response = await _dio!.post();

    return response;
  }

  void initializeInterceptor() {
    _dio!.interceptors.add(PrettyDioLogger());
  }
}
