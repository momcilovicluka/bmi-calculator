import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _bmiResultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            style: TextStyle(
              color: accentColor,
              fontWeight: FontWeight.w300,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.7,
            child: FittedBox(
              fit: BoxFit.contain,
              clipBehavior: Clip.hardEdge,
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: const TextStyle(fontSize: 400, color: accentColor),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.35,
            child: FittedBox(
              fit: BoxFit.contain,
              clipBehavior: Clip.hardEdge,
              child: Visibility(
                // visible: _bmiResultText.isNotEmpty,
                visible: true,
                child: Text(
                  _bmiResultText,
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: accentColor),
                ),
              ),
            ),
          ),
          LeftBar(barWidth: MediaQuery.of(context).size.width * 0.1),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          LeftBar(barWidth: MediaQuery.of(context).size.width * 0.2),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          LeftBar(barWidth: MediaQuery.of(context).size.width * 0.1),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          RightBar(barWidth: MediaQuery.of(context).size.width * 0.15),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          RightBar(barWidth: MediaQuery.of(context).size.width * 0.15),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    
                    width: MediaQuery.of(context).size.height * 0.25,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _heightController,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        color: accentColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height (cm)",
                        hintStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.height * 0.25,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _weightController,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        color: accentColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight (kg)",
                        hintStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: accentColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          
          ElevatedButton(
            child: const Text(
              "Calculate",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: backgroundColor),
            ),
            onPressed: () {
              double h = double.parse(_heightController.text) / 100;
              double w = double.parse(_weightController.text);
              setState(() {
                _bmiResult = w / (h * h);
                _bmiResultText = _bmiResult.toStringAsFixed(2);
                if (_bmiResult < 18.5) {
                  _bmiResultText = 'Underweight';
                } else if (_bmiResult >= 18.5 && _bmiResult < 25) {
                  _bmiResultText = 'Normal';
                } else if (_bmiResult >= 25 && _bmiResult < 30) {
                  _bmiResultText = 'Overweight';
                } else if (_bmiResult >= 30 && _bmiResult < 35) {
                  _bmiResultText = 'Obese';
                } else {
                  _bmiResultText = 'Extremely Obese';
                }
              });
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        ])
      )
    );
  }
}
