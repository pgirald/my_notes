import 'package:my_notes/src/data/repository/content.dart';

abstract class Contents {
  Future<Content> get(int id);
}
