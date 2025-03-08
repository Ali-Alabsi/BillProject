import 'package:dio/dio.dart';

import '../../main.dart';
import 'end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    options.headers[ApiKey.authorization] =
    // 'Bearer 36|OgXx7JYJxT7cNCSLaAahhSIhsLJgSoN25a59yFOvd6beb227';
         sharedPreferences!.getString(ApiKey.token) != null
            ? 'Bearer ${sharedPreferences!.getString(ApiKey.token)}'
            : null;
    super.onRequest(options, handler);
  }
}
