import 'package:dio/dio.dart';
import 'package:e_shop/app/network/dio/dio_extension.dart';
import 'package:e_shop/app/utils/api_constant.dart';
import 'package:flutter/foundation.dart';

import '../api_client.dart';

class DioApiClient implements ApiClient {
  DioApiClient() {
    _dio = _onInit();
  }

  late Dio _dio;

  Dio _onInit() {
    final dio = Dio();
    dio.options.baseUrl = ApiConstant.baseUrl;
    dio.options.sendTimeout = const Duration(seconds: 60);
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (kDebugMode) {
            if (options.data is FormData) {
              FormData d = options.data;
              for (var field in d.fields) {
                debugPrint('Fields: ${field.key}: ${field.value}');
              }
              for (var field in d.files) {
                debugPrint(
                  'Files: ${field.key}: ${field.value.filename} ${field.value.contentType?.mimeType}',
                );
              }
            }
          }
          return handler.next(options);
        },
      ),
    );

    // Add logging interceptor with debug check.
    dio.interceptors.add(
      LogInterceptor(
        request: kDebugMode,
        error: kDebugMode,
        responseHeader: kDebugMode,
        requestBody: kDebugMode,
        requestHeader: kDebugMode,
        responseBody: kDebugMode,
      ),
    );

    return dio;
  }

  // ignore: unused_element
  // void _addAuthorizationTokenInHeader() {
  //   final token = SessionManager.getUserToken();
  //   if (token.isNotEmpty) {
  //     _  dio.options.headers["Authorization"] = 'Bearer $token';
  //     //_dio.options.headers["authorisation"] = token;
  //   }
  // }

  void _removeAuthorizationTokenFromHeader() {
    _dio.options.headers.remove("authorization");
  }

  @override
  void closeDioClient() {
    _dio.close(force: true);
  }

  // @override
  // Future<Response?> login(request) async {
  //   // TODO: Need to call this later.
  //   _removeAuthorizationTokenFromHeader();
  //   final response = await _dio.postApi(
  //     ApiConstants.login,
  //     body: request,
  //   );
  //   return response;
  // }

  @override
  Future<Response?> productList() async {
    _removeAuthorizationTokenFromHeader();
    final response = await _dio.getApi(
      ApiConstant.productList,
    );
    return response;
  }

  @override
  Future<Response?> product(result) async {
    _removeAuthorizationTokenFromHeader();
    final response = await _dio.getApi(
      '${ApiConstant.productList}/$result',
    );
    return response;
  }

  @override
  Future<Response?> productAdd(result) async {
    _removeAuthorizationTokenFromHeader();
    final response = await _dio.directPostApi(
      ApiConstant.productAdd,
      body: result
    );
    return response;
  }

  @override
  Future<Response?> productUpdate(url, result) async {
    _removeAuthorizationTokenFromHeader();
    final response = await _dio.putApi(
        '${ApiConstant.productList}/$url',
      body: result
    );
    return response;
  }

  @override
  Future<Response?> productDelete(result) async {
    _removeAuthorizationTokenFromHeader();
    final response = await _dio.deleteApi(
      '${ApiConstant.productList}/$result',
    );
    return response;
  }

  @override
  Future<Response?> addToCartList() async {
    _removeAuthorizationTokenFromHeader();
    final response = await _dio.getApi(
      ApiConstant.addToCartList,
    );
    return response;
  }

}
