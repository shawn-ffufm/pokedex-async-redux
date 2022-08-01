import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/favorite_list/favorite_pokemon.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_page.dart';
import 'package:pokedex/home_page.dart';
import 'package:pokedex/utils/constant.dart' as k;

final router = GoRouter(
  observers: [routeObservers],
  routes: <GoRoute>[
    GoRoute(path: '/', redirect: (_) => k.pokemonRoute, routes: []),
    GoRoute(
      /// TODO: path and name will be transferred to the connector once finished
      path: k.pokemonRoute,
      name: k.pokemonRouteName,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomePage(child: PokemonListPage()),
        transitionsBuilder: (context, anim, _, child) => FadeTransition(opacity: anim, child: child),
      ),
      routes: [],
    ),
    GoRoute(
      /// TODO: path and name will be transferred to the connector once finished
      path: k.favoriteRoute,
      name: k.favoriteRouteName,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomePage(child: FavoritePage()),
        transitionsBuilder: (context, anim, _, child) => FadeTransition(opacity: anim, child: child),
      ),
      routes: [],
    ),
  ],
  errorBuilder: (context, state) => const HomePage(child: PokemonListPage()),
);

// Register the RouteObserver as a navigation observer.
final RouteObserver<ModalRoute<void>> routeObservers = RouteObserver<ModalRoute<void>>();
