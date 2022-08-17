import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_api_spec/model/moves.dart';
import 'package:pokedex/features/pokemon_details/widgets/move_item.dart';

class MovesTabView extends StatelessWidget {
  const MovesTabView({
    super.key,
    required this.moves,
  });

  final List<Moves> moves;

  @override
  Widget build(BuildContext context) {
    /// TODO: This will be improved once loading is implemented

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          runSpacing: 5.0,
          spacing: 5.0,
          children: [
            ...moves.map(
              (detail) => MoveItem(move: detail.move!),
            ),
          ],
        ),
      ),
    );
  }
}
