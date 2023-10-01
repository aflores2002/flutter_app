import 'package:flutter/material.dart';

class TinderCard extends StatelessWidget {
  final color;

  const TinderCard({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: color,
      ),
    );
  }
}
