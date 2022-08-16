import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/abilities.dart';
import 'package:pokedex/api/pokedex_api_spec/model/moves.dart';
import 'package:pokedex/api/pokedex_api_spec/model/stats.dart';

part 'pokemon_details.freezed.dart';

part 'pokemon_details.g.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  factory PokemonDetails({
    /// TODO: add variables for other properties of pokemons in the about, stats, and moves tab
    @Default(0) @JsonKey(name: 'height') int height,
    @Default(0) @JsonKey(name: 'weight') int weight,
    @Default(0) @JsonKey(name: 'base_experience') int baseExperience,
    @Default(<Abilities>[]) @JsonKey(name: 'abilities') List<Abilities> abilities,
    @Default(<Moves>[]) @JsonKey(name: 'moves') List<Moves> moves,
    @Default(<Stats>[]) @JsonKey(name: 'stats') List<Stats> stats,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => _$PokemonDetailsFromJson(json);
}
