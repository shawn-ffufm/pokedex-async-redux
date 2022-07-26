import 'package:async_redux/async_redux.dart';
import 'package:pokedex/state/app_state.dart';

class GetPokemonList extends ReduxAction<AppState> {
  /// TODO: Make a reduce function that will return 20 pokemons to the state
  @override
  Future<AppState> reduce() async {
    return state.copyWith(name: "lorem ipsum");
  }
}
