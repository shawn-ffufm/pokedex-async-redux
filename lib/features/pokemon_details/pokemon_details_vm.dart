import 'package:async_redux/async_redux.dart';
import 'package:pokedex/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/state/action/pokemon_actions.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utils/typedefs.dart';

class PokemonDetailsVmFactory extends VmFactory<AppState, PokemonDetailsConnector> {
  @override
  Vm fromStore() => PokemonDetailsVm(
        pokemon: state.selectedPokemon!,
        onFavoritePokemon: _onFavoritePokemon,
      );

  void _onFavoritePokemon(PokemonDto selectedPokemon) =>
      dispatch(UpdatePokemonFavoriteAction(pokemon: selectedPokemon));
}

class PokemonDetailsVm extends Vm {
  PokemonDetailsVm({
    required this.pokemon,
    required this.onFavoritePokemon,
  }) : super(equals: [pokemon]);
  final PokemonDto pokemon;
  final OnSelectPokemon onFavoritePokemon;
}
