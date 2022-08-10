import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon.dart';
import 'package:pokedex/features/pokemon_details/pokemon_details_page.dart';
import 'package:pokedex/features/pokemon_details/pokemon_details_vm.dart';
import 'package:pokedex/state/action/home_actions.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utils/extensions.dart';

class PokemonDetailsConnector extends StatelessWidget {
  const PokemonDetailsConnector({Key? key, required this.id}) : super(key: key);

  static const String route = 'details';
  static const String routeName = 'details';

  final int id;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonDetailsVm>(
      vm: () => PokemonDetailsVmFactory(),
      onInit: (store) async => store.dispatchAsync(GetDetailsAction(id: id)),
      onDispose: (store) async => store.dispatchAsync(DisposeSelectedPokemon()),
      builder: (context, vm) => PokemonDetailsPage(pokemon: vm.pokemon),
    );
  }
}
