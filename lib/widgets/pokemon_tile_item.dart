import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon_model.dart';
import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;
import 'package:dartx/dartx.dart';

class PokemonTileItem extends StatelessWidget {
  PokemonTileItem({super.key, required this.pokemonList, required this.index});

  List<Pokemon> pokemonList;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),

      /// TODO: on tap should redirect and display the details of the pokemon
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              pokemonList[index].name.capitalize(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Column(
                  children: const [
                    Text(
                      str.typeFiller,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      str.typeFiller,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Image.network(
                  k.imageURL.replaceAll(str.indexReplace, (index + 1).toString()),
                  height: k.imageHeight,
                  width: k.imageWidth,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
