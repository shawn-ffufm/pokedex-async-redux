import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_api_spec/model/move.dart';
import 'package:dartx/dartx.dart';

class MoveItem extends StatelessWidget {
  const MoveItem({super.key, required this.move});

  final Move move;

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          move.name.capitalize(),
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        ),
      );
}
