import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_page.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_vm.dart';
import 'package:pokedex/state/actions/pokemon_actions.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonListConnector extends StatelessWidget {
  const PokemonListConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonListVm>(
      vm: () => PokemonListVmFactory(),
      onInit: (store) => store.dispatch(GetPokemonAction()),
      builder: (context, vm) => PokemonListPage(pokemons: vm.pokemons),
    );
  }
}
