import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../helpers/bmi_calculator.dart';
import '../widgets/bmi_card.dart';

class BmiResultPage extends StatelessWidget {
  const BmiResultPage({super.key, required this.bmi});

  final double bmi;

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    final bmiCategoryResult = bmiCalculator.getBmiCategory();
    final bmiDescResult = bmiCalculator.getBmiDesc();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: labelTextStyle.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            // text 'Your Result'
            Expanded(
              child: Text(
                'Your Result',
                style: labelTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // BMI Result text
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BmiCard(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('$bmiCategoryResult'.toUpperCase(), style: labelTextStyle.copyWith(fontSize: 20, color: bmiCalculator.getTextColor()),),
                        Text(
                          bmi.toStringAsFixed(1),
                          style: labelTextStyle.copyWith(color: Colors.white, fontSize: 80),
                        ),
                        Text(bmiDescResult, textAlign: TextAlign.center, style: labelTextStyle,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Button Re-calculate
            Expanded(
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pinkColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'RE-CALCULATE',
                    style:
                        labelTextStyle.copyWith(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
