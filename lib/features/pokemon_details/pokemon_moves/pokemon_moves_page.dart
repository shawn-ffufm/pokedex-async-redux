import 'package:flutter/material.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonMovesPage extends StatelessWidget {
  const PokemonMovesPage({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text(str.movesTitle));
}
