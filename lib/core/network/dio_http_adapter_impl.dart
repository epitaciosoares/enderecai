import 'package:dio/dio.dart';
import 'package:enderecai/core/network/http_adapter.dart';

class DioHttpAdapterImpl extends HttpAdapter {
  final Dio _dio = Dio();

  @override
  Future<Response> get(String url) async {
    return await _dio.get(url);
  }
}
