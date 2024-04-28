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
      _domainsToAddToken.any((domain) => options.path == '${DevEnv().baseUrl}$domain');
}
