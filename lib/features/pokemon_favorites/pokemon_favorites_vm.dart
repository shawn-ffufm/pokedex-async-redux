import 'package:async_redux/async_redux.dart';
import 'package:pokedex/features/pokemon_favorites/pokemon_favorites_connector.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonFavoritesVmFactory extends VmFactory<AppState, PokemonFavoritesConnector> {
  @override
  Vm fromStore() => PokemonFavoritesVm();

  /// TODO: add dispatch statement here to call getfavorites

}

class PokemonFavoritesVm extends Vm {
  /// TODO: add other additional fields here
  PokemonFavoritesVm();
}
