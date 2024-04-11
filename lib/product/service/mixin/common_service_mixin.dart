import 'package:dio/dio.dart';

mixin CommonServiceMixin {
  bool shouldAddToken({
    required RequestOptions options,
  }) =>
      options.path.contains('spesificDomain');
}
