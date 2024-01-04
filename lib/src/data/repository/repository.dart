import 'package:my_notes/src/data/repository/contents.dart';
import 'package:my_notes/src/features/notes/src/data/notes.dart';

abstract class Repository {

  Notes get notes;

  Contents get contents;
}
