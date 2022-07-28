import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon_model.dart';
import 'package:pokedex/utils/generate_pokemon_image.dart';
import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;
import 'package:dartx/dartx.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({
    super.key,
    required this.pokemons,
  });

  final List<PokemonModel>? pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(str.pokedexTitle)),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return Center(
            child: Column(
              children: <Widget>[
                /// TODO: show information that was gathered from api
                Text(
                  pokemons?[index].name?.capitalize() ?? '',
                  style: Theme.of(context).textTheme.headline5,
                ),

                /// TODO: create a reusable widget for loading the image
                SizedBox(width: k.hundred, height: k.hundred, child: Image.network(generateImage(index))),
              ],
            ),
          );
        }),
      ),
    );
  }
}
