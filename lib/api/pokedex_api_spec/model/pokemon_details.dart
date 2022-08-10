import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details.freezed.dart';

part 'pokemon_details.g.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  factory PokemonDetails({
    @Default('') @JsonKey(name: 'name') String name,
    @Default(1) @JsonKey(name: 'id') int id,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => _$PokemonDetailsFromJson(json);
}
