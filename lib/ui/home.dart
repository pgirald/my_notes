import 'package:flutter/material.dart';
import 'package:my_notes/data/repository/notes.dart';
import 'package:my_notes/ui/bar_tools.dart';
import 'package:my_notes/ui/notes_list.dart';

class MyNotes extends StatelessWidget {
  const MyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotesFilterParams? _params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BarTools(onParamsChanged: _setFilterParams),
      ),
      body: Center(child: NotesList(params: _params)),
    );
  }

  _setFilterParams(NotesFilterParams? params) {
    setState(() {
      _params = params;
    });
  }
}
