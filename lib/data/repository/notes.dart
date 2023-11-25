import 'package:my_notes/data/repository/note.dart';

typedef NotesFilterParams = ({
  String title,
  DateTime? lowerDate,
  DateTime? upperDate
});

abstract class Notes {
  Future<List<Note>> retrieve([NotesFilterParams? params]);
}
