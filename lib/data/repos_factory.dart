import 'package:my_notes/data/contents.dart';
import 'package:my_notes/data/mock_contents.dart';
import 'package:my_notes/data/mock_notes.dart';
import 'package:my_notes/data/notes.dart';

class ReposFactory{
  static Notes get notes => MockNotes();

  static Contents get contents => MockContents();
}