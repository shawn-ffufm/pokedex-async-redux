import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/ability_list.dart';

part 'stats_details.freezed.dart';

part 'stats_details.g.dart';

@freezed
class StatsDetails with _$StatsDetails {
  factory StatsDetails({
    @Default(0) @JsonKey(name: 'base_stat') int baseStat,
    @Default(0) @JsonKey(name: 'effort') int effort,
    @Default(<AbilityList>[]) @JsonKey(name: 'stat') List<AbilityList> stats,
  }) = _StatsDetails;

  factory StatsDetails.fromJson(Map<String, dynamic> json) => _$StatsDetailsFromJson(json);
}
