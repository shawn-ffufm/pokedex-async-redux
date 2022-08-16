import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat.freezed.dart';

part 'stat.g.dart';

@freezed
class Stat with _$Stat {
  factory Stat({
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'url') String url,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}
