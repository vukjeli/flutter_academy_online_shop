import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'path.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    initialise();
  }

  static final instance = DioClient();

  void initialise() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          HttpHeaders.userAgentHeader: 'dio',
        },
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        validateStatus: (status) =>
            status == null ? false : status >= 200 && status < 400,
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(requestBody: true),
    );
  }

  Future<List<dynamic>> get(String path) async {
    try {
      final Response<dynamic> response = await _dio.get(path);

      if (response.data == null || response.data == 'null') {
        return [];
      }

      return response.data as List<dynamic>;
    } on DioException catch (ex) {
      rethrow;
    }
  }
}
