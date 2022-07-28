import 'package:flutter/material.dart';
import 'package:pokedex/utils/routers.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: str.pokedexTitle,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
