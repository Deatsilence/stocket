import 'package:flutter/material.dart';
import 'package:stocket/product/utility/constants/enums/status_code.dart';

extension IntegerExtension on int {
  /// Returns a [HttpResult] based on the status code
  HttpResult get httpResult => HttpResult.fromStatusCode(this);

  /// Returns a [Color] based on the status code
  Color get httpStatusColor {
    switch (this.httpResult) {
      case HttpResult.success:
        return Colors.green;
      case HttpResult.redirection:
        return Colors.orange;
      case HttpResult.clientError:
        return Colors.red;
      case HttpResult.serverError:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
