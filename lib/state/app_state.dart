import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/utils/typedefs.dart';
import '../api/pokedex_api_spec/model/pokemon.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(<Pokemon>[]) PokemonList pokemons,
    @Default(null) PokemonDto? selectedPokemon,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
