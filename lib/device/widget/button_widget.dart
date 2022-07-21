import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import '../constants/text_style_constant.dart';
import '../utils/context_utils.dart';

class TaskButton extends StatelessWidget {
  final bool isDisable;
  final Widget? child;
  final String? text;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final bool? isError;
  final Color? bgColor;

  const TaskButton(
      {this.child,
      this.isDisable = false,
      this.text,
      this.onPressed,
      this.height,
      this.width,
      this.isError,
      this.bgColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 45,
      child: ElevatedButton(
        onPressed: isDisable
            ? null
            : () {
                ContextUtils.hideKeyboard(context);
                onPressed?.call();
              },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                isDisable ? ColorConstant.grey : ColorConstant.blue)),
        child: child ??
            Text(
              text ?? "",
              style: isDisable
                  ? TextStyleConstant.textMediumBoldWhite
                  : TextStyleConstant.textAvgBold,
            ),
      ),
    );
  }
}
