import 'package:flutter/material.dart';
import '../components//constants.dart';
import '../components//reuseable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
// import '../calculator_brain.dart';

class CalculatePage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  CalculatePage(
      {required this.bmiResult,
      required this.interpretation,
      required this.resultText});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('calculate'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Your Result',
                  style: kCalculateTitle,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReuseableCard(
                  colour: kinActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: kWeightMessage,
                      ),
                      Text(
                        bmiResult,
                        style: kBMINumber,
                      ),
                      Text(
                        interpretation,
                        style: kAdviceMessage,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  onPress: () {},
                ),
              ),
            ),
            BottomButton(
              title: 'recalculate',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
