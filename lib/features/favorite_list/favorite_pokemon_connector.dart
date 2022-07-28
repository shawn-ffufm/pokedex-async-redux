import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/favorite_list/favorite_pokemon.dart';
import 'package:pokedex/features/favorite_list/favorite_pokemon_vm.dart';
import 'package:pokedex/state/actions/pokemon_actions.dart';
import 'package:pokedex/state/app_state.dart';

class FavoriteConnector extends StatelessWidget {
  const FavoriteConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FavoriteVm>(
      vm: () => FavoriteVmFactory(),
      onInit: (store) => store.dispatch(GetPokemonAction()),

      /// TODO: get favorites pokemon
      builder: (context, vm) => FavoritePage(pokemons: vm.pokemons),
    );
  }
}
