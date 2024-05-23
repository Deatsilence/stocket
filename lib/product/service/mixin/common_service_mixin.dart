import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gen/gen.dart';

mixin CommonServiceMixin {
  final _domainsToAddToken = [
    DevEnv().postLogoutDomain,
    DevEnv().postProductsAddDomain,
    DevEnv().getUsersDomain,
    DevEnv().getUsersByIdDomain,
    DevEnv().getProductsDomain,
    DevEnv().getProductsByIdDomain,
    DevEnv().deleteProductsByIdDomain,
    DevEnv().putProductsByIdDomain,
    DevEnv().patchProductsByIdDomain,
  ];

  bool shouldAddToken({
    required RequestOptions options,
  }) =>
      _domainsToAddToken.any(
        (domain) {
          var _requestUrl = '${DevEnv().baseUrl}$domain';
          log('request url: $_requestUrl');
          log('options path: ${options.path}');
          return _requestUrl.contains(options.path);
        },
      );
}
