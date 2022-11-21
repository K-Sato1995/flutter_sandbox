import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<Response<dynamic>> get(String url,
      {Map<String, dynamic>? queryParameters});
  // Future<Response> post(String url, {Map<String, dynamic>? queryParameters});
  // Future<Response> put(String url, {Map<String, dynamic>? queryParameters});
  // Future<Response> delete(String url, {Map<String, dynamic>? queryParameters});
}

class HttpClientImpl implements HttpClient {
  HttpClientImpl(this._dio);
  final Dio _dio;

  @override
  Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _dio.get(path, queryParameters: queryParameters);
  }
}

const endpoint = 'https://jsonplaceholder.typicode.com';

final options = BaseOptions(
  baseUrl: endpoint,
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Dio _dio = Dio(options);

HttpClient httpClient = HttpClientImpl(_dio);
