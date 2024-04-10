import 'package:stocket/product/utility/constants/enums/status_code.dart';

/// [ApiResponse] is a generic class that is used to handle the response of the API.
final class ApiResponse<T> {
  final T? _data;
  final String? _error;
  final HttpResult? _result;

  ApiResponse.success({
    T? data,
    String? error,
  })  : _data = data,
        _error = error,
        _result = HttpResult.success;

  ApiResponse.failure({
    required HttpResult result,
    T? data,
    String? error,
  })  : _data = data,
        _error = error,
        _result = result;

  bool get isSuccess => _result == HttpResult.success;

  @override
  String toString() {
    if (isSuccess) {
      return 'Success: $_data';
    } else {
      return 'Error: $_error (Status Code: $_result)';
    }
  }
}
