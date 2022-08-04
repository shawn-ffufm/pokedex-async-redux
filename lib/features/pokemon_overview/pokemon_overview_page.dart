import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokemon_tile_item.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({super.key});

  static const double _ten = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(str.pokedexTitle),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 190,
            childAspectRatio: _ten / 9,
            crossAxisSpacing: _ten,
            mainAxisSpacing: _ten,
          ),
          itemBuilder: (context, index) => const PokemonTileItem(),
        ),
      ),
    );
  }
}
