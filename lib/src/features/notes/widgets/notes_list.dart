import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notes/src/features/notes/src/providers/notes_provider.dart';
import 'package:my_notes/src/features/notes/src/data/note.dart';
import 'package:my_notes/src/features/notes/src/data/notes_storage.dart';
import 'package:my_notes/utils/riverpod/content_wraper.dart';

class NotesList extends ConsumerStatefulWidget {
  final NotesFilterParams? params;

  const NotesList({super.key, this.params});

  @override
  ConsumerState<NotesList> createState() => _NotesListState();
}

class _NotesListState extends ConsumerState<NotesList> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Note>> notesContent =
        ref.watch(notesProvider(widget.params));
    return ContentWraper(
        content: notesContent,
        builder: (context, notes) {
          return ListView(
              children: notes
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
        });
  }
}
