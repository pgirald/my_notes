import 'package:my_notes/src/features/notes/src/data/note.dart';

typedef NotesFilterParams = ({
  String title,
  DateTime? lowerDate,
  DateTime? upperDate
});

abstract class NotesStorage {
  Future<List<Note>> retrieve([NotesFilterParams? params]);
}
