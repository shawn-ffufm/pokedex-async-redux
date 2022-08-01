import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/pokemon_favorites/pokemon_favorites_connector.dart';
import 'package:pokedex/features/pokemon_favorites/pokemon_favorites_page.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_overview_page.dart';
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
      path: PokemonFavoritesConnector.route,
      name: PokemonFavoritesConnector.routeName,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomePage(child: PokemonFavoritesPage()),
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
