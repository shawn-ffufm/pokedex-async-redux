import 'package:flutter/material.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(str.pokedexTitle),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return Center(
            child: Column(
              children: <Widget>[
                /// TODO: show information that was gathered from api
                Text(
                  str.dummyString,
                  style: Theme.of(context).textTheme.headline5,
                ),

                /// TODO: create a reusable widget for loading the image
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(str.pokeImage),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
