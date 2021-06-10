import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  // const RoundButton({Key key}) : super(key: key);
  final IconData? child;
  final VoidCallback? onPressed;
  RoundIconButton({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPressed,
      elevation: 22.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(child),
    );
  }
}
