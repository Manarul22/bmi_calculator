import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../helpers/bmi_calculator.dart';
import '../widgets/bmi_card.dart';
import '../widgets/gender_picker.dart';
import 'bmi_result_page.dart';

class BmiInputPage extends StatefulWidget {
  const BmiInputPage({super.key});

  @override
  State<BmiInputPage> createState() => _BmiInputPageState();
}

class _BmiInputPageState extends State<BmiInputPage> {
  // default height value
  double height = 150;
  // default weight value
  double weight = 50;
  // default age value
  int age = 20;
  // default gender value;
  String gender = 'male';

  // gender male picker
  void maleSelected() {
    setState(() {
      gender = 'male';
    });
  }
  // gender female picker
  void femaleSelected() {
    setState(() {
      gender = 'female';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: labelTextStyle.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // gender picker container
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: GenderPicker(
                      onTap: maleSelected,
                      borderColor: gender == 'male' ? pinkColor : primaryColor,
                      iconGender: Icons.male,
                      labelGender: 'Male',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GenderPicker(
                      onTap: femaleSelected,
                      borderColor: gender == 'female' ? pinkColor : primaryColor,
                      iconGender: Icons.female,
                      labelGender: 'Female',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // height slider container
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BmiCard(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // height label
                      Text(
                        'Height',
                        style: labelTextStyle,
                      ),
                      const SizedBox(height: 4),
                      // height value
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: height.toStringAsFixed(0),
                            style: labelTextStyle.copyWith(
                                fontSize: 50, color: Colors.white),
                          ),
                          TextSpan(
                            text: 'cm',
                            style: labelTextStyle.copyWith(fontSize: 14),
                          ),
                        ]),
                      ),
                      // height slider
                      Slider(
                        value: height,
                        min: 80,
                        max: 200,
                        activeColor: Colors.white,
                        thumbColor: pinkColor,
                        inactiveColor: labelColor,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // input age & weight container
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // weight container
                  Expanded(
                    child: BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toStringAsFixed(0),
                            style: labelTextStyle.copyWith(
                                fontSize: 50, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    backgroundColor: labelColor,
                                  ),
                                  onPressed: () {
                                    if (weight > 2) {
                                      weight--;
                                    }
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    backgroundColor: labelColor,
                                  ),
                                  onPressed: () {
                                    if (weight < 300) {
                                      weight++;
                                    }
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // age container
                  Expanded(
                    child: BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: labelTextStyle,
                          ),
                          Text(
                            '$age',
                            style: labelTextStyle.copyWith(
                                fontSize: 50, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    backgroundColor: labelColor,
                                  ),
                                  onPressed: () {
                                    if (age > 0) {
                                      age--;
                                    }
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    backgroundColor: labelColor,
                                  ),
                                  onPressed: () {
                                    if (age < 150) {
                                      age++;
                                    }
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // button calculate bmi
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: pinkColor,
              ),
              onPressed: () {
                setState(() {
                  // instance class BmiCalculator 
                  final bmiCalculator = BmiCalculator(height: height, weight: weight);
                  bmiCalculator.calculateBMI();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BmiResultPage(
                      bmi: bmiCalculator.bmiResult!,
                    );
                  }));
                });
              },
              child: Text(
                'CALCULATE',
                style:
                    labelTextStyle.copyWith(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
