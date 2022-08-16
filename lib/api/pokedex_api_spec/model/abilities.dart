import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/ability.dart';

part 'abilities.freezed.dart';

part 'abilities.g.dart';

@freezed
class Abilities with _$Abilities {
  factory Abilities({
    @JsonKey(name: 'ability') Ability? ability,
  }) = _Abilities;

  factory Abilities.fromJson(Map<String, dynamic> json) => _$AbilitiesFromJson(json);
}
