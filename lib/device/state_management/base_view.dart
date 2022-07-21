import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import 'controller.dart';

class BaseView<T extends BaseController> extends StatefulWidget {
  const BaseView({required this.builder, this.onModelReady, Key? key}): super(key: key);

  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final Function(T)? onModelReady;

  @override
  State<StatefulWidget> createState() {
    return _BaseState<T>();
  }
}

class _BaseState<T extends BaseController> extends State<BaseView<T>> {
  T? model;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (model != null) {
        widget.onModelReady?.call(model!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    model = Provider.of<T?>(context);
    return ChangeNotifierProvider.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}