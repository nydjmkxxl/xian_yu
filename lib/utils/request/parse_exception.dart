import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:xianyu/utils/request/http_exception.dart';

HttpException parseException(DioException err) {
  if (kDebugMode) {
    print('err,type');
  }
  if (kDebugMode) {
    print(err.type);
  }
  switch (err.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return NetWorkException(
          message: err.message, code: err.response?.statusCode);
    case DioExceptionType.cancel:
      return CancelRequestException(message: err.message);
    case DioExceptionType.badResponse:
      if (kDebugMode) {
        print('in');
      }
      try {
        int? errCode = err.response?.statusCode;
        switch (errCode) {
          case 400:
            return BadRequestException(
                message: '发出的请求有错误，服务器没有进行新建或修改数据操作。', code: errCode);
          case 401:
            return BadRequestException(
                message: '用户没有权限（令牌、用户名、密码）。', code: errCode);
          case 403:
            return BadRequestException(
                message: '用户得到授权，但是访问被禁止', code: errCode);
          case 404:
            return BadRequestException(
                message: '发出的请求针对的是不存在的记录，服务器没有进行操作。', code: errCode);
          case 405:
            return BadRequestException(message: '请求方法不存在，请检查路由', code: errCode);
          case 406:
            return BadRequestException(message: '请求的格式不可得', code: errCode);
          case 410:
            return BadRequestException(
                message: '请求的资源被永久删除，且不会再得到', code: errCode);
          case 422:
            return BadRequestException(
                message: '当创建一个对象时，发生一个验证错误', code: errCode);
          case 500:
            return BadServiceException(
                message: '服务器发生错误，请检查服务器', code: errCode);
          case 502:
            return BadServiceException(message: '网关错误', code: errCode);
          case 503:
            return BadServiceException(
              message: '服务不可用，服务器暂时过载或维护',
            );
          case 504:
            return BadServiceException(message: '网关超时', code: errCode);
          default:
            return UnknownException(message: '不支持 HTTP 协议');
        }
      } on DioException catch (_) {
        return UnknownException(message: err.message);
      }
    case DioExceptionType.unknown:
      if (err.error is SocketException) {
        return NetWorkException(message: err.message);
      } else {
        return UnknownException(message: err.message);
      }
    default:
      return UnknownException(message: err.message);
  }
}
