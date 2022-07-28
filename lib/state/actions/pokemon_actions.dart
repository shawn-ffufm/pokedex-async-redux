import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/pokedex_api_spec/handler/pokemon_handler.dart';
import 'package:pokedex/state/app_state.dart';

/// TODO: documentation will be changed later -> Get paginated pokemons per 20 items
/// This action will be used to generate 20 Pokemon at a time.
class GetPokemonAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final pokemons = await PokemonHandler.getPokemonList();
    return state.copyWith(pokemons: pokemons);
  }
}
