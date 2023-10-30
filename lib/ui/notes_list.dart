import 'package:flutter/material.dart';
import 'package:my_notes/data/notes.dart';
import 'package:my_notes/data/repos_factory.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    Notes notes = ReposFactory.notes;
    return ListView(
        children: notes
            .retrieve()
            .map((note) => ListTile(
                    title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(note.title),
                    Text(
                      "${note.modificationDate.day}/${note.modificationDate.month}/${note.modificationDate.year}",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 138, 137, 135)),
                    )
                  ],
                )))
            .toList());
  }
}
