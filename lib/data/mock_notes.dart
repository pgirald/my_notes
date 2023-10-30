import 'package:my_notes/data/note.dart';
import 'package:my_notes/data/notes.dart';

class MockNotes extends Notes {
  @override
  retrieve() => [
        Note(id: 0, title: "ullamcorper", modificationDate: DateTime(2023, 04, 21)),
        Note(id: 1, title: "duis", modificationDate: DateTime(2023, 02, 22)),
        Note(id: 2, title: "ultrices", modificationDate: DateTime(2022, 12, 30)),
        Note(id: 3, title: "at", modificationDate: DateTime(2022, 12, 31)),
        Note(id: 4, title: "mus", modificationDate: DateTime(2022, 10, 27)),
        Note(id: 5, title: "luctus", modificationDate: DateTime(2022, 12, 09)),
        Note(id: 6, title: "ultrices", modificationDate: DateTime(2023, 04, 03)),
        Note(id: 7, title: "sociis", modificationDate: DateTime(2022, 11, 21)),
        Note(id: 8, title: "convallis", modificationDate: DateTime(2023, 01, 19)),
        Note(id: 9, title: "vel", modificationDate: DateTime(2023, 06, 29)),
        Note(id: 10, title: "nulla", modificationDate: DateTime(2023, 04, 17)),
        Note(id: 11, title: "volutpat", modificationDate: DateTime(2023, 03, 31)),
        Note(id: 12, title: "adipiscing", modificationDate: DateTime(2023, 02, 18)),
        Note(id: 13, title: "ipsum", modificationDate: DateTime(2023, 08, 31)),
        Note(id: 14, title: "potenti", modificationDate: DateTime(2023, 02, 11)),
        Note(id: 15, title: "ac", modificationDate: DateTime(2023, 10, 02)),
        Note(id: 16, title: "proin", modificationDate: DateTime(2022, 10, 26)),
        Note(id: 17, title: "augue", modificationDate: DateTime(2023, 07, 04)),
        Note(id: 18, title: "dapibus", modificationDate: DateTime(2023, 07, 24)),
        Note(id: 19, title: "eu", modificationDate: DateTime(2023, 04, 04)),
      ];
}
