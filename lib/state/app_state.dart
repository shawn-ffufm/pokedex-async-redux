import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/utils/typedefs.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(<PokemonDto>[]) PokemonList pokemons,
    @Default(<PokemonDto>[]) PokemonList favoritePokemons,
    @Default(null) PokemonDto? selectedPokemon,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
