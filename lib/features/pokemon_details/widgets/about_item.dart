import 'package:flutter/material.dart';
import 'package:pokedex/widgets/app_text_widgets.dart';
import 'package:pokedex/widgets/spacings.dart';

class AboutItem extends StatelessWidget {
  const AboutItem({
    super.key,
    required this.itemLabel,
    required this.itemContent,
  });

  final String itemLabel;
  final String itemContent;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 250.0,
                child: DetailText(text: itemLabel),
              ),
              const HorizontalSpace(space: 10.0),
              SizedBox(
                width: MediaQuery.of(context).size.width - 200.0,
                child: DetailText(text: itemContent),
              ),
            ],
          ),
          const VerticalSpace(space: 20.0),
        ],
      );
}
