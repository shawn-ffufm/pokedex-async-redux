import 'package:freezed_annotation/freezed_annotation.dart';

part 'move.freezed.dart';

part 'move.g.dart';

@freezed
class Move with _$Move {
  factory Move({
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'url') String url,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}
