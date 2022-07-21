// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabei_todo_app/app/todo_create/create_todo_controller.dart';
import 'package:manabei_todo_app/app/todo_create/create_todo_widget.dart';
import 'package:manabei_todo_app/data/repositories/data_task_repository.dart';
import 'package:manabei_todo_app/device/navigation/navigation_service.dart';
import 'package:manabei_todo_app/device/widget/button_widget.dart';
import 'package:manabei_todo_app/locator.dart';
import 'package:provider/provider.dart';

void main() {
  setUpLocator();
  testWidgets('Create Task Complete', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => CreateTODOController(locator<DataTaskRepository>()),
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CreateTODOWidget(),
        routes: <String, WidgetBuilder>{
          CreateTODOWidget.routeName: (context) => const CreateTODOWidget()
        },
      ),
    ));
    //Find title and input "Test Title"
    await tester.enterText(find.byKey(const Key('title')), "Test Title");
    await tester.enterText(find.byKey(const Key('content')), "Content Title");

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Content Title'), findsOneWidget);
    await tester.runAsync(() => tester.ensureVisible(find.byType(TaskButton)));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(TaskButton, "Save"), findsOneWidget);
    await tester
        .runAsync(() => tester.tap(find.widgetWithText(TaskButton, "Save")));
    await tester.pump();
  });

  testWidgets('Create Task Incomplete', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (_) => CreateTODOController(locator<DataTaskRepository>()),
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CreateTODOWidget(),
        routes: <String, WidgetBuilder>{
          CreateTODOWidget.routeName: (context) => const CreateTODOWidget()
        },
      ),
    ));
    //Find title and input "Test Title"
    await tester.enterText(find.byKey(const Key('title')), "Test Title");
    await tester.enterText(find.byKey(const Key('content')), "Content Title");
    await tester.tap(find.byKey(const Key("incomplete")));
    await tester.pump();

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Content Title'), findsOneWidget);
    await tester.runAsync(() => tester.ensureVisible(find.byType(TaskButton)));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(TaskButton, "Save"), findsOneWidget);
    await tester
        .runAsync(() => tester.tap(find.widgetWithText(TaskButton, "Save")));
    await tester.pump();
  });
}
