import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/ability.dart';

part 'ability_list.freezed.dart';

part 'ability_list.g.dart';

@freezed
class AbilityList with _$AbilityList {
  factory AbilityList({
    @JsonKey(name: 'ability') Ability? ability,
  }) = _AbilityList;

  factory AbilityList.fromJson(Map<String, dynamic> json) => _$AbilityListFromJson(json);
}
