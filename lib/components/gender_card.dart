import 'package:flutter/material.dart';
import './constants.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final Icon genderIcon;
  GenderCard({required this.gender, required this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: genderIcon,
        ),
        SizedBox(
          height: ksizeBoxHeight,
        ),
        Text(
          gender,
          style: kcardTextStyle,
        )
      ],
    );
  }
}
