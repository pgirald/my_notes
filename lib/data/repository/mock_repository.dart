
import 'package:my_notes/data/repository/contents.dart';
import 'package:my_notes/data/repository/mock_contents.dart';
import 'package:my_notes/data/repository/mock_notes.dart';
import 'package:my_notes/data/repository/notes.dart';
import 'package:my_notes/data/repository/repository.dart';

class MockRepository implements Repository {
  static const Duration delay = Duration(seconds: 2 );

  @override
  Contents get contents => MockContents();

  @override
  Notes get notes => MockNotes();
}
