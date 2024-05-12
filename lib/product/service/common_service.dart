import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/service/mixin/common_service_mixin.dart';
import 'package:stocket/product/utility/constants/enums/status_code.dart';
import 'package:stocket/product/utility/response/api_response.dart';

/// [CommonService] is a common service class that contains common methods
/// that can be used in multiple places.
/// Like `CRUD` processes, `API` calls, etc.
final class CommonService with CommonServiceMixin {
  CommonService._() {
    _baseUrl = DevEnv().baseUrl;
    log('Base URL: $_baseUrl');

    final baseOptions = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 30),
    );
    _dio = Dio(baseOptions);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (shouldAddToken(options: options)) {
            log('should add token');
            options.headers['token'] = _token;
          }
          return handler.next(options);
        },
      ),
    );
  }

  static CommonService instance = CommonService._();

  late String _token;
  late String _baseUrl;
  late Dio _dio;

  /// [set] method is used to set the token.
  set token(String token) => _token = token;

  /// [getModel] method is generic method that is used to get data from the API.
  /// [ApiResponse] is returned based on the response.
  Future<ApiResponse<dynamic>> getModel<T extends BaseModel<T>>({
    required String domain,
    required T model,
  }) async {
    try {
      final response = await _dio.get<dynamic>('$domain');
      final responseCode = HttpResult.fromStatusCode(response.statusCode!);
      final responseBody = response.data;

      switch (responseCode) {
        case HttpResult.success:
          if (responseBody is List) {
            final data = responseBody
                .map((e) => model.fromJson(e as Map<String, dynamic>))
                .toList();
            return ApiResponse<List<T>>.success(data: data);
          } else if (responseBody is Map) {
            final data = model.fromJson(responseBody.cast<String, dynamic>());
            return ApiResponse<T>.success(data: data);
          }

          return ApiResponse.failure(
            data: responseBody,
            result: HttpResult.unknown,
            error: LocaleKeys.errors_unknown_response_type.tr(),
          );

        default:
          return ApiResponse.failure(data: responseBody, result: responseCode);
      }
    } catch (e) {
      Logger().e(e);
      return ApiResponse.failure(
        error: e.toString(),
        result: HttpResult.unknown,
      );
    }
  }

  /// [postModel] method is a generic method that is used to send data to the API.
  /// [ApiResponse] is returned based on the response.
  Future<ApiResponse<dynamic>> postModel<T extends BaseModel<T>>({
    required String domain,
    required T model,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        '$_baseUrl$domain',
        data: model.toJson(),
      );
      final responseCode = HttpResult.fromStatusCode(response.statusCode!);
      final responseBody = response.data;
      log('response: $responseBody');

      switch (responseCode) {
        case HttpResult.success:
          if (responseBody is Map) {
            //TODO: data will be get dynamic response
            final data = model.fromJson(responseBody.cast<String, dynamic>());
            return ApiResponse<dynamic>.success(data: data);
          } else if (responseBody is List) {
            final data = responseBody
                .map((e) => model.fromJson(e as Map<String, dynamic>))
                .toList();
            return ApiResponse<dynamic>.success(data: data);
          }
          return ApiResponse.failure(
            data: responseBody,
            result: HttpResult.unknown,
            error: LocaleKeys.errors_unknown_response_type.tr(),
          );

        default:
          return ApiResponse.failure(
            data: responseBody,
            result: responseCode,
            error: LocaleKeys.errors_unknown_response_type.tr(),
          );
      }
    } catch (e) {
      Logger().e(e);
      return ApiResponse.failure(
        error: e.toString(),
        result: HttpResult.unknown,
      );
    }
  }

  /// [postWithoutModel] method is a generic method that is used to send data to the API.
  Future<ApiResponse<dynamic>> postWithoutModel({
    required String domain,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        '$_baseUrl$domain',
      );
      final responseCode = HttpResult.fromStatusCode(response.statusCode!);
      final responseBody = response.data;

      switch (responseCode) {
        case HttpResult.success:
          return ApiResponse<dynamic>.success(data: responseBody);

        default:
          return ApiResponse.failure(
            data: responseBody,
            result: responseCode,
            error: LocaleKeys.errors_unknown_response_type.tr(),
          );
      }
    } catch (e) {
      Logger().e(e);
      return ApiResponse.failure(
        error: e.toString(),
        result: HttpResult.unknown,
      );
    }
  }
}
