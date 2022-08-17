import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

class DetailText extends StatelessWidget {
  const DetailText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text.capitalize(),
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
      );
}
