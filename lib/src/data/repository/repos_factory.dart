import 'package:my_notes/src/data/repository/mock_repository.dart';
import 'package:my_notes/src/data/repository/repository.dart';

class RepoFactory {
  static Repository get repo => MockRepository();
}
