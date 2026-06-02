import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:jaspr_content/jaspr_content.dart";
import "package:website_jaspr/constants/theme.dart";
import "package:website_jaspr/sections/copyright.dart";

class LegalLayout extends PageLayoutBase {
  const LegalLayout();

  @override
  Pattern get name => "legal";

  @override
  Component buildBody(Page page, Component child) => Component.fragment([
    const header(classes: "legal-header", [
      a(href: "/", [
        img(classes: "header-logo", src: "/dist/app/imgs/logo-white-horizontal.png", alt: ""),
      ]),
    ]),
    main_(classes: "page legal-page", [ child ]),
    const CopyrightSection(),
  ]);

  @css
  static List<StyleRule> get styles => [
    css(".legal-header", [
      css("&").styles(
        display: .flex,
        position: const .fixed(top: .zero, left: .zero),
        width: 100.0.percent,
        height: 100.0.px,
        flexDirection: .row,
        justifyContent: .center,
        alignItems: .center,
        backgroundColor: const .value(0x000000),
      ),
      css("& a").styles(
        opacity: 1.0,
      ),
      css("& img").styles(
        maxHeight: 64.0.px,
      ),
    ]),
    css(".page.legal-page", [
      css("&").styles(
        padding: .zero,
        margin: .zero,
        overflow: .hidden,
        color: const .value(0xFFFFFF),
        fontFamily: textFontFamily,
        fontWeight: textFontWeight,
        backgroundColor: const .value(0x1F1F1F),
      ),
      css("& h1").styles(
        textAlign: .center,
        fontSize: 2.25.rem,
        fontWeight: boldFontWeight,
        textTransform: .upperCase,
      ),
      css("& h2").styles(
        margin: .only(top: 2.0.rem, bottom: 1.0.rem),
        textAlign: .left,
        fontSize: 1.5.rem,
        fontWeight: boldFontWeight,
      ),
      css("& ul li").styles(
        margin: .only(bottom: 0.5.rem),
      ),
      css("& a").styles(
        color: const .value(0xF1F1F1),
        fontWeight: boldFontWeight,
        textDecoration: .none,
      ),
      css("& .content").styles(
        width: 800.0.px,
        maxWidth: 100.0.percent,
        padding: .only(top: 100.0.px, left: 1.0.rem, bottom: .zero, right: 1.0.rem),
        margin: const .symmetric(vertical: .zero, horizontal: .auto),
      ),
    ]),
  ];
}
