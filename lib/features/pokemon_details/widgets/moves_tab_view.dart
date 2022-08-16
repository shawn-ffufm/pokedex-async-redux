import 'package:dartx/dartx.dart';
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

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: _moveList(),
        ),
      ),
    );
  }

  List<Widget> _moveList() => List<Widget>.generate(
        details.moves.length,
        (i) => Container(
          color: Colors.blue,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            details.moves[i].move!.name.capitalize(),
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
        ),
      ).toList();
}
