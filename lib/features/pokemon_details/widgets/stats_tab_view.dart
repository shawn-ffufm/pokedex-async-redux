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
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final statsName = stats[index].stats?.name ?? '';
        final statsValue = stats[index].baseStat.toString();
        final statsProgress = stats[index].baseStat / 200.0;

        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: mediaQueryWidth - 280.0,
                  child: DetailText(text: statsName),
                ),
                const HorizontalSpace(space: 20.0),
                SizedBox(
                  width: mediaQueryWidth - 360.0,
                  child: DetailText(text: statsValue),
                ),
                const HorizontalSpace(space: 20.0),
                Expanded(
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                    minHeight: 5.0,
                    value: statsProgress,
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
