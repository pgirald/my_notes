// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_notes/src/features/notes/widgets/notes_list.dart';

void main() {
  testWidgets('Check if element named "proin" is in the list',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: NotesList(),
      ),
    ));

    var proinFinder = find.text("proin");
    var listFinder = find.byType(Scrollable);

    await tester.scrollUntilVisible(proinFinder, 500.0, scrollable: listFinder);

    // Verify that our counter starts at 0.
    expect(proinFinder, findsOneWidget);
  });
}
