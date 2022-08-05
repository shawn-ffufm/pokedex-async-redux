import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon_model.dart';
import 'package:pokedex/widgets/pokemon_tile_item.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({super.key, required this.pokemonList});

  final List<Pokemon> pokemonList;
  static const double _width = 10;
  static const double _heightRatio = 9;
  static const double _sizeAcross = 190;

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
            maxCrossAxisExtent: _sizeAcross,
            childAspectRatio: _width / _heightRatio,
            crossAxisSpacing: _width,
            mainAxisSpacing: _width,
          ),
          itemCount: pokemonList.length,
          itemBuilder: (context, index) => PokemonTileItem(pokemonList: pokemonList, index: index),

        ),
      ),
    );
  }
}
