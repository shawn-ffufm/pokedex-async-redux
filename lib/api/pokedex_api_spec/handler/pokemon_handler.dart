import 'package:pokedex/api/api_client.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon_model.dart';
import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;

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
    return await apiClient.dio.getUri(uri).then((response) => response.data[str.results]
        .map<Pokemon>((dynamic pokemon) => Pokemon(
            name: pokemon['name'],
            url: pokemon['url'],
            img: k.imageURL.replaceAll(str.indexReplace, pokemon['url'].toString().split('/')[6])))
        .toList());
  }
}
