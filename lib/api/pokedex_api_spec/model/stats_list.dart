import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/stats_name.dart';

part 'stats_list.freezed.dart';

part 'stats_list.g.dart';

@freezed
class StatsList with _$StatsList {
  factory StatsList({
    @JsonKey(name: 'stat') Stats? stats,
  }) = _StatsList;

  factory StatsList.fromJson(Map<String, dynamic> json) => _$StatsListFromJson(json);
}
