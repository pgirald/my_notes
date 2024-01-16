import 'package:my_notes/src/features/notes/src/data/mock_notes_storage.dart';
import 'package:my_notes/src/features/notes/src/data/notes_storage.dart';

class NotesStorageFactory {
  static NotesStorage get storage => MockNotesStorage();
}
