import 'package:dio/dio.dart';

class DioProvider {
  static Dio createDioWithoutHeader() {
    Dio dio = Dio(BaseOptions(baseUrl: "api"));
    return dio;
  }
}
