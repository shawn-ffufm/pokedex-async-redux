import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_name.freezed.dart';

part 'stats_name.g.dart';

@freezed
class Stats with _$Stats {
  factory Stats({
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'url') String url,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
