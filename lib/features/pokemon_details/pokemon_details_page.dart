import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/pokemon_details/pokemon_about/pokemon_about_page.dart';
import 'package:pokedex/features/pokemon_details/pokemon_evolution/pokemon_evolution_page.dart';
import 'package:pokedex/features/pokemon_details/pokemon_moves/pokemon_moves_page.dart';
import 'package:pokedex/features/pokemon_details/pokemon_stats/pokemon_stats_page.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    Key? key,
  }) : super(key: key);

  static const String route = '/details';
  static const String routeName = 'details';

  @override
  Widget build(BuildContext context) {
    final appBarViews = <Widget>[
      const PokemonAboutPage(),
      const PokemonStatsPage(),
      const PokemonEvolutionPage(),
      const PokemonMovesPage(),
    ];
    final appBarItems = <Tab>[
      const Tab(child: Text(str.aboutTitle)),
      const Tab(child: Text(str.statsTitle)),
      const Tab(child: Text(str.evolutionTitle)),
      const Tab(child: Text(str.movesTitle)),
    ];
    return DefaultTabController(
      length: appBarItems.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go(PokemonOverviewConnector.route);
            },
          ),
          title: const Text(
            str.pokemonDetailsTitle,
          ),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 320.0,
              child: Center(
                /// TODO: place image, name, type, of specific pokemon here
                child: Text(
                  'Place Pokemon Basic Details Here',
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
              child: GestureDetector(
                child: AppBar(
                  bottom: TabBar(
                    tabs: appBarItems,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: appBarViews,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
