import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notes/src/features/note_content/src/data/note_content.dart';
import 'package:my_notes/src/features/note_content/src/data/note_content_storage_factory.dart';

final contentProvider = FutureProvider.autoDispose.family<NoteContent, int>(
    (ref, id) => NoteContentStorageFactory.storage.get(id));
