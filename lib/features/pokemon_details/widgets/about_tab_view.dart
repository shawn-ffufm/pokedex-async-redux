import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon_details/widgets/about_item.dart';
import 'package:pokedex/utils/typedefs.dart';

class AboutTabView extends StatelessWidget {
  const AboutTabView({
    super.key,
    required this.aboutDetails,
  });

  final AboutDetails aboutDetails;

  @override
  Widget build(BuildContext context) {
    /// TODO: This will be improved once loading is implemented

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var detail in aboutDetails.entries)
            AboutItem(
              itemLabel: detail.key,
              itemContent: detail.value,
            ),
        ],
      ),
    );
  }
}
