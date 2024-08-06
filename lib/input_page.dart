

import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';
enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
    Gender ? selectedGender;
    int height=180;
    int weight=50;
    int age=19;
  // Color malecardcolor=inactivecode;
  // Color femalecardcolor=inactivecode;
  // void updatecolor(Gender selectedgender)
  // {
  //   if(selectedgender==Gender.male)
  //     {
  //       if(malecardcolor==inactivecode)
  //         {
  //           malecardcolor=colorcode;
  //           femalecardcolor=inactivecode;
  //         }
  //       else
  //         {
  //           malecardcolor=inactivecode;
  //         }
  //     }
  //   else if(selectedgender==Gender.female)
  //     {
  //       if(femalecardcolor==inactivecode)
  //         {
  //           femalecardcolor=colorcode;
  //           malecardcolor=inactivecode;
  //         }
  //       else
  //         {
  //           femalecardcolor=inactivecode;
  //         }
  //     }
  //}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: const Color(0xFF0A0E21),
        appBar: AppBar(
          title:  const Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                   onTap: ()
                    {
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },

                    child: Reusable(


                      colour: selectedGender==Gender.male?kcolorcode:kinactivecode,
                      cardchild: iconf(wid: FontAwesomeIcons.mars,writetext: 'MALE',),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    child: Reusable(colour: selectedGender==Gender.female?kcolorcode:kinactivecode,cardchild: iconf(wid: FontAwesomeIcons.venus,writetext: 'FEMALE',),

                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: Reusable(colour: kcolorcode,cardchild: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                const Text('HEIGHT',
                style: klabeltextstyle,),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: [
                     Text(height.toString(),style: knumbers,),
                    const Text('cm',style: klabeltextstyle,),

                  ],),SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(value: height.toDouble(),min: 120.0,max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D898),
                        onChanged: (double newvalue)
                        {
                          setState(() {
                            height=newvalue.round();
                          });
                        }),
                  )


              ],),),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Reusable(colour: kcolorcode,cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',style: klabeltextstyle,),
                      Text(weight.toString(),style: knumbers,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Roundbutton(
                             icon: FontAwesomeIcons.plus,
                             onpressed:() {
                               setState(() {
                                 weight++;

                               });


                             },
                           ),
                            SizedBox(width: 10.0,),
                            Roundbutton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: ()
                              {
                                setState(() {
                                  weight--;
                                });

                              },
                            ),
                          ],
                        )
                    ],
                  ),

                  ),
                ),
               Expanded(
                  child: Reusable(colour: kcolorcode,cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('AGE',style: klabeltextstyle,
                    ),
                      Text(age.toString(),style: knumbers,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Roundbutton(icon: FontAwesomeIcons.plus,onpressed: (){
                            setState(() {
                              age++;
                            });
                          }),
                          SizedBox(width: 10.0,),
                          Roundbutton(icon: FontAwesomeIcons.minus,onpressed: (){
                            setState(() {
                              age--;
                            });
                          })
                        ],
                      )

                  ],),)

                )
              ],
            )),
            GestureDetector(
              onTap: (){
                setState(() {
                  Calculatorbrain calc=Calculatorbrain(height: height,weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Resultpage(
                    bmiresult: calc.calculatebmi(),
                    resulttext: calc.getresult(),
                    interpretation: calc.interpretation(),
                  )));
                });
              },
              child: Container(
                child: Center(child: Text('Calculate',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)),
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

class iconf extends StatelessWidget {
 iconf({ this.wid,this.writetext});
 final IconData ?wid;
 final String ? writetext;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  <Widget> [
        Icon(
          wid,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          writetext!,
          style: klabeltextstyle,
        )
      ],
    );
  }
}

class Reusable extends StatelessWidget {
   Reusable( {required this.colour, this.cardchild});
  final Color colour;
  final Widget ? cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
class Roundbutton extends StatelessWidget {
  Roundbutton({this.icon,required this.onpressed});
  final IconData ?icon;
  final VoidCallback  onpressed;
  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(onPressed:onpressed,
      child: Icon(icon),
      elevation: 6.0,
      constraints:const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),shape: CircleBorder(),
    fillColor: Color(0xFF4C4F5E),);
  }
}
