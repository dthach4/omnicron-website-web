import "dart:math";

import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:universal_web/web.dart";
import "package:website_jaspr/constants/theme.dart";

@immutable
class PrivacyAcceptance extends StatelessComponent {
  final GlobalNodeKey<HTMLInputElement>? inputKey;
  final String name;
  
  const PrivacyAcceptance({
    super.key,
    this.inputKey,
    required this.name,
  });

  @override
  Component build(BuildContext context) {
    final Random random = Random();
    final String id = "field-$name-${random.nextInt(999999).toString().padLeft(6, "0")}";
    return div(classes: "form-checkbox-field", [
      input(key: inputKey, type: .checkbox, name: name, id: id, value: "on", attributes: {"required": ""}),
      label(
        htmlFor: id,
        const [
          .text("Accetto la "),
          a(
            href: "/privacy-policy/",
            target: .blank,
            attributes: {"title": "La nostra politica sulla privacy"},
            [.text("Privacy Policy")]
          ),
        ]
      )
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css(".form-checkbox-field").styles(
      margin: .symmetric(vertical: 0.5.em, horizontal: .zero),
      fontFamily: fancyFontFamily,
    ),
  ];
}