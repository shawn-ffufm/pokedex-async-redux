import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/move.dart';

part 'moves.freezed.dart';

part 'moves.g.dart';

@freezed
class Moves with _$Moves {
  factory Moves({
    @JsonKey(name: 'move') Move? move,
  }) = _Moves;

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
}
