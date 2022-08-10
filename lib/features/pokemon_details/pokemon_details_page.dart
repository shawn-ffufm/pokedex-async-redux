import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon_details.dart';
import 'package:pokedex/features/pokemon_details/widgets/about_tab_view.dart';
import 'package:pokedex/features/pokemon_details/widgets/moves_tab_view.dart';
import 'package:pokedex/features/pokemon_details/widgets/stats_tab_view.dart';
import 'package:pokedex/api/pokedex_api_spec/model/pokemon.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    Key? key,
    required this.pokemon,
    required this.details,
  }) : super(key: key);

  final Pokemon pokemon;
  final PokemonDetails? details;

  @override
  Widget build(BuildContext context) {
    final tabBarViews = <Widget>[
      AboutTabView(
        details: details?.aboutDetails,
      ),
      StatsTabView(
        details: details?.statsDetails,
      ),
      MovesTabView(
        details: details?.movesDetails,
      ),
    ];

    final pokemonImageUrl = pokemon.url.toCustomUrl;

    final tabBarItems = <Tab>[
      const Tab(child: Text(str.aboutTitle)),
      const Tab(child: Text(str.statsTitle)),
      const Tab(child: Text(str.movesTitle)),
    ];

    return DefaultTabController(
      length: tabBarItems.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(str.pokemonDetailsTitle),
        ),
        body: Column(
          children: <Widget>[
            // construct the profile details widget here
            SizedBox(
              height: 320.0,
              child: Center(
                /// TODO: place image, name, type, of specific pokemon here
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      pokemon.name.capitalize(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Image.network(
                      pokemonImageUrl,
                      height: k.imageHeight,
                      width: k.imageWidth,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
              child: GestureDetector(
                child: AppBar(
                  bottom: TabBar(tabs: tabBarItems),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: tabBarViews),
            ),
          ],
        ),
      ),
    );
  }
}
