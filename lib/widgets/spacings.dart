import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({
    super.key,
    required this.space,
  });

  final double space;

  @override
  Widget build(BuildContext context) => SizedBox(height: space);
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({
    super.key,
    required this.space,
  });

  final double space;

  @override
  Widget build(BuildContext context) => SizedBox(width: space);
}
