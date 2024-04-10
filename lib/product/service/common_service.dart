import 'package:dio/dio.dart';
import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:stocket/product/utility/constants/enums/status_code.dart';
import 'package:stocket/product/utility/response/api_response.dart';

/// [CommonService] is a common service class that contains common methods
/// that can be used in multiple places.
/// Like `CRUD` processes, `API` calls, etc.
final class CommonService {
  CommonService._() {
    _baseUrl = DevEnv().baseUrl;

    final baseOptions = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    );
    _dio = Dio(baseOptions);
  }

  static CommonService? _instance;

  static CommonService get instance {
    _instance ??= CommonService._();
    return _instance!;
  }

  late String _baseUrl;
  late Dio _dio;

  /// [get] method is generic method that is used to get data from the API.
  /// [ApiResponse] is returned based on the response.
  Future<ApiResponse<dynamic>> get<T extends BaseModel<T>>({
    required String domain,
    required T model,
  }) async {
    try {
      final response = await _dio.get<dynamic>('/$domain');
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
            result: HttpResult.unknown,
            error: 'Unknown response type',
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
}
