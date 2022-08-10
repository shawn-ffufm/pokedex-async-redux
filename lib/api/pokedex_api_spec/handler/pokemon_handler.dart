import 'package:pokedex/api/api_client.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon_details.dart';
import 'package:pokedex/utils/strings.dart' as str;

typedef Json = Map<String, dynamic>;

class PokemonApi {
  final ApiClient apiClient;

  PokemonApi(this.apiClient);

  Future<List<Pokemon>> getPokemonList(String? offset, String? limit) async {
    final queryParams = <String, dynamic>{};

    if (limit != null) queryParams['limit'] = limit;

    if (offset != null) queryParams['offset'] = offset;

    final baseUri = Uri.parse(apiClient.dio.options.baseUrl);
    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}/pokemon');
    return await apiClient.dio.getUri(uri).then((response) {
      return response.data[str.results].map<Pokemon>((dynamic data) => Pokemon.fromJson(data as Json)).toList();
    });
  }

  Future<PokemonDetails> getPokemon(String? id) async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.dio.options.baseUrl);
    final uri = baseUri.replace(queryParameters: queryParams, path: '${baseUri.path}/pokemon/$id');
    return await apiClient.dio.getUri(uri).then((response) {
      return PokemonDetails.fromJson(response.data);
    });
  }
}
