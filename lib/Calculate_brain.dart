import 'dart:math';
import './results_page.dart';



class CalculateBrain{

  CalculateBrain({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;


  String calculateBMI(){
    _bmi = weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);


  }

  String returnResult(){

    if(_bmi >= 25){
      return 'Overweight';
    }
    else if(_bmi > 18.5){
      return 'Normal';

    }
    else{
      return 'Underweight';
    }

  }
  String returnMessage(){
    if(_bmi >= 25){
      return 'You are overweight. You need to exercise!';
    }
    else if(_bmi> 18.5 && _bmi < 25){
      return 'You are normal. Keep it up!';

    }
    else{
      return 'you are underweight. You need to eat and exercise more!';
    }


  }


}