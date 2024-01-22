import 'package:dio/dio.dart';

abstract class ApiClient {
  /// Should be called on Token expiry to stop all api calls immediately.
  void closeDioClient();

  //Future<Response?> login(Map<String, String> request);

  Future<Response?> productList();
  Future<Response?> product(result);
  Future<Response?> productAdd(result);
  Future<Response?> productUpdate(url, result);
  Future<Response?> productDelete(result);
  Future<Response?> addToCartList();

}
