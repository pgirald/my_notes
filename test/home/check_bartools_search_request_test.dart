import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart' as test;
import 'package:my_notes/data/repository/notes.dart';
import 'package:my_notes/ui/bar_tools.dart';
import 'package:my_notes/ui/notes_list.dart';

void main() {
  testWidgets('Check if onTestRequested triggers succesfully',
      (WidgetTester tester) async {
    const searchTerm = "Some term";
    NotesFilterParams? filterParams;

    assignSearchTerm(BuildContext context, NotesFilterParams? params) async {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(params.toString()),
              ));
    }

    // Build our app and trigger a frame.
    await tester.pumpWidget(Builder(builder: (context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              title: BarTools(
            onFilterRequested: (params) => assignSearchTerm(context, params),
          )),
        ),
      );
    }));

    var titleInputFinder = find.byType(TextField);
    var searchButtonFinder = find.byKey(const Key("searchButton"));

    await Future.delayed(const Duration(seconds: 3));
    await tester.enterText(titleInputFinder, searchTerm);
    await Future.delayed(const Duration(seconds: 3));
    await tester.press(searchButtonFinder);
    await Future.delayed(const Duration(seconds: 3));
    await tester.pump();
    //expect(filterParams, (lowerDate: null, upperDate: null, title: "dd"));
  });
}
