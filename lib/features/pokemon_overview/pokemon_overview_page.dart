import 'package:flutter/material.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Center(child: Text(str.pokedexTitle));
}
