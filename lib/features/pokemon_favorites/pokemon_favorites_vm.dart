import 'package:async_redux/async_redux.dart';
import 'package:dartx/dartx.dart';
import 'package:pokedex/features/pokemon_favorites/pokemon_favorites_connector.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/state/action/pokemon_actions.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utils/typedefs.dart';

class PokemonFavoritesVmFactory extends VmFactory<AppState, PokemonFavoritesConnector> {
  @override
  Vm fromStore() => PokemonFavoritesVm(
        pokemons: getFavoritePokemons(),
        onSaveSelectedPokemon: _onSaveSelectedPokemon,
      );

  void _onSaveSelectedPokemon(PokemonDto selectedPokemon) =>
      dispatch(AssignSelectedPokemonAction(pokemon: selectedPokemon));

  PokemonList getFavoritePokemons() => state.pokemons.filter((pokemon) => pokemon.isFavorite).toList();
}

class PokemonFavoritesVm extends Vm {
  PokemonFavoritesVm({
    required this.pokemons,
    required this.onSaveSelectedPokemon,
  }) : super(equals: [pokemons]);

  final PokemonList pokemons;
  final OnSelectPokemon onSaveSelectedPokemon;
}
