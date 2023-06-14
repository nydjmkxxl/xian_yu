import 'package:json_annotation/json_annotation.dart';

part 'http.response.g.dart';

@JsonSerializable()
class HttpResponse extends Object {
  @JsonKey(name: 'msg')
  final String? msg;

  @JsonKey(name: 'code')
  final int code;

  @JsonKey(name: 'data')
  dynamic data;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'token')
  final String? token;

  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  HttpResponse(
    this.msg,
    this.code,
    this.data,
    this.message,
    this.token,
    this.refreshToken,
  );

  factory HttpResponse.fromJson(Map<String, dynamic> json) =>
      _$HttpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HttpResponseToJson(this);
}
