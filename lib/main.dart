import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/constants.dart';
import 'pages/bmi_input_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// ENFORCE DEVICE ORIENTATION PORTRAIT ONLY
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        appBarTheme: const AppBarTheme(backgroundColor: bgColor),
      ),
      
      title: 'BMI Calculator',
      home: const BmiInputPage(),
    );
  }
}

