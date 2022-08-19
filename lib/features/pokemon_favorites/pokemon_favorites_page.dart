import 'package:flutter/material.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/typedefs.dart';
import 'package:pokedex/widgets/pokemon_tile_item.dart';

class PokemonFavoritesPage extends StatelessWidget {
  const PokemonFavoritesPage({
    super.key,
    required this.pokemons,
    required this.onSaveSelectedPokemon,
  });

  final PokemonList pokemons;
  final OnSelectPokemon onSaveSelectedPokemon;

  static const double _width = 10.0;
  static const double _heightRatio = 9.0;
  static const double _sizeAcross = 190.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(str.favoriteTitle)),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _sizeAcross,
          childAspectRatio: _width / _heightRatio,
          crossAxisSpacing: _width,
          mainAxisSpacing: _width,
        ),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];

          return PokemonTileItem(
            pokemon: pokemon,
            onTap: () => _onTapPokemonItem(pokemon),
          );
        },
      ),
    );
  }

  void _onTapPokemonItem(PokemonDto pokemon) => onSaveSelectedPokemon(pokemon);
}
