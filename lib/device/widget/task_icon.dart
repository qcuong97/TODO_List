import 'package:flutter/material.dart';

class TaskIcon extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onTap;
  final String? asset;
  final double size;
  final Color? color;
  final bool? isHide;

  const TaskIcon({this.icon, this.asset, this.onTap, this.size = 20, this.color, this.isHide, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isHide != true,
      child: InkWell(
        onTap: () => onTap?.call(),
        child: icon != null
            ? Icon(
                icon,
                size: size,
                color: color,
              )
            : Image.asset(
                asset ?? '',
                width: size,
                height: size,
                color: color,
              ),
      ),
    );
  }
}
