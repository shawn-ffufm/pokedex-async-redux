import 'package:pokedex/api/pokedex_api_spec/model/pokemon_model.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/utils/constant.dart' as k;

class PokemonHandler {
  static Future<List<PokemonModel>?> getPokemonList() async {
    var uri = k.baseApi;
    Response response;
    BaseOptions opts = BaseOptions(
      baseUrl: uri,
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    Dio dio = Dio(opts);
    try {
      response = await dio.get(opts.baseUrl, queryParameters: {'limit': 20});
    } on DioError catch (e) {
      throw (e.message);
    }
    if (response.statusCode == 200) {
      List pokemonResponse = response.data['results'];
      return pokemonResponse.map((e) => PokemonModel(name: e['name'])).toList();
    } else {
      return null;
    }
  }
}
