import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_api_spec/model/stats.dart';
import 'package:pokedex/widgets/app_text_widgets.dart';
import 'package:pokedex/widgets/spacings.dart';

class StatsTabView extends StatelessWidget {
  const StatsTabView({
    super.key,
    required this.stats,
  });

  final List<Stats> stats;

  @override
  Widget build(BuildContext context) {
    /// TODO: This will be improved once loading is implemented

    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 280.0,
                  child: DetailText(text: stats[index].stats!.name),
                ),
                const HorizontalSpace(space: 20.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 360.0,
                  child: DetailText(text: stats[index].baseStat.toString()),
                ),
                const HorizontalSpace(space: 20.0),
                Expanded(
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                    minHeight: 5.0,
                    value: stats[index].baseStat / 200.0,
                  ),
                ),
              ],
            ),
            const VerticalSpace(space: 20.0),
          ],
        );
      },
    );
  }
}
