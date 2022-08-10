import 'package:async_redux/async_redux.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/api/api_service.dart';
import 'package:pokedex/utils/constant.dart' as k;

class GetPokemonListAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final pokemonResponse = await ApiService().pokemonApi.getPokemonList(k.pokemonOffset, k.pokemonLimit);
    return state.copyWith(pokemons: pokemonResponse);
  }
}

class GetDetailsAction extends ReduxAction<AppState> {
  GetDetailsAction({required this.id});
  final int id;
  @override
  Future<AppState> reduce() async {
    final detailsResponse = await ApiService().pokemonApi.getPokemonDetails(id.toString());
    return state.copyWith(pokemonDetails: detailsResponse);
  }
}
