import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_model.freezed.dart';

part 'pokemon_model.g.dart';

@freezed
class PokemonModel with _$PokemonModel {
  factory PokemonModel({
    @Default('') @JsonKey(name: 'name') String? name,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);
}
