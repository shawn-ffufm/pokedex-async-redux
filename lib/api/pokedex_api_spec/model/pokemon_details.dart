import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details.freezed.dart';

part 'pokemon_details.g.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  factory PokemonDetails({
    /// TODO: add variables for other properties of pokemons in the about, stats, and moves tab
    @Default(0) @JsonKey(name: 'height') int height,
    @Default(0) @JsonKey(name: 'weight') int weight,
    @Default(0) @JsonKey(name: 'base_experience') int baseExperience,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => _$PokemonDetailsFromJson(json);
}
