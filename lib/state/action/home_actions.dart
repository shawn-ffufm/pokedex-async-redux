import 'package:async_redux/async_redux.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/api/api_service.dart';

class GetPokemonListAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final pokemonResponse = await ApiService().pokemonApi.getPokemonList();
    return state.copyWith(pokemons: pokemonResponse);
  }
}
