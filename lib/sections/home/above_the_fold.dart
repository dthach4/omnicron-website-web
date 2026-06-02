import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:website_jaspr/components/atf_background.dart";
import "package:website_jaspr/components/atf_services.dart";
import "package:website_jaspr/constants/theme.dart";

@immutable
class HomeAboveTheFoldSection extends StatelessComponent {
  final List<String> services = const [
    "Sviluppo Applicazioni Mobili",
    "Sviluppo Software Gestionali",
    "Sviluppo Siti Web",
    "Branding",
    "Sviluppo Plugin WordPress",
    "Gestione di Profili Social",
    "SEO & Editor",
    "Sviluppo Chatbot",
  ];

  const HomeAboveTheFoldSection({super.key});

  @override
  Component build(BuildContext context) => section(classes: "atf-section", [
    const AtfBackground(),
    div(classes: "atf-content", [
      const img(
        src    : "/dist/app/imgs/logo-white.png",
        alt    : "Omnicron logo",
        classes: "atf-logo",
        width  : 160,
        height : 160,
      ),
      const h1(classes: "atf-title", [ .text("Omnicron - Soluzioni digitali"),]),
      AtfServices(services),
    ]),
    const img(
      src    : "/dist/app/imgs/atf-divider.svg",
      alt    : "Wave border",
      classes: "atf-bottom-image",
    )
  ]);

  @css
  static List<StyleRule> get styles => [
    css(".atf-section", [
      css("&").styles(
        display: .flex,
        position: const .relative(),
        width: 100.0.percent,
        height: 100.0.vh,
        padding: .only(bottom: 10.0.percent),
        overflow: .hidden,
        flexDirection: .row,
        justifyContent: .center,
        alignItems: .center,
        backgroundColor: const .value(0x000000),
      ),
      css("& .atf-content", [
        css("&").styles(
          zIndex: const ZIndex(1),
          padding: .all(2.0.rem),
          textAlign: .center,
        ),
        css("& .atf-logo").styles(
          width: 160.0.px,
          maxWidth: 100.0.percent,
        ),
        css("& .atf-title").styles(
          fontFamily: logoFontFamily,
          fontSize: logoFontSize,
          fontWeight: logoFontWeight,
          textTransform: .upperCase,
          textShadow: TextShadow(
            offsetX: 1.0.px,
            offsetY: 1.0.px,
            blur: .zero,
            color: const .value(0x000000),
          ),
        ),
      ]),
      css("& .atf-bottom-image").styles(
        position: const .absolute(
          bottom: .zero,
          left: .zero,
        ),
        zIndex: const ZIndex(1),
        width: 100.0.percent,
      ),
      css.media(.screen(maxWidth: 768.0.px), [
        css("&").styles(
          height: 85.0.vh,
        ),
        css("& .atf-bottom-image").styles(
          position: .absolute(
            left: (-100.0).percent,
            bottom: .zero,
          ),
          width: 200.0.percent,
        ),
      ]),
    ]),
  ];
}