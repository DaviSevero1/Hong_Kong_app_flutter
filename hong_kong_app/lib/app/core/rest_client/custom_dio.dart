import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:hong_kong_app/app/core/rest_client/interceptors/auth_interceptors.dart';

import '../config/env/env.dart';

class CustomDio extends DioForNative {
  late AuthInterceptors _authInteceptor;

  CustomDio()
      : super(
          BaseOptions(
              baseUrl: Env.instance['backend_base_url'] ?? '',
              connectTimeout: 10000,
              receiveTimeout: 60000),
        ) {
    interceptors.add(LogInterceptor(
        requestBody: true, responseBody: true, requestHeader: true));
    _authInteceptor = AuthInterceptors();
  }

  CustomDio auth() {
    interceptors.add(_authInteceptor);
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInteceptor);
    return this;
  }
}
