import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/stat.dart';

part 'stats.freezed.dart';

part 'stats.g.dart';

@freezed
class Stats with _$Stats {
  factory Stats({
    @Default(0) @JsonKey(name: 'base_stat') int baseStat,
    @JsonKey(name: 'stat') Stat? stats,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
