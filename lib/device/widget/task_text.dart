import 'package:flutter/material.dart';

class TaskText extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TaskText(this.text, {this.onTap, this.textAlign, this.style, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}