import 'package:flutter/material.dart';

import 'constants.dart';

extension BuildContextPlus on BuildContext {
  /// Returns a SizedBox with a responsive width.
  SizedBox hSpace(double value) => SizedBox(width: dx(value));

  /// Returns a SizedBox with a responsive height.
  SizedBox vSpace(double value) => SizedBox(height: dy(value));

  /// Returns the amount of the passed value with respect to the design height.
  double dy(double value) =>
      MediaQuery.of(this).size.height * value / designHeight;

  /// Returns the amount of the passed value with respect to the design width.
  double dx(double value) =>
      MediaQuery.of(this).size.width * value / designWidth;
}
//
// extension DateTimePlus on DateTime {
//   String toFullString() => DateFormat("MMMM d, y").format(this);
// }
