import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon.dart';

part 'pokemon_dto.freezed.dart';

part 'pokemon_dto.g.dart';

@freezed
class PokemonDto with _$PokemonDto {
  factory PokemonDto({
    required Pokemon pokemon,
    @Default(0) int id,
  }) = _PokemonDto;

  factory PokemonDto.fromJson(Map<String, dynamic> json) => _$PokemonDtoFromJson(json);
}
