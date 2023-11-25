import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notes/data/repository/content.dart';
import 'package:my_notes/data/repository/repos_factory.dart';

final contentProvider = FutureProvider.autoDispose
    .family<Content, int>((ref, id) => RepoFactory.repo.contents.get(id));
