import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/favorite_list/favorite_pokemon.dart';
import 'package:pokedex/features/favorite_list/favorite_vm.dart';
import 'package:pokedex/state/app_state.dart';

class FavoriteConnector extends StatelessWidget {
  const FavoriteConnector({Key? key}) : super(key: key);

  static const String route = '/favorites';
  static const String name = 'favorites';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FavoriteVm>(
      vm: () => FavoriteVmFactory(),
      builder: (context, vm) => const FavoritePage(),
    );
  }
}
