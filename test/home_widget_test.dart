// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabei_todo_app/app/home/home_controller.dart';
import 'package:manabei_todo_app/app/home/home_widget.dart';
import 'package:manabei_todo_app/app/todo_complete/todo_complete_controller.dart';
import 'package:manabei_todo_app/app/todo_incomplete/todo_incomplete_controller.dart';
import 'package:manabei_todo_app/data/repositories/data_task_repository.dart';
import 'package:manabei_todo_app/device/navigation/navigation_service.dart';
import 'package:manabei_todo_app/locator.dart';
import 'package:provider/provider.dart';

void main() {
  setUpLocator();
  testWidgets('Check Home widget no data', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => HomeController(locator<DataTaskRepository>())),
        ChangeNotifierProvider(
            create: (_) =>
                TODOCompleteController(locator<DataTaskRepository>())),
        ChangeNotifierProvider(
            create: (_) =>
                TODOInCompleteController(locator<DataTaskRepository>())),
      ],
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeWidget(),
        routes: <String, WidgetBuilder>{
          HomeWidget.routeName: (context) => const HomeWidget()
        },
      ),
    ));
    await tester.pumpAndSettle();
    final itemFinder = find.text("Test Title");
    expect(itemFinder, findsNothing);
    // Swipe to tab complete
    await tester.drag(find.byType(PageView), const Offset(0, 500.0),
        warnIfMissed: true);
    await tester.pump();
    expect(find.text("Test Title"), findsNothing);
  });
}
