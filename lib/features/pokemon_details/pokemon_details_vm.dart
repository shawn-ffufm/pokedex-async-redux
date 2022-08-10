import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon_details.dart';
import 'package:pokedex/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonDetailsVmFactory extends VmFactory<AppState, PokemonDetailsConnector> {
  @override
  Vm fromStore() => PokemonDetailsVm(pokemonDetails: state.pokemonDetails);
}

class PokemonDetailsVm extends Vm {
  PokemonDetailsVm({required this.pokemonDetails}) : super(equals: [pokemonDetails]);
  final PokemonDetails? pokemonDetails;
}
