import 'package:dio/dio.dart';
import 'package:pokedex/utils/constant.dart' as k;

class ApiClient {
  late Dio dio;
  static const String baseUrl = k.pokemonUrl;

  ApiClient() {
    dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(QueuedInterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onError: (error, handler) => handler.reject(error),
      ));
  }
}
