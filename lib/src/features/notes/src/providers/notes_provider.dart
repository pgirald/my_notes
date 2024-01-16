import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notes/src/features/notes/src/data/note.dart';
import 'package:my_notes/src/features/notes/src/data/notes_storage.dart';
import 'package:my_notes/src/features/notes/src/data/notes_storage_factory.dart';

final notesProvider = FutureProvider.autoDispose
    .family<List<Note>, NotesFilterParams?>(
        (ref, params) => NotesStorageFactory.storage.retrieve(params));
