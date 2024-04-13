enum HttpResult {
  /// Success status code [200, 299]
  success,

  /// Redirection status code [300, 399]
  redirection,

  /// Client error status code [400, 499]
  clientError,

  /// Server error status code [500, 599]
  serverError,

  /// Unknown status code
  unknown;

  static HttpResult fromStatusCode(int statusCode) {
    switch (statusCode) {
      case >= 200 || <= 299:
        return HttpResult.success;

      case >= 300 || <= 399:
        return HttpResult.redirection;

      case >= 400 || <= 499:
        return HttpResult.clientError;

      case >= 500 || <= 599:
        return HttpResult.serverError;

      default:
        return HttpResult.unknown;
    }
  }
}
