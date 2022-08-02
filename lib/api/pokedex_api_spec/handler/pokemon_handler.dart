import 'package:pokedex/api/pokedex_api_spec/handler/api_client.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon_model.dart';

class PokemonApi {
  final ApiClient apiClient;

  PokemonApi(this.apiClient);

  Future<PokemonModel> getPokemonList() async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}/?limit=20');

    return apiClient.dio.getUri(uri).then((response) {
      return response.data.map((dynamic e) => PokemonModel(name: e['name']));
    });
  }
}
