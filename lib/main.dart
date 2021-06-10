import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0D22),
          scaffoldBackgroundColor: Color(0xFF0A0D22),
          sliderTheme: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            thumbColor: Color(0xffeb1555),
            activeTrackColor: Colors.white,
            overlayColor: Color(0x29eb1555),
          )

          // accentColor: Colors.cyan[600],
          // bottomAppBarColor: Colors.yellow
          ),
      home: InputPage(),
      // routes: {'/calculate': (context) => CalculatePage()},
    );
  }
}
