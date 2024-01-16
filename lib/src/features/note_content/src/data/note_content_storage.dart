import 'package:my_notes/src/features/note_content/src/data/note_content.dart';

abstract class NoteContentStorage {
  Future<NoteContent> get(int id);
}
