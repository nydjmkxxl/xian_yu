import 'package:dio/dio.dart';

import '../config.dart';

class DioHttp {
  final Dio _client = Dio();
  Dio get client => _client;

  static final DioHttp _instance = DioHttp._internal();

  factory DioHttp() => _instance;

  DioHttp._internal() {
    _client.options = _client.options.copyWith(
        baseUrl: Config.baseUrl,
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        headers: {
          "accessToken":
              "eyJhbGciOiJIUzI1NiIsIlR5cGUiOiJKd3QiLCJ0eXAiOiJKV1QifQ.eyJ1c2VyaWQiOiI0MjUifQ.pZoQbDdhFy7_Po2FxeHKQDJ_STBVeElnkukpjNQzxL4"
        });

    _client.interceptors.addAll([]);
  }
}
