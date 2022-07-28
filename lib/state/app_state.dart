import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon_model.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @JsonKey(name: 'pokemons') List<PokemonModel>? pokemons,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
