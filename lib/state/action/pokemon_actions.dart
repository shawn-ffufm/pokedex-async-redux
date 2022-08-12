import 'package:async_redux/async_redux.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/api/api_service.dart';
import 'package:pokedex/utils/constant.dart' as k;
import 'package:pokedex/utils/extensions.dart';

class GetPokemonListAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final pokemonResponse = await ApiService().pokemonApi.getPokemonList(k.pokemonOffset, k.pokemonLimit);
    final pokemonDto = pokemonResponse.map((pokemon) => PokemonDto(pokemon: pokemon, id: pokemon.url.getPokemonId)).toList();
    return state.copyWith(pokemons: pokemonDto);
  }
}

class GetPokemonAction extends ReduxAction<AppState> {
  GetPokemonAction({required this.id});

  final int id;

  @override
  Future<AppState> reduce() async {
    final detailsResponse = await ApiService().pokemonApi.getPokemon(id.toString());
    return state.copyWith(selectedPokemon: detailsResponse);
  }
}

class DisposePokemon extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    return state.copyWith(selectedPokemon: null);
  }
}
