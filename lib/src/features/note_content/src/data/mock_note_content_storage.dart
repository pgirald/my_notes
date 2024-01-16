
import 'package:my_notes/src/features/note_content/src/data/note_content.dart';
import 'package:my_notes/src/features/note_content/src/data/note_content_storage.dart';

class MockNoteContentStorage implements NoteContentStorage {
  @override
  Future<NoteContent> get(int id) async {
    Future.delayed(const Duration(seconds: 1));
    return _contents[id];
  }
}

List<NoteContent> _contents = [
  NoteContent(id: 0, text: "risus dapibus augue vel accumsan"),
  NoteContent(
      id: 1,
      text:
          "tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh"),
  NoteContent(id: 2, text: "leo pellentesque ultrices mattis odio"),
  NoteContent(
      id: 3,
      text:
          "odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie"),
  NoteContent(
      id: 4,
      text:
          "in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna"),
  NoteContent(
      id: 5,
      text: "hac habitasse platea dictumst etiam faucibus cursus urna ut"),
  NoteContent(
      id: 6,
      text:
          "ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam"),
  NoteContent(id: 7, text: "eget vulputate ut ultrices vel augue vestibulum ante"),
  NoteContent(
      id: 8,
      text:
          "ligula sit amet eleifend pede libero quis orci nullam molestie nibh"),
  NoteContent(
      id: 9,
      text:
          "sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed"),
  NoteContent(id: 10, text: "arcu adipiscing molestie hendrerit at"),
  NoteContent(
      id: 11,
      text:
          "fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc"),
  NoteContent(id: 12, text: "sit amet eleifend pede libero quis orci nullam"),
  NoteContent(id: 13, text: "nisl nunc rhoncus dui vel sem"),
  NoteContent(
      id: 14, text: "amet nunc viverra dapibus nulla suscipit ligula in lacus"),
  NoteContent(
      id: 15,
      text:
          "nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in"),
  NoteContent(id: 16, text: "nibh in quis justo maecenas rhoncus aliquam"),
  NoteContent(
      id: 17,
      text:
          "commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non"),
  NoteContent(
      id: 18,
      text:
          "at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia"),
  NoteContent(
      id: 19, text: "ut erat curabitur gravida nisi at nibh in hac habitasse"),
];
