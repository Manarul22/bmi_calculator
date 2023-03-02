import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'bmi_card.dart';

class GenderPicker extends StatelessWidget {
  const GenderPicker({
    Key? key,
    required this.iconGender,
    required this.labelGender, required this.onTap, this.borderColor = primaryColor,
  }) : super(key: key);

  final IconData iconGender;
  final String labelGender;
  final Function()? onTap;
  final Color borderColor;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BmiCard(
        border: Border.all(color: borderColor, width: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconGender,
              color: Colors.white,
              size: 80,
            ),
            Text(
              labelGender,
              style: labelTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
