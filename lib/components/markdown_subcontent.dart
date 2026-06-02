import "dart:io";

import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:markdown/markdown.dart";

@immutable
class MarkdownSubcontent extends StatelessComponent {
  final String filename;

  const MarkdownSubcontent(this.filename, {super.key});

  @override
  Component build(BuildContext context) {
    final File file = File("subcontent/$filename");
    final String content = markdownToHtml(file.readAsStringSync());
    return RawText(content);
  }
}