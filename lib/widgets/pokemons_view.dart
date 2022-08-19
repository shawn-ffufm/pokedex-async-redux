import 'package:flutter/material.dart';
import 'package:pokedex/utils/constant.dart' as k;
import 'package:pokedex/utils/typedefs.dart';
import 'package:pokedex/widgets/pokemon_tile_item.dart';

class PokemonsView extends StatelessWidget {
  const PokemonsView({
    super.key,
    required this.pokemons,
    required this.onTap,
  });

  final PokemonList pokemons;
  final OnSelectPokemon onTap;

  @override
  Widget build(BuildContext context) => GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: k.gridSizeAcross,
          childAspectRatio: k.gridWidth / k.gridHeightRatio,
          crossAxisSpacing: k.gridWidth,
          mainAxisSpacing: k.gridWidth,
        ),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];

          return PokemonTileItem(
            pokemon: pokemon,
            onTap: () => onTap(pokemon),
          );
        },
      );
}
