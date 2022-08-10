import 'package:freezed_annotation/freezed_annotation.dart';

part 'move.freezed.dart';

part 'move.g.dart';

@freezed
class Move with _$Move {
  factory Move({
    @Default('') @JsonKey(name: 'name') String name,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}
