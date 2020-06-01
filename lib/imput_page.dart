import 'package:flutter/material.dart';
import 'constants.dart';
import './content_card.dart';
import 'package:flutter/cupertino.dart';
import './Calculate_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './reusable_card.dart';
import './content_card.dart';
import './results_page.dart';


enum Gender {
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {


  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender== Gender.male ? kActiveCardColour:kInactiveCardColour,
                        cardChild: ContentCard(cardIcon: FontAwesomeIcons.mars,cardText: 'MALE'),

                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: (){
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female? kActiveCardColour:kInactiveCardColour,
                        cardChild: ContentCard(cardIcon: FontAwesomeIcons.venus,cardText: 'FEMALE'),
                      ),

                    ),

                  ],
                )
            ),

            Expanded(
              child: ReusableCard(
                colour:kInactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: kCardTextStyle,),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),
                          style: kCardNewTextStyle,

                        ),
                        Text('cm',
                          style: kCardTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      activeColor: Color(0XFFEB1555),
                      inactiveColor: Color(0XFF8D8E98),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();

                        });
                      },

                    ),
                  ],
                ),
              ),
            ),

            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child:  ReusableCard(
                        colour:kInactiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT',
                              style: kCardTextStyle,
                            ),
                            Text( weight.toString(),
                              style: kCardNewTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },),
                                SizedBox(width: 10.0),
                                RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },),
                              ],
                            )


                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child:  ReusableCard(
                        colour:kInactiveCardColour,
                        cardChild: Column(
                          children: <Widget>[
                            Text('AGE',
                              style: kCardTextStyle,
                            ),
                            Text(age.toString(),
                              style: kCardNewTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                }),
                              ],
                            )

                          ],
                        ),
                      ),
                    ),


                  ],
                )
            ),
            GestureDetector(
              onTap: (){
                CalculateBrain calc = CalculateBrain(height: height,weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultPage(
                    bmiResult:  calc.calculateBMI(),
                    resultText: calc.returnResult(),
                    interpretationText: calc.returnMessage(),
                    
                  );
                },),);
              },
              child: Container(
                child: Center(
                  child: Text('CALCULATE',
                    style: kBaseTextStyle,
                  ),
                ),
                color: kBottomContainerColour,
                margin: EdgeInsets.only(top:10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
              ),
            ),


          ],

        )

    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {


    return RawMaterialButton(

      onPressed: onPressed,
      fillColor: Color(0XFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      child: Icon(icon,
        color: Colors.white,

      ),



    );
  }
}



