import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';

part 'pokemon_model.g.dart';

@freezed
class Pokemon with _$Pokemon {
  factory Pokemon({
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'url') String url,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
}
