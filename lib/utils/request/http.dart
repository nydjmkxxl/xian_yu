import 'dart:io';

import 'package:dio/dio.dart';
import 'package:xianyu/config.dart';
import 'package:xianyu/utils/request/error_interceptor.dart';

class DioFile {
  final String path;
  final String filename;

  DioFile({required this.path, required this.filename});
}

class DioHttp {
  final Dio _client = Dio();
  Dio get client => _client;

  static final DioHttp _instance = DioHttp._internal();

  factory DioHttp() => _instance;

  DioHttp._internal() {
    _client.options = _client.options.copyWith(
        baseUrl: Config.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        // headers: {"accessToken": Config.accessToken}
        );
    _client.interceptors.addAll([
      ErrorInterceptor()
    ]);
  }

  void init(
      {String? baseUrl,
      Duration? connectTimeout,
      Duration? receiveTimeout,
      List<Interceptor>? interceptors,
      bool? auth = false}) {
    _client.options = _client.options.copyWith(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        extra: {"auth": auth});
    _client.interceptors.addAll(interceptors!);
  }

  /// GET
  ///
  Future<Response<dynamic>> get(String path,
      [Map<String, dynamic>? params, Options? options]) async {
    return await _client.get(path, queryParameters: params, options: options);
  }

  /// POST
  Future<Response<dynamic>> post(String path,
      [Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Options? options]) async {
    return await _client.post(path,
        data: data, queryParameters: params, options: options);
  }

  /// DELETE
  Future<Response<dynamic>> delete(String path,
      [Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Options? options]) async {
    return await _client.post(path,
        data: data, queryParameters: params, options: options);
  }

  /// PUT
  Future<Response<dynamic>> put(String path,
      [Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Options? options]) async {
    return await _client.put(path,
        data: data, queryParameters: params, options: options);
  }

  /// PATCH
  Future<Response<dynamic>> patch(String path,
      [Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      Options? options]) async {
    return await _client.patch(path,
        data: data, queryParameters: params, options: options);
  }

  /// FormData 数据
  Future<FormData> prepareFormData(String path, String fileName) async {
    return FormData.fromMap(
        {'file': await MultipartFile.fromFile(path, filename: fileName)});
  }

  void showProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + '%');
    }
  }

  /// 上传 FormData
  Future<Response<dynamic>> postFormData(String path,
      DioFile dioFile, void Function(int, int) onSendProgress) async {
    return await _client.post(path,
        data: await prepareFormData(dioFile.path, dioFile.filename),
        onSendProgress: onSendProgress ?? showProgress);
  }

  /// e.g. 示例
  // await downloadWithChunks(
  //   url,
  //   savePath,
  //   onReceiveProgress: (received, total) {
  //   if (total != -1) {
  //   print('${(received / total * 100).floor()}%');
  //   }
  //   },
  // );

  /// 大下载文件
  Future downloadWithChunks(
    url,
    savePath, {
    ProgressCallback? onReceiveProgress,
  }) async {
    const firstChunkSize = 102;
    const maxChunk = 3;

    int total = 0;
    final dio = Dio();
    final progress = <int>[];

    void Function(int, int) createCallback(no) {
      return (int received, int _) {
        progress[no] = received;
        if (onReceiveProgress != null && total != 0) {
          onReceiveProgress(progress.reduce((a, b) => a + b), total);
        }
      };
    }

    Future<Response> downloadChunk(url, start, end, no) async {
      progress.add(0);
      --end;
      return dio.download(
        url,
        savePath + 'temp$no',
        onReceiveProgress: createCallback(no),
        options: Options(
          headers: {'range': 'bytes=$start-$end'},
        ),
      );
    }

    Future mergeTempFiles(chunk) async {
      final f = File(savePath + 'temp0');
      final ioSink = f.openWrite(mode: FileMode.writeOnlyAppend);
      for (int i = 1; i < chunk; ++i) {
        final file = File(savePath + 'temp$i');
        await ioSink.addStream(file.openRead());
        await file.delete();
      }
      await ioSink.close();
      await f.rename(savePath);
    }

    final response = await downloadChunk(url, 0, firstChunkSize, 0);
    if (response.statusCode == 206) {
      total = int.parse(
        response.headers.value(HttpHeaders.contentRangeHeader)!.split('/').last,
      );
      final reserved = total -
          int.parse(response.headers.value(Headers.contentLengthHeader)!);
      int chunk = (reserved / firstChunkSize).ceil() + 1;
      if (chunk > 1) {
        int chunkSize = firstChunkSize;
        if (chunk > maxChunk + 1) {
          chunk = maxChunk + 1;
          chunkSize = (reserved / maxChunk).ceil();
        }
        final futures = <Future>[];
        for (int i = 0; i < maxChunk; ++i) {
          final start = firstChunkSize + i * chunkSize;
          futures.add(downloadChunk(url, start, start + chunkSize, i + 1));
        }
        await Future.wait(futures);
      }
      await mergeTempFiles(chunk);
    }
  }
}
