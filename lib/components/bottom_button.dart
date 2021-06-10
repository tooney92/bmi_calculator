import 'package:flutter/material.dart';
import './constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  BottomButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        color: kbottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        height: kbottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            this.title,
            style: kcalculateStyle,
          ),
        ),
      ),
    );
  }
}
