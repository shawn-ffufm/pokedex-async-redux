import 'package:async_redux/async_redux.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_list_connector.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonListVmFactory extends VmFactory<AppState, PokemonListConnector> {
  @override
  Vm fromStore() => PokemonListVm(pokemons: state.pokemons);

  /// TODO: add dispatch statement here to call getpokemons

}

class PokemonListVm extends Vm {
  /// TODO: add other additional fields here
  PokemonListVm({required this.pokemons}) : super(equals: [pokemons]);

  final String? pokemons;
}
