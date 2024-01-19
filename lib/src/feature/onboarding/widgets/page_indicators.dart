import 'package:flutter/material.dart';

import '../model/onboarding_model.dart';

List<Widget> pageIndicators(int value, BuildContext context) {
  List<Container> _indicators = [];

  for (int i = 0; i < onboardingList.length; i++) {
    _indicators.add(
      Container(
        width: 7,
        height: 7,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: i == value ? Colors.white : Colors.grey,
          borderRadius: i == value
              ? BorderRadius.circular(50)
              : BorderRadius.circular(25),
        ),
      ),
    );
  }
  return _indicators;
}
