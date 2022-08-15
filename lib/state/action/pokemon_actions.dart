import 'package:async_redux/async_redux.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/api/api_service.dart';
import 'package:pokedex/utils/constant.dart' as k;
import 'package:pokedex/utils/extensions.dart';

/// This function gets the list of pokemons and transform it into a list of PokemonDto
class GetPokemonsAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final pokemonResponse = await ApiService().pokemonApi.getPokemonList(k.pokemonOffset, k.pokemonLimit);
    final pokemonDto =
        pokemonResponse.map((pokemon) => PokemonDto(pokemon: pokemon, id: pokemon.url.getPokemonId)).toList();
    return state.copyWith(pokemons: pokemonDto);
  }
}

/// This function gets a specific pokemon and its details
class GetPokemonAction extends ReduxAction<AppState> {
  GetPokemonAction({required this.id});

  final int id;

  @override
  Future<AppState> reduce() async {
    final PokemonDto selectedPokemon;
    final PokemonDto updatedPokemon;
    final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(id.toString());
    selectedPokemon = _getPokemon();
    updatedPokemon = PokemonDto(
        pokemon: selectedPokemon.pokemon,
        id: id,
        height: pokemonDetails.height,
        weight: pokemonDetails.weight,
        baseExp: pokemonDetails.baseExp);
    return state.copyWith(selectedPokemon: updatedPokemon);
  }

  PokemonDto _getPokemon() => state.pokemons.firstWhere((pokemon) => pokemon.id == id);

  @override
  void after() {
    AssignSelectedPokemonAction(pokemon: state.selectedPokemon!);
  }
}

/// This function assigns the selected pokemon to the state
class AssignSelectedPokemonAction extends ReduxAction<AppState> {
  AssignSelectedPokemonAction({required this.pokemon});

  final PokemonDto pokemon;

  @override
  AppState reduce() => state.copyWith(selectedPokemon: pokemon);
}

/// Clearing the state on selectedPokemon
class ClearSelectedPokemonAction extends ReduxAction<AppState> {
  @override
  void before() {
    UpdatePokemonList(pokemon: state.selectedPokemon!);
  }

  @override
  AppState reduce() => state.copyWith(selectedPokemon: null);
}

/// Updating the information of a pokemon in the list of pokemons
class UpdatePokemonList extends ReduxAction<AppState> {
  UpdatePokemonList({required this.pokemon});

  final PokemonDto pokemon;

  @override
  AppState reduce() {
    state.pokemons[pokemon.id] = pokemon;
    return state.copyWith(pokemons: state.pokemons);
  }
}
