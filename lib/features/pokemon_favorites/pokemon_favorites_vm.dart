import 'package:async_redux/async_redux.dart';
import 'package:pokedex/features/pokemon_favorites/pokemon_favorites_connector.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/state/action/pokemon_actions.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utils/typedefs.dart';

class PokemonFavoritesVmFactory extends VmFactory<AppState, PokemonFavoritesConnector> {
  @override
  Vm fromStore() => PokemonFavoritesVm(
        favoritePokemons: state.favoritePokemons,
        onSaveSelectedPokemon: _onSaveSelectedPokemon,
      );

  void _onSaveSelectedPokemon(PokemonDto selectedPokemon) =>
      dispatch(AssignSelectedPokemonAction(pokemon: selectedPokemon));
}

class PokemonFavoritesVm extends Vm {
  PokemonFavoritesVm({
    required this.favoritePokemons,
    required this.onSaveSelectedPokemon,
  }) : super(equals: [favoritePokemons]);

  final PokemonList favoritePokemons;
  final OnSelectPokemon onSaveSelectedPokemon;
}
