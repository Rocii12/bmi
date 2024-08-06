import 'dart:math';
class Calculatorbrain
{
  Calculatorbrain({this.height,this.weight});
  final height;
  final weight;
    late double  bmi;


  String calculatebmi()
  {

     bmi=weight/(pow(height/100, 2));
    return bmi.toStringAsFixed(1);
  }
  String getresult()
  {
    if( bmi>=25){
      return 'Overweight';
    }
    else if(bmi>18.5)
      {
        return 'Normal';
      }
    else{
      return 'Underweight';}
  }
  String interpretation()
  {
    if(bmi>=25){
      return 'You have a higher than normal body weight. Try to exercise more.';
    }
    else if(bmi>18.5)
    {
      return 'You have a normal body weight. Good job! .';
    }
    else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

}