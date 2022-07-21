import 'package:flutter/material.dart';
import 'package:manabei_todo_app/device/widget/task_icon.dart';

import '../constants/color_constant.dart';

class TaskScaffold extends StatelessWidget {
  final Widget body;
  final Color? bgAppbar;
  final List<Widget>? action;
  final Widget? title;
  final bool centerTitle;
  final Widget? bottomNavigationBar;
  final bool isBack;
  final bool isNoAppBar;
  final Widget? floatingActionButton;

  const TaskScaffold(
      {required this.body,
      this.centerTitle = false,
      this.title,
      this.bgAppbar,
      this.action,
      this.bottomNavigationBar,
      this.isBack = true,
      this.isNoAppBar = false,
      this.floatingActionButton,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: isNoAppBar == true
            ? null
            : AppBar(
                systemOverlayStyle:
                    Theme.of(context).appBarTheme.systemOverlayStyle,
                title: title,
                centerTitle: centerTitle,
                backgroundColor:
                    bgAppbar ?? Theme.of(context).appBarTheme.backgroundColor,
                actions: action,
                automaticallyImplyLeading: isBack,
              ),
        bottomNavigationBar: bottomNavigationBar,
        body: body,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
