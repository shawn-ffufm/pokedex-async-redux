import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_connector.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  /// TODO: implement go_router in this part
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: str.pokedexTitle,
      home: PokemonListConnector(),
    );
  }
}
