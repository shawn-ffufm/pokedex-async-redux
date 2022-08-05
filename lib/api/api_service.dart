import 'package:pokedex/api/api_client.dart';
import 'package:pokedex/api/pokedex_api_spec/handler/pokemon_handler.dart';

class ApiService {
  static final ApiService _apiService = ApiService._internal();

  factory ApiService() => _apiService;

  ApiService._internal();

  late final ApiClient _apiClient = ApiClient();

  late final PokemonApi _pokemonApi = PokemonApi(_apiClient);

  PokemonApi get pokemonApi => _pokemonApi;
}
