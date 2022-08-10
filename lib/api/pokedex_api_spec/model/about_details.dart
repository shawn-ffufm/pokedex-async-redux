import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/ability_list.dart';

part 'about_details.freezed.dart';

part 'about_details.g.dart';

@freezed
class AboutDetails with _$AboutDetails {
  factory AboutDetails({
    @Default(0) @JsonKey(name: 'height') int height,
    @Default(0) @JsonKey(name: 'weight') int weight,
    @Default(<AbilityList>[]) @JsonKey(name: 'abilities') List<AbilityList> abilities,
    @Default(0) @JsonKey(name: 'base_experience') int basexp,
  }) = _AboutDetails;

  factory AboutDetails.fromJson(Map<String, dynamic> json) => _$AboutDetailsFromJson(json);
}
