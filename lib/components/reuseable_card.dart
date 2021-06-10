import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final VoidCallback onPress;

  ReuseableCard({required this.colour, this.cardChild, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
      onTap: this.onPress,
    );
  }
}
