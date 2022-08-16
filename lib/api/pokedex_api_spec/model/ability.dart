import 'package:freezed_annotation/freezed_annotation.dart';

part 'ability.freezed.dart';

part 'ability.g.dart';

@freezed
class Ability with _$Ability {
  factory Ability({
    @Default('') @JsonKey(name: 'name') String name,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}
