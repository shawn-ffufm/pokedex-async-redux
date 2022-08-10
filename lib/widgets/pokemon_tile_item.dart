import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon.dart';
import 'package:pokedex/features/pokemon_details/pokemon_details_connector.dart';
import 'package:dartx/dartx.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/utils/constant.dart' as k;

class PokemonTileItem extends StatelessWidget {
  const PokemonTileItem({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final pokemonImageUrl = pokemon.url.toCustomUrl;
    return GestureDetector(
      onTap: () => context.pushNamed(PokemonDetailsConnector.routeName, extra: pokemon),
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
                  pokemonImageUrl,
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
