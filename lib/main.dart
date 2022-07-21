import 'package:flutter/material.dart';
import 'package:manabei_todo_app/app/home/home_widget.dart';
import 'package:manabei_todo_app/app/todo_create/create_todo_widget.dart';
import 'package:manabei_todo_app/device/navigation/navigation_service.dart';
import 'package:manabei_todo_app/locator.dart';
import 'package:provider/provider.dart';

import 'device/provides/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.data,
      child: _taskView(),
    );
  }

  Widget _taskView() => MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeWidget(),
        routes: <String, WidgetBuilder>{
          HomeWidget.routeName: (context) => const HomeWidget(),
          CreateTODOWidget.routeName: (context) => const CreateTODOWidget()
        },
      );
}
