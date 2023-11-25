import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notes/data/repository/note.dart';
import 'package:my_notes/data/repository/notes.dart';
import 'package:my_notes/data/repository/repos_factory.dart';

final notesProvider = FutureProvider.autoDispose
    .family<List<Note>, NotesFilterParams?>(
        (ref, params) => RepoFactory.repo.notes.retrieve(params));
