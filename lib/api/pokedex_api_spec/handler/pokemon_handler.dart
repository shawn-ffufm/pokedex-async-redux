import 'package:pokedex/api/pokedex_api_spec/api_client.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon_model.dart';

class PokemonApi {
  final ApiClient apiClient;

  PokemonApi(this.apiClient);

  static const int _limitAmount = 20;

  Future<Pokemon> getPokemonList() async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.dio.options.baseUrl);
    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}/pokemon/?limit=$_limitAmount');

    return apiClient.dio.getUri(uri).then((response) {
      return response.data.map((dynamic json) => Pokemon(name: json['name']));
    });
  }
}
