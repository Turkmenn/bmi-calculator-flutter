import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'AylaCard.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Gender { erkek, zenan }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int weight = 60;
  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: AylaCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.erkek;
                        });
                      },
                      colour: selectedGender == Gender.erkek
                          ? kcolorOfscreen
                          : kinactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'ERKEK',
                      ),
                    ),
                  ),
                  Expanded(
                    child: AylaCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.zenan;
                        });
                      },
                      colour: selectedGender == Gender.zenan
                          ? kcolorOfscreen
                          : kinactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'ZENAN',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AylaCard(
                colour: kcolorOfscreen,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          overlayColor: Color(0x26EB1555),
                          activeTrackColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 250,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: AylaCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: klabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: kcolorOfscreen,
                    ),
                  ),
                  Expanded(
                    child: AylaCard(
                      colour: kcolorOfscreen,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: kbottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kbottomContainerHeight,
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {},
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
