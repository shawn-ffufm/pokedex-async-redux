import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/abilities.dart';
import 'package:pokedex/api/pokedex_api_spec/model/moves.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon.dart';
import 'package:pokedex/api/pokedex_api_spec/model/stats.dart';

part 'pokemon_dto.freezed.dart';

part 'pokemon_dto.g.dart';

@freezed
class PokemonDto with _$PokemonDto {
  factory PokemonDto({
    /// TODO: add variables for other properties of pokemons in the about, stats, and moves tab
    required Pokemon pokemon,
    required int id,
    @Default(0) int height,
    @Default(0) int weight,
    @Default(0) int baseExperience,
    @Default(<Abilities>[]) List<Abilities> abilities,
    @Default(<Moves>[]) List<Moves> moves,
    @Default(<Stats>[]) List<Stats> stats,
  }) = _PokemonDto;

  factory PokemonDto.fromJson(Map<String, dynamic> json) => _$PokemonDtoFromJson(json);
}
