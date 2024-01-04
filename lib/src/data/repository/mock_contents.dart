import 'package:my_notes/src/data/repository/content.dart';
import 'package:my_notes/src/data/repository/contents.dart';
import 'package:my_notes/src/data/repository/mock_repository.dart';

class MockContents implements Contents {
  @override
  Future<Content> get(int id) async {
    Future.delayed(MockRepository.delay);
    return _contents[id];
  }
}

List<Content> _contents = [
  Content(id: 0, text: "risus dapibus augue vel accumsan"),
  Content(
      id: 1,
      text:
          "tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh"),
  Content(id: 2, text: "leo pellentesque ultrices mattis odio"),
  Content(
      id: 3,
      text:
          "odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie"),
  Content(
      id: 4,
      text:
          "in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna"),
  Content(
      id: 5,
      text: "hac habitasse platea dictumst etiam faucibus cursus urna ut"),
  Content(
      id: 6,
      text:
          "ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam"),
  Content(id: 7, text: "eget vulputate ut ultrices vel augue vestibulum ante"),
  Content(
      id: 8,
      text:
          "ligula sit amet eleifend pede libero quis orci nullam molestie nibh"),
  Content(
      id: 9,
      text:
          "sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed"),
  Content(id: 10, text: "arcu adipiscing molestie hendrerit at"),
  Content(
      id: 11,
      text:
          "fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc"),
  Content(id: 12, text: "sit amet eleifend pede libero quis orci nullam"),
  Content(id: 13, text: "nisl nunc rhoncus dui vel sem"),
  Content(
      id: 14, text: "amet nunc viverra dapibus nulla suscipit ligula in lacus"),
  Content(
      id: 15,
      text:
          "nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in"),
  Content(id: 16, text: "nibh in quis justo maecenas rhoncus aliquam"),
  Content(
      id: 17,
      text:
          "commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non"),
  Content(
      id: 18,
      text:
          "at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia"),
  Content(
      id: 19, text: "ut erat curabitur gravida nisi at nibh in hac habitasse"),
];
