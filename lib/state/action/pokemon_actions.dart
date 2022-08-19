import 'package:async_redux/async_redux.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/api/api_service.dart';
import 'package:pokedex/utils/constant.dart' as k;
import 'package:pokedex/utils/extensions.dart';

/// This action gets the list of pokemons and transform it into a list of PokemonDto
class GetPokemonsAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    if (state.pokemons.isEmpty) {
      final pokemonResponse = await ApiService().pokemonApi.getPokemonList(k.pokemonOffset, k.pokemonLimit);
      final mappedPokemons =
          pokemonResponse.map((pokemon) => PokemonDto(pokemon: pokemon, id: pokemon.url.getPokemonId)).toList();

      return state.copyWith(pokemons: mappedPokemons);
    } else {
      return state;
    }
  }
}

/// This action gets a specific pokemon and its details
class GetPokemonDetailsAction extends ReduxAction<AppState> {
  GetPokemonDetailsAction({required this.id});

  final int id;
  late PokemonDto _selectedPokemon;

  @override
  Future<AppState> reduce() async {
    final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(id.toString());
    final selectedPokemon = _getPokemon();

    _selectedPokemon = selectedPokemon.copyWith(
      height: pokemonDetails.height,
      weight: pokemonDetails.weight,
      baseExperience: pokemonDetails.baseExperience,
      abilities: pokemonDetails.abilities,
      stats: pokemonDetails.stats,
      moves: pokemonDetails.moves,
    );

    return state.copyWith(selectedPokemon: _selectedPokemon);
  }

  PokemonDto _getPokemon() => state.pokemons.firstWhere((pokemon) => pokemon.id == id);

  @override
  void after() => dispatch(UpdatePokemonsAction(pokemon: _selectedPokemon));
}

/// This action assigns the selected pokemon to the state
class AssignSelectedPokemonAction extends ReduxAction<AppState> {
  AssignSelectedPokemonAction({required this.pokemon});

  final PokemonDto pokemon;

  @override
  AppState reduce() => state.copyWith(selectedPokemon: pokemon);
}

/// Action that clear the state of selectedPokemon
class ClearSelectedPokemonAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(selectedPokemon: null);
}

/// Action for updating the information of a pokemon in the list of pokemons
class UpdatePokemonsAction extends ReduxAction<AppState> {
  UpdatePokemonsAction({required this.pokemon});

  final PokemonDto pokemon;

  @override
  AppState reduce() {
    final currentPokemons = state.pokemons.toList();
    currentPokemons[pokemon.id - 1] = pokemon;
    final updatedPokemons = currentPokemons;
    return state.copyWith(pokemons: updatedPokemons);
  }
}

/// Action that Updates the status of isFavorite Pokemon
class UpdatePokemonFavoriteAction extends ReduxAction<AppState> {
  UpdatePokemonFavoriteAction({required this.pokemon});

  final PokemonDto pokemon;

  @override
  AppState reduce() {
    final PokemonDto updatedPokemon;
    if (!pokemon.isFavorite) {
      updatedPokemon = pokemon.copyWith(isFavorite: true);
      dispatch(AddFavoritePokemonAction(pokemon: updatedPokemon));
    } else {
      updatedPokemon = pokemon.copyWith(isFavorite: false);
      dispatch(DeleteFavoritePokemonAction(pokemon: pokemon));
    }

    return state.copyWith(selectedPokemon: updatedPokemon);
  }

  @override
  void after() => dispatch(UpdatePokemonsAction(pokemon: state.selectedPokemon!));
}

/// Add Favorite Pokemon to list of Favorite Pokemon Action
class AddFavoritePokemonAction extends ReduxAction<AppState> {
  AddFavoritePokemonAction({required this.pokemon});

  final PokemonDto pokemon;

  @override
  AppState reduce() {
    final updatedFavoriteList = state.favoritePokemons.toList();
    updatedFavoriteList.add(pokemon);

    return state.copyWith(favoritePokemons: updatedFavoriteList);
  }
}

/// Delete Favorite Pokemon to list of Favorite Pokemon Action
class DeleteFavoritePokemonAction extends ReduxAction<AppState> {
  DeleteFavoritePokemonAction({required this.pokemon});

  final PokemonDto pokemon;

  @override
  AppState reduce() {
    final updatedFavoriteList = state.favoritePokemons.toList();
    updatedFavoriteList.remove(pokemon);

    return state.copyWith(favoritePokemons: updatedFavoriteList);
  }
}
