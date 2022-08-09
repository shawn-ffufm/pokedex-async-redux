import 'package:flutter/material.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonStatsPage extends StatelessWidget {
  const PokemonStatsPage({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text(str.statsTitle));
}
