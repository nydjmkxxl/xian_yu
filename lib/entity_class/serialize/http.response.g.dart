// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpResponse _$HttpResponseFromJson(Map<String, dynamic> json) => HttpResponse(
      json['msg'] as String?,
      json['code'] as int,
      json['data'],
      json['message'] as String?,
      json['token'] as String?,
      json['refreshToken'] as String?,
    );

Map<String, dynamic> _$HttpResponseToJson(HttpResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };
