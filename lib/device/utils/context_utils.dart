import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../locator.dart';
import '../constants/color_constant.dart';
import '../constants/text_style_constant.dart';
import '../navigation/navigation_service.dart';
import '../widget/button_widget.dart';

class ContextUtils {
  static final ContextUtils _instance = ContextUtils._internal();

  static ContextUtils get ins => _instance;

  ContextUtils._internal();

  bool _isLoading = false;

  BuildContext get context =>
      locator.get<NavigationService>().navigatorKey.currentContext!;

  ThemeData get theme =>
      Theme.of(locator.get<NavigationService>().navigatorKey.currentContext!);

  static hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      try {
        currentFocus.focusedChild?.unfocus();
      } catch (_) {}
    }
  }

  showMessage(String message, {Function? onOke, Function? onCancel}) {
    var context = locator.get<NavigationService>().navigatorKey.currentContext;
    if (context != null) {
      showDialog(
          context: context,
          barrierDismissible: false,
          useRootNavigator: false,
          builder: (context) => AlertDialog(
                key: const Key("message_dialog"),
                content: Text(
                  message,
                  style: TextStyleConstant.h1,
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TaskButton(
                    text: "Oke",
                    onPressed: () {
                      Navigator.pop(context);
                      onOke?.call();
                    },
                  ),
                  onCancel != null
                      ? Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: TaskButton(
                            text: "Close",
                            bgColor: ColorConstant.black,
                            onPressed: () {
                              Navigator.pop(context);
                              onCancel.call();
                            },
                          ),
                        )
                      : Container()
                ],
              ));
    }
  }

  showLoading() {
    var context = locator.get<NavigationService>().navigatorKey.currentContext;
    if (context != null) {
      _isLoading = true;
      showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.transparent,
          builder: (context) => WillPopScope(
                onWillPop: () async => false,
                child: Container(
                  color: ColorConstant.greyAlpha10,
                  height: double.infinity,
                  child: const SpinKitWave(
                    color: ColorConstant.blue,
                  ),
                ),
              ));
      Future.delayed(const Duration(seconds: 60), () {
        if (_isLoading) {
          hideLoading();
        }
      });
    }
  }

  hideLoading() {
    _isLoading = false;
    locator.get<NavigationService>().pop();
  }
}
