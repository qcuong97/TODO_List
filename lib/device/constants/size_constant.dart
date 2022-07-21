import 'package:flutter/material.dart';

class SizeConstant {
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14;
  static const double fontSizeAvg = 16.0;
  static const double fontSizeLarge = 20;
  static const double fontSizeScreenTitle = 18.0;
  static BorderRadius borderRadius = BorderRadius.circular(20);

  static EdgeInsets screenMargin = const EdgeInsets.all(16);
  static EdgeInsets pagePadding = const EdgeInsets.symmetric(horizontal: 16);

  static EdgeInsets symmetricHorizontal(double value) {
    return EdgeInsets.symmetric(horizontal: value);
  }

  static EdgeInsets symmetricVertical(double value) {
    return EdgeInsets.symmetric(vertical: value);
  }
}
