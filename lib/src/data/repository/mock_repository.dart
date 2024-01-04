import 'package:my_notes/src/data/repository/contents.dart';
import 'package:my_notes/src/data/repository/mock_contents.dart';
import 'package:my_notes/src/data/repository/repository.dart';
import 'package:my_notes/src/features/notes/src/data/mock_notes.dart';
import 'package:my_notes/src/features/notes/src/data/notes.dart';

class MockRepository implements Repository {
  static const Duration delay = Duration(seconds: 2);

  @override
  Contents get contents => MockContents();

  @override
  Notes get notes => MockNotes();
}
