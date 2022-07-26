import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_list_page.dart';
import 'package:pokedex/features/pokemon_list_vm.dart';
import 'package:pokedex/state/actions/pokemon_list_actions.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonListConnector extends StatelessWidget {
  const PokemonListConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonListVm>(
      vm: () => PokemonListVmFactory(),
      onInit: (store) async => store.dispatch(GetPokemonList()),
      builder: (context, vm) => PokemonListPage(name: vm.name),
    );
  }
}
