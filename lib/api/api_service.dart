import 'package:pokedex/api/api_client.dart';
import 'package:pokedex/api/pokedex_api_spec/handler/pokemon_handler.dart';

class ApiService {
  static final ApiService _apiService = ApiService._internal();

  factory ApiService() => _apiService;

  ApiService._internal();

  late final ApiClient _apiClient = ApiClient();

  PokemonApi? _pokemonApi;

  PokemonApi get pokemonApi => _pokemonApi ??= PokemonApi(_apiClient);
}
