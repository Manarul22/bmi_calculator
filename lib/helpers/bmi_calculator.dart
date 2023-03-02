import 'package:flutter/material.dart';

import '../constants/constants.dart';

class BmiCalculator {
  double? height;
  double? weight;
  double? bmiResult;
  String? bmiCategory;
  String? bmiDesc;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmiResult);

  // calculate bmi
  calculateBMI() {
    bmiResult = weight! / ((height! * height!) / 10000);
    return bmiResult;
  }

  // bmi category
  getBmiCategory() {
    String category = '';
    if (bmiResult! < 16.0) {
      category = underweightServere;
    } else if (bmiResult! < 17.0) {
      category = underweightModerate;
    } else if (bmiResult! < 18.5) {
      category = underweightMild;
    } else if (bmiResult! < 25) {
      category = normal;
    } else if (bmiResult! < 30) {
      category = overweight;
    } else if (bmiResult! < 35) {
      category = obese1;
    } else if (bmiResult! < 40) {
      category = obese2;
    } else if (bmiResult! >= 40) {
      category = obese3;
    }

    bmiCategory = category;
    return bmiCategory;
  }

  // bmi desc
  getBmiDesc() {
    String desc = '';
    switch(bmiCategory) {
      case underweightServere:
      case underweightModerate:
      case underweightMild:
        desc = underweightDesc;
        break;
      case normal:
        desc = normalDesc;
        break;
      case overweight:
        desc = overweightDesc;
        break;
      case obese1:
      case obese2:
      case obese3:
        desc = obeseDesc;
        break;
      default:
    }
    bmiDesc = desc;
    return bmiDesc;
  }

  // bmi category textcolor
  getTextColor() {
    if (bmiResult! < 17.0) {
      return Colors.red;
    } else if (bmiResult! < 18.5) {
      return Colors.orange;
    } else if (bmiResult! < 25) {
      return Colors.green;
    } else if (bmiResult! < 30) {
      return Colors.orange;
    } else if (bmiResult! >= 35) {
      return Colors.red;
    } 
  }


}
