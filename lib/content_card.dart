import 'package:flutter/material.dart';
import './constants.dart';

class ContentCard extends StatelessWidget {
  ContentCard({@required this.cardIcon,this.cardText});
  final IconData cardIcon;
  final String cardText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: 80.0,
          color:  Color(0XFF8D8E98),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardText,
          style: kCardTextStyle,

        ),
      ],
    );
  }
}