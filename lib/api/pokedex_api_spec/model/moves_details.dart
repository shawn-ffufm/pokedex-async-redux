import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/pokedex_api_spec/model/moves_list.dart';

part 'moves_details.freezed.dart';

part 'moves_details.g.dart';

@freezed
class MovesDetails with _$MovesDetails {
  factory MovesDetails({
    @Default(<MovesList>[]) @JsonKey(name: 'moves') List<MovesList> moves,
  }) = _MovesDetails;

  factory MovesDetails.fromJson(Map<String, dynamic> json) => _$MovesDetailsFromJson(json);
}
