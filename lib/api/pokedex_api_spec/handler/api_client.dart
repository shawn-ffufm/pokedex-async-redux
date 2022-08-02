import 'package:dio/dio.dart';

class ApiClient {
  final String baseUrl;
  late Dio dio;

  ApiClient(
    this.baseUrl,
  ) {
    dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(QueuedInterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onError: (err, handler) => handler.reject(err),
      ));
  }
}
