import 'package:async_redux/async_redux.dart';
import 'package:pokedex/state/app_state.dart';

/// This action will be used to generate 20 Pokemon at a time.
class GetPokemonAction extends ReduxAction<AppState> {
  /// TODO: Make a reduce function that will return 20 pokemons to the state
  @override
  AppState? reduce() {
    return state.copyWith(name: "lorem ipsum");
  }
}
