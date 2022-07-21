import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabei_todo_app/device/widget/task_text.dart';
import 'package:manabei_todo_app/main.dart' as app;

void main() {
  testWidgets('Test integration app', (WidgetTester tester) async {
    app.main();
    await tester.pump();
    await tester.pumpAndSettle();

    //Into create task screen
    await tester.tap(find.widgetWithIcon(FloatingActionButton, Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('title')), "Test Title");
    await tester.enterText(find.byKey(const Key('content')), "Content Title");
    await tester.pageBack();
    await tester.pump();
    await tester.pumpAndSettle();

    //Tap to complete screen
    await tester.tap(find.widgetWithText(TaskText, "Complete"));
    await tester.pumpAndSettle();
    expect(find.text("TODO List - Complete"), findsOneWidget);

    //tap back to imcomplete screen
    await tester.tap(find.widgetWithText(TaskText, "Incomplete"));
    await tester.pumpAndSettle();
    expect(find.text("TODO List - Incomplete"), findsOneWidget);

  });
}
