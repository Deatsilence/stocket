import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/init/language/locale_keys.g.dart';
import 'package:stocket/product/service/mixin/common_service_mixin.dart';
import 'package:stocket/product/utility/constants/enums/status_code.dart';
import 'package:stocket/product/utility/extension/has_value_extension.dart';
import 'package:stocket/product/utility/response/api_response.dart';

/// [CommonService] is a common service class that contains common methods
/// that can be used in multiple places.
/// Like `CRUD` processes, `API` calls, etc.
final class CommonService with CommonServiceMixin {
  CommonService._() {
    _baseUrl = DevEnv().baseUrl;

    final baseOptions = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 30),
      validateStatus: (status) =>
          status.hasValue &&
          ((status! >= 200 && status <= 399) ||
              status == 401 ||
              status == 404 ||
              status == 409),
    );

    _dio = Dio(baseOptions);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_token.hasValue) {
            options.headers['token'] = _token;
          }
          return handler.next(options);
        },
      ),
    );
  }

  static CommonService instance = CommonService._();

  String? _token;
  late String _baseUrl;
  late Dio _dio;

  /// [set] method is used to set the token.
  set token(String token) => _token = token;

  /// [getModel] method is generic method that is used to get data from the API.
  /// [ApiResponse] is returned based on the response.
  Future<ApiResponse<dynamic>> getModel<T extends BaseModel<T>>({
    required String domain,
    required T model,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        '$_baseUrl$domain',
        queryParameters: queryParameters,
      );
      final responseCode = HttpResult.fromStatusCode(response.statusCode ?? -1);
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
      final responseCode = HttpResult.fromStatusCode(response.statusCode ?? -1);
      final responseBody = response.data;

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

        case HttpResult.conflict:
          return ApiResponse.failure(
            data: responseBody,
            result: responseCode,
            error: LocaleKeys.errors_product_already_exists.tr(),
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
      final responseCode = HttpResult.fromStatusCode(response.statusCode ?? -1);
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

  /// [delete] method is a generic method that is used to delete data from the API.
  Future<ApiResponse<dynamic>> delete({
    required String domain,
    required String id,
  }) async {
    try {
      final response = await _dio.delete<dynamic>(
        '$_baseUrl$domain/$id',
      );
      final responseCode = HttpResult.fromStatusCode(response.statusCode ?? -1);
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

  /// [putModel] method is a generic method that is used to update data to the API.
  Future<ApiResponse<dynamic>> putModel<T extends BaseModel<T>>({
    required String domain,
    required T model,
    required String id,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        '$_baseUrl$domain/$id',
        data: model.toJson(),
      );
      final responseCode = HttpResult.fromStatusCode(response.statusCode ?? -1);
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
