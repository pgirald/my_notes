import 'package:my_notes/data/repository/contents.dart';
import 'package:my_notes/data/repository/notes.dart';

abstract class Repository {

  Notes get notes;

  Contents get contents;
}
