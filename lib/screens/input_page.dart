import 'package:bmi_calculator/components//constants.dart';
import 'package:bmi_calculator/screens/calculate_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components//reuseable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/gender_card.dart';
import '../components//constants.dart';
import '../components/roundIconButton.dart';
import '../components/bottom_button.dart';
import '../calculator_brain.dart';

enum Gender { male, female }
enum action { add, minus }
int weight = 50;
int age = 10;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int _currentSliderValue = 180;
  void updateWeight(action userButton) {
    if (userButton == action.add) {
      setState(() {
        weight = weight + 1;
      });
    } else {
      setState(() {
        weight = weight - 1;
      });
    }
  }

  void updateAge(action userButton) {
    if (userButton == action.add) {
      setState(() {
        age = age + 1;
      });
    } else {
      setState(() {
        age = age - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: ReuseableCard(
                        colour: selectedGender == Gender.male
                            ? kactiveCardColor
                            : kinActiveCardColor,
                        cardChild: GenderCard(
                            gender: 'male',
                            genderIcon: Icon(
                              FontAwesomeIcons.male,
                              size: 80.0,
                            )),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: ReuseableCard(
                        colour: selectedGender == Gender.female
                            ? kactiveCardColor
                            : kinActiveCardColor,
                        cardChild: GenderCard(
                            gender: 'female',
                            genderIcon: Icon(
                              FontAwesomeIcons.female,
                              size: 80.0,
                            )),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                  flex: 2,
                  child: ReuseableCard(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kcardTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$_currentSliderValue',
                              style: knumberStyle,
                            ),
                            Text('cm')
                          ],
                        ),
                        Slider(
                            value: _currentSliderValue.toDouble(),
                            min: 0,
                            max: 180,
                            divisions: 10,
                            inactiveColor: Color(0xff8d8e98),
                            label: _currentSliderValue.round().toString(),
                            onChanged: (double value) {
                              print(value);
                              setState(() {
                                _currentSliderValue = value.round();
                              });
                            })
                      ],
                    ),
                    onPress: () {},
                  )),
              SizedBox(height: 20.0),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: ReuseableCard(
                        colour: kactiveCardColor,
                        onPress: () {},
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'weight',
                              style: kcardTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: knumberStyle,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    child: Icons.add,
                                    onPressed: () => updateWeight(action.add),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  RoundIconButton(
                                    child: FontAwesomeIcons.minus,
                                    onPressed: () => updateWeight(action.minus),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: ReuseableCard(
                        colour: kactiveCardColor,
                        onPress: () {},
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Age',
                              style: kcardTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: knumberStyle,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    child: Icons.add,
                                    onPressed: () => updateAge(action.add),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  RoundIconButton(
                                    child: FontAwesomeIcons.minus,
                                    onPressed: () => updateAge(action.minus),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              BottomButton(
                  title: 'CALCULATE',
                  onTap: () {
                    CalculatorBrain calc = CalculatorBrain(
                        weight: weight, height: _currentSliderValue);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalculatePage(
                                  bmiResult: calc.calculateBMI(),
                                  resultText: calc.getResult(),
                                  interpretation: calc.getInterpretation(),
                                )));
                  }),
            ],
          ),
        ));
  }
}
