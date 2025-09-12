import 'package:dio/dio.dart' as http;

abstract class HttpAdapter {
  Future<http.Response> get(String url);
}
