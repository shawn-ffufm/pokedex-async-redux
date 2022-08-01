import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_favorites/pokemon_favorites_page.dart';
import 'package:pokedex/features/pokemon_favorites/pokemon_favorites_vm.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonFavoritesConnector extends StatelessWidget {
  const PokemonFavoritesConnector({Key? key}) : super(key: key);

  static const String route = '/favorites';
  static const String routeName = 'favorites';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonFavoritesVm>(
      vm: () => PokemonFavoritesVmFactory(),
      builder: (context, vm) => const PokemonFavoritesPage(),
    );
  }
}
