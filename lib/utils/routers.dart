import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex/features/pokemon_favorites/pokemon_favorites_connector.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex/home_page.dart';

final router = GoRouter(
  observers: [routeObservers],
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      redirect: (_) => PokemonOverviewConnector.route,
      routes: [],
    ),
    GoRoute(
      name: PokemonOverviewConnector.routeName,
      path: PokemonOverviewConnector.route,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomePage(child: PokemonOverviewConnector()),
        transitionsBuilder: (context, anim, _, child) => FadeTransition(
          opacity: anim,
          child: child,
        ),
      ),
      routes: [
        GoRoute(
          name: PokemonDetailsConnector.route,
          path: PokemonDetailsConnector.route,
          builder: (context, state) => PokemonDetailsConnector(id: state.extra as int),
        ),
      ],
    ),
    GoRoute(
      name: PokemonFavoritesConnector.routeName,
      path: PokemonFavoritesConnector.route,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomePage(child: PokemonFavoritesConnector()),
        transitionsBuilder: (context, anim, _, child) => FadeTransition(
          opacity: anim,
          child: child,
        ),
      ),
      routes: [],

      /// TODO: Add a sub routes in the future
    ),
  ],
  errorBuilder: (context, state) => const HomePage(child: PokemonOverviewConnector()),
);

// Register the RouteObserver as a navigation observer.
final RouteObserver<ModalRoute<void>> routeObservers = RouteObserver<ModalRoute<void>>();
