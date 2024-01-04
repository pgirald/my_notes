import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notes/src/data/repository/repos_factory.dart';
import 'package:my_notes/src/features/notes/src/data/note.dart';
import 'package:my_notes/src/features/notes/src/data/notes.dart';

final notesProvider = FutureProvider.autoDispose
    .family<List<Note>, NotesFilterParams?>(
        (ref, params) => RepoFactory.repo.notes.retrieve(params));
