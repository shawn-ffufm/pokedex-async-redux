import 'package:pokedex/api/api_client.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon_model.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonApi {
  final ApiClient apiClient;

  PokemonApi(this.apiClient);

  Future<List<Pokemon>> getPokemonList() async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.dio.options.baseUrl);
    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}/${str.pokemonRoute}/');
    return await apiClient.dio
        .getUri(uri)
        .then((response) => response.data[str.results].map<Pokemon>((pokemon) => Pokemon.fromJson(pokemon)).toList());
  }
}
