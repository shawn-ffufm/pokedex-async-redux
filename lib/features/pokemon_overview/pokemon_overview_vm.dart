import 'package:async_redux/async_redux.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utils/typedefs.dart';

class PokemonOverviewVmFactory extends VmFactory<AppState, PokemonOverviewConnector> {
  @override
  Vm fromStore() => PokemonOverviewVm(pokemons: state.pokemons);

  /// TODO: add dispatch statement here to call getpokemons

}

class PokemonOverviewVm extends Vm {
  /// TODO: add other additional fields here
  PokemonOverviewVm({required this.pokemons}) : super(equals: [pokemons]);
  final PokemonList pokemons;
}
