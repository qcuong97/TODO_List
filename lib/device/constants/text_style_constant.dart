import 'package:flutter/material.dart';
import 'package:manabei_todo_app/device/constants/size_constant.dart';

import 'color_constant.dart';

class TextStyleConstant {
  static TextStyle h1 = const TextStyle(
      fontSize: SizeConstant.fontSizeLarge, fontWeight: FontWeight.bold);
  static TextStyle h2 = const TextStyle(
      fontSize: SizeConstant.fontSizeAvg, fontWeight: FontWeight.bold);
  static TextStyle sectionHeader = const TextStyle(
      fontSize: SizeConstant.fontSizeLarge, fontWeight: FontWeight.bold);

  static TextStyle textAvg = const TextStyle(
    fontSize: SizeConstant.fontSizeAvg,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textSmall = const TextStyle(
      fontSize: SizeConstant.fontSizeSmall,
      fontWeight: FontWeight.normal,
      color: ColorConstant.white);

  static TextStyle textAvgBold = const TextStyle(
    fontSize: SizeConstant.fontSizeAvg,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textGreySmall = const TextStyle(
      fontSize: SizeConstant.fontSizeSmall,
      fontWeight: FontWeight.normal,
      color: ColorConstant.grey);

  static TextStyle textGreenSmall = const TextStyle(
      fontSize: SizeConstant.fontSizeSmall,
      fontWeight: FontWeight.normal,
      color: ColorConstant.green);

  static TextStyle textBlueSmall = const TextStyle(
      fontSize: SizeConstant.fontSizeSmall,
      fontWeight: FontWeight.normal,
      color: ColorConstant.blue);

  static TextStyle textOrangeSmall = const TextStyle(
      fontSize: SizeConstant.fontSizeMedium,
      fontWeight: FontWeight.normal,
      color: ColorConstant.blue);

  static TextStyle textBlueMedium = const TextStyle(
      fontSize: SizeConstant.fontSizeMedium,
      fontWeight: FontWeight.normal,
      color: ColorConstant.blue);

  static TextStyle textGreyMedium = const TextStyle(
      fontSize: SizeConstant.fontSizeMedium,
      fontWeight: FontWeight.normal,
      color: ColorConstant.grey);

  static TextStyle textPurpleMedium = const TextStyle(
      fontSize: SizeConstant.fontSizeMedium,
      fontWeight: FontWeight.normal,
      color: ColorConstant.purple);

  static TextStyle textLarge = const TextStyle(
      fontSize: SizeConstant.fontSizeLarge, fontWeight: FontWeight.normal);

  static TextStyle textLargeBold = const TextStyle(
      fontSize: SizeConstant.fontSizeLarge, fontWeight: FontWeight.bold);

  static TextStyle textLargeBlue = const TextStyle(
      color: ColorConstant.blue,
      fontSize: SizeConstant.fontSizeLarge,
      fontWeight: FontWeight.normal);

  static TextStyle textMediumWhite = const TextStyle(
      fontSize: SizeConstant.fontSizeMedium,
      fontWeight: FontWeight.normal,
      color: ColorConstant.white);

  static TextStyle textMediumBoldWhite = const TextStyle(
      fontSize: SizeConstant.fontSizeMedium,
      fontWeight: FontWeight.bold,
      color: ColorConstant.white);
}
