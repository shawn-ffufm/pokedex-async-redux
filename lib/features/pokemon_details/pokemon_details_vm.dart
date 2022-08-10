import 'package:async_redux/async_redux.dart';
import 'package:pokedex/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonDetailsVmFactory extends VmFactory<AppState, PokemonDetailsConnector> {
  @override
  Vm fromStore() => PokemonDetailsVm(pokemon: state.selectedPokemon);
}

class PokemonDetailsVm extends Vm {
  PokemonDetailsVm({required this.pokemon}) : super(equals: [pokemon]);
  final PokemonDto? pokemon;
}
