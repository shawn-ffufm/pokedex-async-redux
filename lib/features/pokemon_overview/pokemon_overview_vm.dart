import 'package:async_redux/async_redux.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonOverviewVmFactory extends VmFactory<AppState, PokemonOverviewConnector> {
  @override
  Vm fromStore() => PokemonOverviewVm();

  /// TODO: add dispatch statement here to call getpokemons

}

class PokemonOverviewVm extends Vm {
  /// TODO: add other additional fields here
  PokemonOverviewVm();
}
