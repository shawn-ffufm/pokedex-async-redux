import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/favorite_list/favorite_pokemon_connector.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_connector.dart';
import 'package:pokedex/home_page.dart';
import 'package:pokedex/utils/constant.dart' as k;

final router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      name: k.homeRouteName,
      path: k.homeRoute,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: k.pokemonRouteName,
      path: k.pokemonRoute,
      builder: (context, state) => const PokemonListConnector(),
    ),
    GoRoute(
      name: k.favoriteRouteName,
      path: k.favoriteRoute,
      builder: (context, state) => const FavoriteConnector(),
    ),
  ],

  /// TODO: ADD error handler
  /// TODO: Add Redirect
);

// Register the RouteObserver as a navigation observer.
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
