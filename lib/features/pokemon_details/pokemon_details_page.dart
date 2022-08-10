import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_details/widgets/about_tab_view.dart';
import 'package:pokedex/features/pokemon_details/widgets/moves_tab_view.dart';
import 'package:pokedex/features/pokemon_details/widgets/stats_tab_view.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    Key? key,
  }) : super(key: key);

  static const String route = 'details';
  static const String routeName = 'details';

  @override
  Widget build(BuildContext context) {
    final appBarViews = <Widget>[
      const AboutTabView(),
      const StatsTabView(),
      const MovesTabView(),
    ];
    final appBarItems = <Tab>[
      const Tab(child: Text(str.aboutTitle)),
      const Tab(child: Text(str.statsTitle)),
      const Tab(child: Text(str.movesTitle)),
    ];

    return DefaultTabController(
      length: appBarItems.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(str.pokemonDetailsTitle),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 320.0,
              child: Center(
                /// TODO: place image, name, type, of specific pokemon here
                child: Text(str.basicDetails),
              ),
            ),
            SizedBox(
              height: 50.0,
              child: GestureDetector(
                child: AppBar(
                  bottom: TabBar(tabs: appBarItems),
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
