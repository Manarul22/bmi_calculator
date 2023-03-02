import 'package:flutter/material.dart';

import '../constants/constants.dart';

class BmiCard extends StatelessWidget {
  const BmiCard({super.key, this.child, this.border});
  final Widget? child;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
        border: border,
      ),
      child: child,
    );
  }
}
