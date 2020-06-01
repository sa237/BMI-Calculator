import 'package:flutter/material.dart';
import './constants.dart';


class ResultPage extends StatelessWidget {
  ResultPage({@required this.resultText, @required this.bmiResult, @required this.interpretationText});


  final String resultText;
  final String bmiResult;
  final String interpretationText;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text('YOUR RESULT',
                  style: kResultTextStyle,
                ),
                padding: EdgeInsets.only(top: 20.0),

              ),),
            Expanded(
              flex: 5,
              child: Container(
                color: Color(0XFF1D1E33),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Text( resultText.toUpperCase() ,
                          style: TextStyle(
                            color: Color(0XFF24D876),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text( bmiResult ,
                          style: TextStyle(
                            fontSize: 70.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(interpretationText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ) ,
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);

                },
                child: Container(
                  child: Center(
                    child: Text('RE-CALCULATE',
                      style: kBaseTextStyle,
                    ),
                  ),
                  color: kBottomContainerColour,
                  margin: EdgeInsets.only(top:10.0),
                  width: double.infinity,
                  height: kBottomContainerHeight,
                ),
              ),
            ),
          ],
        )
    );
  }
}
