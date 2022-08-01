import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_page.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_vm.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonListConnector extends StatelessWidget {
  const PokemonListConnector({Key? key}) : super(key: key);

  static const String route = '/pokemons';
  static const String routeName = 'pokemons';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonListVm>(
      vm: () => PokemonListVmFactory(),
      builder: (context, vm) => const PokemonListPage(),
    );
  }
}
