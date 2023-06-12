import 'package:dio/dio.dart';
import 'package:xianyu/utils/request/http_exception.dart';
import 'package:xianyu/utils/request/parse_exception.dart';

/// 异常类型：
/// 客户端异常
/// 服务端异常
/// 网络异常

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    HttpException httpException = parseException(err);
    print('***********************************************错误');
    handler.resolve(Response(
        requestOptions: err.requestOptions,
        statusCode: httpException.code,
        data: {'message': httpException.message, 'code': httpException.code}));
    // super.onError(err, handler);
  }
}
