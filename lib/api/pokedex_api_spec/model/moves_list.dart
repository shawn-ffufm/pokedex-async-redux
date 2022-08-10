import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/move.dart';

part 'moves_list.freezed.dart';

part 'moves_list.g.dart';

@freezed
class MovesList with _$MovesList {
  factory MovesList({
    @JsonKey(name: 'move') Move? move,
  }) = _MovesList;

  factory MovesList.fromJson(Map<String, dynamic> json) => _$MovesListFromJson(json);
}
