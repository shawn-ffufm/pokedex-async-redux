import 'package:flutter/material.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonFavoritesPage extends StatelessWidget {
  const PokemonFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(str.favoriteTitle),
    );
  }
}
