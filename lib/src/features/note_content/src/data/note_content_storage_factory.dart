import 'package:my_notes/src/features/note_content/src/data/mock_note_content_storage.dart';
import 'package:my_notes/src/features/note_content/src/data/note_content_storage.dart';

class NoteContentStorageFactory {
  static NoteContentStorage get storage => MockNoteContentStorage();
}
