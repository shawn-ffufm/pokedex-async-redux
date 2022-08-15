import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/ability_list.dart';
import 'package:pokedex/api/pokedex_api_spec/model/moves_list.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon.dart';
import 'package:pokedex/api/pokedex_api_spec/model/stats_list.dart';

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
    @Default(<AbilityList>[]) List<AbilityList> abilities,
    @Default(<MovesList>[]) List<MovesList> moves,
    @Default(<StatsList>[]) List<StatsList> stats,
  }) = _PokemonDto;

  factory PokemonDto.fromJson(Map<String, dynamic> json) => _$PokemonDtoFromJson(json);
}
