import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:website_jaspr/components/markdown_subcontent.dart";

@immutable
class HomeCompanySection extends StatelessComponent {
  const HomeCompanySection({super.key});

  @override
  Component build(BuildContext context) => const section(classes: "company-section", [
    _HomeCompanySectionLeft(),
    _HomeCompanySectionRight(),
  ]);

  @css
  static List<StyleRule> get styles => [
    css(".company-section", [
      css("&").styles(
        display: .flex,
        width: 100.0.percent,
        flexDirection: .row,
        flexWrap: .wrap,
        justifyContent: .center,
        backgroundColor: const .value(0x000000),
        raw: {
          "background-image": "linear-gradient(to bottom, #000000 0%, #1f1f1f 100%)",
        },
      ),
      css("& .company-section-left, & .company-section-right", [
        css("&").styles(
          display: .flex,
          width: (100.0 / 2).percent,
          flexDirection: .row,
          alignItems: .center,
          flex: Flex(basis: (100.0 / 2).percent, grow: 1.0),
        ),
        css.media(.screen(maxWidth: 1200.0.px), [
          css("&").styles(
            width: 400.0.px,
          ),
        ]),
        css.media(.screen(maxWidth: 768.0.px), [
          css("&").styles(
            width: 100.0.percent,
            flex: .basis(100.0.percent),
          ),
        ]),
      ]),
      css("& .company-section-left .company-section-bg, & .company-section-right .company-section-bg").styles(
        height: 100.0.percent,
        flex: const .grow(1.0),
      ),
      css("& .company-section-left .company-section-bg").styles(
        backgroundPosition: const BackgroundPosition(alignX: .right, alignY: .top),
        backgroundRepeat: .noRepeat,
        backgroundSize: .cover,
      ),
      css("& .company-section-right", [
        css("&").styles(
          backgroundPosition: const BackgroundPosition(alignX: .left, alignY: .top),
          backgroundRepeat: .noRepeat,
          backgroundSize: .cover,
        ),
        css("& img").styles(
          display: .block,
          maxWidth: 100.0.percent,
          margin: const .symmetric(vertical: .zero, horizontal: .auto),
        ),
      ]),
      css("& .company-section-box", [
        css("&").styles(
          width: 600.0.px,
          maxWidth: 100.0.percent,
          padding: .symmetric(vertical: 4.0.rem, horizontal: 2.0.rem),
        ),
        css.media(.screen(maxWidth: 768.0.px), [
          css("&").styles(
            padding: .symmetric(vertical: 2.0.rem),
          ),
        ]),
      ]),
    ]),
  ];
}

@immutable
class _HomeCompanySectionLeft extends StatelessComponent {
  const _HomeCompanySectionLeft();
  
  @override
  Component build(BuildContext context) => const div(classes: "company-section-left", [
    div(
      classes: "company-section-bg company-section-bg-left lazyload",
      attributes: {
        "data-bg": "/dist/app/imgs/company-bg-left.png",
      },
      [],
    ),
    div(classes: "company-section-box", [
      MarkdownSubcontent("company_profile.md"),
    ])
  ]);
}

@immutable
class _HomeCompanySectionRight extends StatelessComponent {
  const _HomeCompanySectionRight();
  
  @override
  Component build(BuildContext context) => const div(
    classes: "company-section-right lazyload",
    attributes: {
      "data-bg": "dist/app/imgs/company-bg-right.png"
    },
    [
      div(classes: "company-section-box", [
        img(
          src: "",
          classes: "lazyload",
          alt: "Web agency working",
          width: 345,
          height: 370,
          attributes: {
            "data-src": "/dist/app/imgs/company-img-without-bg.svg",
          },
        ),
      ]),
      div(classes: "company-section-bg company-section-bg-right", []),
    ],
  );
}
