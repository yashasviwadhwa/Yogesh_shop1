import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as get_package;

import 'package:loader_overlay/loader_overlay.dart';

import '../../utils/app_string.dart';

  extension DioExtension on Dio {
    /// Common GET method.
    Future<Response?> getApi(String path, {
      Map<String, dynamic>? queryParameters,})
    async {
      get_package.Get.context!.loaderOverlay.show();
      Response? response;

      try {
        response = await get(
          path,
          queryParameters: queryParameters,
        );
      } on DioException catch (e) {
        _showErrorSnacbar(e);
      } finally {
        get_package.Get.context!.loaderOverlay.hide();
      }

      return response;
    }

  Future<Response?> deleteApi(
    String path,) async {
    get_package.Get.context!.loaderOverlay.show();
    Response? response;

    try {
      response = await delete(
        path,
      );
    } on DioException catch (e) {
      _showErrorSnacbar(e);
    } finally {
      get_package.Get.context!.loaderOverlay.hide();
    }

    return response;
  }

  Future<Response?> directPostApi(
    String path, {
    dynamic body,
  }) async {
    get_package.Get.context!.loaderOverlay.show();

    Response? response;

    try {
      response = await post(
        path,
        data: body,
      );
    } on DioException catch (e) {
      _showErrorSnacbar(e);
    } finally {
      get_package.Get.context!.loaderOverlay.hide();
    }

    return response;
  }

  /// Common POST method.
  Future<Response?> postApi(
    String path, {
    dynamic body,
  }) async {
    get_package.Get.context!.loaderOverlay.show();
    Response? response;

    try {
      FormData formData = FormData.fromMap(body);
      response = await post(
        path,
        data: formData,
      );
    } on DioException catch (e) {
      _showErrorSnacbar(e);
    } finally {
      get_package.Get.context!.loaderOverlay.hide();
    }
    return response;
  }

  Future<Response?> putApi(
    String path, {
    dynamic body,
  }) async {
    get_package.Get.context!.loaderOverlay.show();
    Response? response;

    try {
      FormData formData = FormData.fromMap(body);
      response = await put(
        path,
        data: formData,
      );
    } on DioException catch (e) {
      _showErrorSnacbar(e);
    } finally {
      get_package.Get.context!.loaderOverlay.hide();
    }
    return response;
  }

  /// Common MULTIPART POST method.
  Future<Response?> postMultipartApi(
    String path, {
    FormData? formData,
    void Function(int, int)? onSendProgress,
    Options? options,
  }) async {
    get_package.Get.context!.loaderOverlay.show();
    Response? response;

    try {
      response = await post(
        path,
        options: options,
        data: formData,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (e) {
      _showErrorSnacbar(e);
    } finally {
      get_package.Get.context!.loaderOverlay.hide();
    }

    return response;
  }

  /// Common MULTIPART PUT method.
  Future<Response?> putMultipartApi(
    String path, {
    FormData? formData,
  }) async {
    get_package.Get.context!.loaderOverlay.show();
    Response? response;

    try {
      response = await put(
        path,
        data: formData,
      );
    } on DioException catch (e) {
      _showErrorSnacbar(e);
    } finally {
      get_package.Get.context!.loaderOverlay.hide();
    }

    // _showErrorSnacbarWhenStatusCodeIs200(response);
    return response;
  }

  void _showErrorSnacbar(DioException e) {
    debugPrint('This is error ===> $e');
    debugPrint('This is error ===> ${e.type}');
    switch (e.type) {
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionTimeout:
        get_package.Get.snackbar(
          AppString.serverTimeoutError,
          AppString.serverTimeoutErrorDetails,
        );
        break;

      case DioExceptionType.badResponse:
        debugPrint("Logger:- ${e.toString().contains('401')}");
        if(e.toString().contains('401')) {
          get_package.Get.snackbar(
            '',
            AppString.serverInvalidTokenError,
          );
        }
        break;

      case DioExceptionType.connectionError:
        get_package.Get.snackbar(
          AppString.noInternet,
          AppString.noInternetDetails,
        );
        break;

      default:
        get_package.Get.snackbar(
          AppString.errorOccurred,
          AppString.unknownErrorDetails,
        );
        break;
    }
  }

}
