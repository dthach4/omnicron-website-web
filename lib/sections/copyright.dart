import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:website_jaspr/constants/theme.dart";

class CopyrightSection extends StatelessComponent {
  const CopyrightSection();

  @override
  Component build(BuildContext context) => const footer(classes: "copyright", [
    div(classes: "copyright-content", [
      div(classes: "copyright-main", [
        .text("Omnicron di Dany Thach © 2026 - All Rights Reserved"),
      ]),
      div(classes: "copyright-side", [
        a(href: "https://jaspr.site", target: .blank, classes: "jaspr-link", [
          JasprBadge.light(),
        ]),
      ]),
    ]),
  ]);

  @css
  static List<StyleRule> get styles => [
    css(".copyright", [
      css("&").styles(
        padding: .symmetric(vertical: 1.5.rem, horizontal: .zero),
        color: const .value(0xFFFFFF),
        fontSize: 14.0.px,
        backgroundColor: const .value(0x000000),
      ),
      css("& .copyright-content", [
        css("&").styles(
          display: .flex,
          width: containerSize,
          maxWidth: 100.0.percent,
          margin: const .symmetric(vertical: .zero, horizontal: .auto),
          flexDirection: .row,
          alignItems: .center,
        ),
        css("& .copyright-main").styles(
          flex: const .grow(1),
        ),
        css.media(.screen(maxWidth: 568.0.px), [
          css("&").styles(
            flexDirection: .column,
            gap: .row(1.0.rem),
            textAlign: .center,
          ),
        ]),
      ]),
      css("& a.jaspr-link").styles(
        opacity: 1.0,
      ),
    ]),
  ];
}