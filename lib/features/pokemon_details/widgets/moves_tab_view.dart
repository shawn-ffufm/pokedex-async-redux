import 'package:flutter/material.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';

class MovesTabView extends StatelessWidget {
  const MovesTabView({
    super.key,
    required this.details,
  });

  final PokemonDto details;

  @override
  Widget build(BuildContext context) {
    /// TODO: This will be improved once loading is implemented
    final moves = details.moves.isEmpty ? '' : details.moves[0].move!.name;

    return Center(child: Text(moves));
  }
}
