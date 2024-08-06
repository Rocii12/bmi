import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

class Resultpage extends StatelessWidget {
  Resultpage({required this.bmiresult,required this.resulttext,required this.interpretation});
  final String bmiresult;
  final String interpretation;
  final String resulttext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(

                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
              'Your Result',

              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
            ),
                )),
            Expanded(
                flex: 5,
                child: Reusable(
                  colour: kcolorcode,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resulttext.toUpperCase(),
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF24D876),
                        ),
                      ),
                      Text(bmiresult,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 100.0),),
                      Text(interpretation,style: TextStyle(fontSize: 22.0),)
                    ],
                  ),
                )),
            GestureDetector(
              onTap: (){

                 Navigator.pop(context);

              },
              child: Container(
                child: Center(child: Text('Re-Calculate',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)),
                color: kbottomcolor,
                margin: const EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kboundarycontainerheight,
                padding: EdgeInsets.only(bottom: 20.0),
              ),
            )
          ],
        ));
  }
}
