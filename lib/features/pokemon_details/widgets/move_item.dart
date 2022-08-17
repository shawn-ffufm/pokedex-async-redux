import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_api_spec/model/move.dart';
import 'package:pokedex/widgets/app_text_widgets.dart';

class MoveItem extends StatelessWidget {
  const MoveItem({
    super.key,
    required this.move,
  });

  final Move move;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      padding: const EdgeInsets.all(8.0),
      child: DetailText(text: move.name),
    );
  }
}
