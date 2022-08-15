import 'package:freezed_annotation/freezed_annotation.dart';

part 'moves.freezed.dart';

part 'moves.g.dart';

@freezed
class Moves with _$Moves {
  factory Moves({
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'url') String url,
  }) = _Moves;

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
}
