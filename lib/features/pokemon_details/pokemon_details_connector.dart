import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_details/pokemon_details_page.dart';
import 'package:pokedex/features/pokemon_details/pokemon_details_vm.dart';
import 'package:pokedex/state/action/details_actions.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonDetailsConnector extends StatelessWidget {
  const PokemonDetailsConnector({Key? key, required this.id}) : super(key: key);

  static const String route = 'details';

  final int id;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonDetailsVm>(
      vm: () => PokemonDetailsVmFactory(),
      onInit: (store) async => store.dispatchAsync(GetPokemonAction(id: id.toString())),
      onDispose: (store) async => store.dispatchAsync(DisposePokemon()),
      builder: (context, vm) => PokemonDetailsPage(pokemon: vm.pokemon),
    );
  }
}
