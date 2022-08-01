import 'package:async_redux/async_redux.dart';
import 'package:pokedex/features/favorite_list/favorite_connector.dart';
import 'package:pokedex/state/app_state.dart';

class FavoriteVmFactory extends VmFactory<AppState, FavoriteConnector> {
  @override
  Vm fromStore() {
    return FavoriteVm(pokemons: state.pokemons);
  }

  /// TODO: add dispatch statement here to call getfavorites

}

class FavoriteVm extends Vm {
  /// TODO: add other additional fields here
  FavoriteVm({required this.pokemons}) : super(equals: [pokemons]);

  final String? pokemons;
}
