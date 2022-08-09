import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon.dart';
import 'package:pokedex/utils/constant.dart' as k;
import 'package:dartx/dartx.dart';
import 'package:pokedex/utils/getimage.dart';

class PokemonTileItem extends StatelessWidget {
  const PokemonTileItem({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// TODO: details route will be made static in the pokemon details connector
      onTap: () => context.go('/details', extra: pokemon),

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
              pokemon.name.capitalize(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                /// TODO: this widget will be later improved on https://feilfeilfeil.atlassian.net/browse/PKM-32
                Image.network(
                  pokemon.url.getImage(),
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
