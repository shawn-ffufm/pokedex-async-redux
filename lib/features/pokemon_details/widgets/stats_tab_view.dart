import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/utils/strings.dart' as str;

class StatsTabView extends StatelessWidget {
  const StatsTabView({
    super.key,
    required this.details,
  });

  final PokemonDto details;

  @override
  Widget build(BuildContext context) {
    /// TODO: This will be improved once loading is implemented
    var statName = <String>[];
    var statValue = <int>[];
    var statValueProgression = <double>[];
    for (var i = 0; i < details.stats.length; i++) {
      if (details.stats[i].stats!.name == str.specialAttackJsonString) {
        statName.add(str.specialAttack);
      } else if (details.stats[i].stats!.name == str.specialDefenseJsonString) {
        statName.add(str.specialDefense);
      } else {
        statName.add(details.stats[i].stats!.name);
      }
      statValue.add(details.stats[i].baseStat);
      statValueProgression.add((details.stats[i].baseStat / 200.0));
    }

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: statName.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  _makeSizedBox(statName[index], 100.0),
                  _makeSizedBox(statValue[index].toString(), 50.0),
                  SizedBox(
                    width: 200.0,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey,
                      color: Colors.green,
                      minHeight: 5.0,
                      value: statValueProgression[index],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }

  Widget _makeSizedBox(String text, double width) => SizedBox(
        width: width,
        child: Text(
          text.capitalize(),
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        ),
      );
}
