import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_overview_page.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_overview_vm.dart';
import 'package:pokedex/state/action/home_actions.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonOverviewConnector extends StatelessWidget {
  const PokemonOverviewConnector({Key? key}) : super(key: key);

  static const String route = '/pokemons';
  static const String routeName = 'pokemons';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonOverviewVm>(
      vm: () => PokemonOverviewVmFactory(),
      onInit: (store) async => store.dispatchAsync(GetPokemonListAction()),
      builder: (context, vm) => PokemonOverviewPage(pokemonList: vm.pokemonList),
    );
  }
}
