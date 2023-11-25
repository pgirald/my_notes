import 'package:my_notes/data/repository/mock_repository.dart';
import 'package:my_notes/data/repository/repository.dart';

class RepoFactory {
  static Repository get repo => MockRepository();
}
