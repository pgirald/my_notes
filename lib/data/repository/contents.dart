import 'package:my_notes/data/repository/content.dart';

abstract class Contents {
  Future<Content> get(int id);
}
