import 'package:flutter/material.dart';
import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/typedefs.dart';
import 'package:pokedex/widgets/pokemons_view.dart';

class PokemonFavoritesPage extends StatelessWidget {
  const PokemonFavoritesPage({
    super.key,
    required this.pokemons,
    required this.onSaveSelectedPokemon,
  });

  final PokemonList pokemons;
  final OnSelectPokemon onSaveSelectedPokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(str.favoriteTitle)),
      body: PokemonsView(
        pokemons: pokemons,
        onTap: onSaveSelectedPokemon,
      ),
    );
  }
}
