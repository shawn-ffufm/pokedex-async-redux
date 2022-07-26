import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_list_connector.dart';
import 'package:pokedex/state/app_state.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key, required this.store});

  final Store<AppState> store;
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: const MaterialApp(
        title: 'Pokedex',
        home: PokemonListConnector(),
      ),
    );
  }
}
