import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red,
              primary: const Color(0xFF0A0E21),
              //  background: const Color(0xFF0A0E21),
              ),
          scaffoldBackgroundColor: Color(0xFF0A0E21),

      ),

      home: InputPage(),
    );
  }
}

