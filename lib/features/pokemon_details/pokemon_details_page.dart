import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_details/widgets/about_tab_view.dart';
import 'package:pokedex/features/pokemon_details/widgets/moves_tab_view.dart';
import 'package:pokedex/features/pokemon_details/widgets/stats_tab_view.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;
import 'package:pokedex/utils/typedefs.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    Key? key,
    required this.pokemon,
    required this.onFavoritePokemon,
  }) : super(key: key);

  final PokemonDto pokemon;
  final OnSelectPokemon onFavoritePokemon;

  @override
  Widget build(BuildContext context) {
    final tabBarViews = <Widget>[
      AboutTabView(aboutDetails: pokemon.toAboutDetails),
      StatsTabView(stats: pokemon.stats),
      MovesTabView(moves: pokemon.moves),
    ];
    final tabBarItems = <Tab>[
      const Tab(child: Text(str.aboutTitle)),
      const Tab(child: Text(str.statsTitle)),
      const Tab(child: Text(str.movesTitle)),
    ];

    final pokemonImageUrl = pokemon.pokemon.url.toCustomUrl;
    final pokemonName = pokemon.pokemon.name.capitalize();

    return DefaultTabController(
      length: tabBarItems.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(str.pokemonDetailsTitle),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 320.0,
              child: Center(
                /// TODO: place type of specific pokemon here
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    pokemon.isFavorite
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: const Icon(Icons.favorite),
                                onPressed: () => _onTapFavoritePokemon(pokemon),
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: const Icon(Icons.favorite_border),
                                onPressed: () => _onTapFavoritePokemon(pokemon),
                              ),
                            ),
                          ),
                    Text(
                      pokemonName,
                      style: const TextStyle(
                        fontSize: 20.0,
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

  void _onTapFavoritePokemon(PokemonDto pokemon) => onFavoritePokemon(pokemon);
}
