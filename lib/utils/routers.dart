import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/pokemon_favorites/favorite_connector.dart';
import 'package:pokedex/features/pokemon_favorites/favorite_pokemon.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_list_connector.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_list_page.dart';
import 'package:pokedex/home_page.dart';

final router = GoRouter(
  observers: [routeObservers],
  routes: <GoRoute>[
    GoRoute(path: '/', redirect: (_) => PokemonListConnector.route, routes: []),
    GoRoute(
      path: PokemonListConnector.route,
      name: PokemonListConnector.routeName,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomePage(child: PokemonListPage()),
        transitionsBuilder: (context, anim, _, child) => FadeTransition(opacity: anim, child: child),
      ),
      routes: [],

      /// TODO: Add a sub routes in the future
    ),
    GoRoute(
      path: FavoriteConnector.route,
      name: FavoriteConnector.routeName,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomePage(child: FavoritePage()),
        transitionsBuilder: (context, anim, _, child) => FadeTransition(opacity: anim, child: child),
      ),
      routes: [],

      /// TODO: Add a sub routes in the future
    ),
  ],
  errorBuilder: (context, state) => const HomePage(child: PokemonListPage()),
);

// Register the RouteObserver as a navigation observer.
final RouteObserver<ModalRoute<void>> routeObservers = RouteObserver<ModalRoute<void>>();
