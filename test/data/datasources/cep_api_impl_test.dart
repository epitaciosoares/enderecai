import 'package:enderecai/core/network/dio_http_adapter_impl.dart';
import 'package:enderecai/data/datasources/cep_api_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Teste", () async {
    final api = CepApiImpl(DioHttpAdapterImpl());

    final response = await api.getAddressFromCep("60530-720");

    print(response);
  });
}
