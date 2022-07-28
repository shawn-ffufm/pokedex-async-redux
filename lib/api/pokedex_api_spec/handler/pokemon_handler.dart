import 'package:pokedex/api/pokedex_api_spec/model/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokemonHandler {
  static Future<List<PokemonModel>?> getPokemonList() async {
    var dio = Dio();
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon/?limit=20');
    if (response.statusCode == 200) {
      List pokemonResponse = response.data['results'];
      return pokemonResponse.map((e) => PokemonModel(name: e['name'])).toList();
    } else {
      return null;
    }
  }
}
