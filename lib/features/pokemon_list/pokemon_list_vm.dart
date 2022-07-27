import 'package:async_redux/async_redux.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_connector.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonListVmFactory extends VmFactory<AppState, PokemonListConnector> {
  @override
  Vm fromStore() {
    return PokemonListVm(name: state.name);
  }

  /// TODO: add dispatch statement here to call getpokemons

}

class PokemonListVm extends Vm {
  /// TODO: add other additional fields here
  PokemonListVm({required this.name}) : super(equals: [name]);

  final String name;
}
