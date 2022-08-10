import 'package:async_redux/async_redux.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/api/api_service.dart';
import 'package:pokedex/utils/constant.dart' as k;
import 'package:pokedex/utils/extensions.dart';

class GetPokemonListAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final pokemonResponse = await ApiService().pokemonApi.getPokemonList(k.pokemonOffset, k.pokemonLimit);
    final pokemons =
        pokemonResponse.map((pokemon) => PokemonDto(pokemon: pokemon, id: pokemon.url.getPokemonId)).toList();
    return state.copyWith(pokemons: pokemons);
  }
}

class GetDetailsAction extends ReduxAction<AppState> {
  GetDetailsAction({required this.id});

  final int id;

  @override
  Future<AppState> reduce() async {
    final detailsResponse = await ApiService().pokemonApi.getPokemonDetails(id.toString());
    return state.copyWith(selectedPokemon: detailsResponse);
  }
}
class DisposeSelectedPokemon extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    return state.copyWith(selectedPokemon: null);
  }
}
