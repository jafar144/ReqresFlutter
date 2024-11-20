import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:prj_reqres/data/api/logging_interceptor.dart';

enum DioMethod { post, get }

class DioConfig {
  static DioConfig? _instance;

  DioConfig._();

  factory DioConfig() => _instance ??= DioConfig._();

  // Mencoba membedakan url dev sama production
  String get baseUrl {
    if (kDebugMode) {
      return 'https://reqres.in/api/';
    }
    return 'https://reqres.in/api/';
  }

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    Map<String, dynamic>? param,
    String? contentType,
    String? authToken,
    formData,
  }) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      );
      dio.interceptors.add(LoggingInterceptor());
      switch (method) {
        case DioMethod.post:
          if (authToken == null) {
            return dio.post(
              endpoint,
              data: param ?? formData,
            );
          } else {
            return dio.post(
              endpoint,
              data: param ?? formData,
              options: Options(headers: {'Authorization': 'Bearer $authToken'}),
            );
          }
        case DioMethod.get:
          if (authToken == null) {
            return dio.get(
              endpoint,
              queryParameters: param,
            );
          } else {
            return dio.get(
              endpoint,
              queryParameters: param,
              options: Options(headers: {'Authorization': 'Bearer $authToken'}),
            );
          }
      }
    } catch (e) {
      throw Exception('Network Error');
    }
  }
}
