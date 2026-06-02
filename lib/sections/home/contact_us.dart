import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:website_jaspr/components/contact_form.dart";
import "package:website_jaspr/constants/theme.dart";

@immutable
class HomeContactUsSection extends StatelessComponent {
  const HomeContactUsSection({super.key});

  @override
  Component build(BuildContext context) => const section(classes: "contact-section", [
    section(
      classes: "contact-section-inner",
      [
        _HomeContactUsSectionLeft(),
        _HomeContactUsSectionRight(),
      ],
    ),
  ]);

  @css
  static List<StyleRule> get styles => [
    css(".contact-section", [
      css("&").styles(
        padding: .symmetric(vertical: 3.0.rem, horizontal: .zero),
      ),
      css("& .contact-section-inner", [
        css("&").styles(
          position: const .relative(),
          width: containerSize,
          maxWidth: 100.0.percent,
          padding: .all(1.0.rem),
          margin: const .symmetric(vertical: .zero, horizontal: .auto),
        ),
        css("& h2", [
          css("&").styles(
            margin: .only(top: .zero, right: .zero, bottom: 0.5.rem, left: .zero),
            textAlign: .left,
          ),
          css.media(.screen(maxWidth: 768.0.px), [
            css("&").styles(
              textAlign: .center,
            ),
          ]),
          css.media(.screen(maxWidth: 576.0.px), [
            css("&").styles(
              fontSize: 2.0.rem,
            ),
          ]),
        ]),
        css("& .contact-left-box", [
          css("&").styles(
            position: const .absolute(left: .zero),
            width: (100.0 / 2).percent,
            padding: .only(top: 2.0.rem, right: 10.0.percent, bottom: 2.0.rem, left: 2.0.rem),
            radius: .circular(15.0.px),
            backgroundColor: const .value(0x000000),
          ),
          css("& p").styles(
            margin: const .all(.zero),
          ),
          css("& .contact-box-section").styles(
            margin: .only(bottom: 0.75.em),
          ),
          css("& .contact-box-company").styles(
            fontFamily: fancyFontFamily,
            fontSize: 1.25.rem,
            fontWeight: titleFontWeight,
          ),
          css("& .contact-box-section-contacts p").styles(
            margin: .only(bottom: 1.0.em),
          ),
          css("& .contact-box-email", [
            css("&").styles(
              margin: .only(top: 1.5.rem, right: .zero, bottom: .zero, left: .zero),
            ),
            css("& a").styles(
              fontFamily: fancyFontFamily,
              fontSize: 1.25.rem,
              fontWeight: titleFontWeight,
            ),
          ]),
          css.media(.screen(maxWidth: 768.0.px), [
            css("&").styles(
              position: const .relative(),
              width: 100.0.percent,
              padding: .only(right: 2.0.rem),
              textAlign: .center,
            ),
          ]),
        ]),
        css("& .contact-right-box", [
          css("&").styles(
            position: const Position.relative(),
            width: 60.0.percent,
            padding: .all(2.0.rem),
            margin: .only(top: 3.0.rem, right: .zero, left: .auto),
            radius: .circular(15.0.px),
            color: const .value(0x1F1F1F),
            backgroundColor: const .value(0xCFDCEE),
          ),
          css.media(.screen(maxWidth: 768.0.px), [
            css("&").styles(
              width: 100.0.percent,
            ),
          ]),
        ]),
      ]),
    ]),
  ];
}

@immutable
class _HomeContactUsSectionLeft extends StatelessComponent {
  const _HomeContactUsSectionLeft();

  @override
  Component build(BuildContext context) => const div(classes: "contact-left-box", [
    h2([.text("Dati aziendali")]),
    div(
      classes: "contact-box-section contact-box-company",
      [.text("Omnicron di Dany Thach")],
    ),
    div(
      classes: "contact-box-section contact-box-section-address",
      attributes: {"itemprop": "address"},
      [
        p([.text("Via Col di Lana, 10")]),
        p([.text("23900 Lecco (LC)")]),
        p([.text("Italia")]),
      ],
    ),
    div(classes: "contact-box-section contact-box-section-contacts", [
      p([
        strong([.text("Indirizzo e-mail")]),
        .text(" "),
        a(
          href: "mailto:info@omnicron.it",
          attributes: {"title": "Inviaci una mail"},
          [.text("info@omnicron.it")],
        ),
      ]),
      p([
        strong([.text("Indirizzo PEC")]),
        .text(" "),
        a(
          href: "mailto:d.thach@pec.it",
          attributes: {"title": "Inviaci una PEC"},
          [.text("d.thach@pec.it")],
        ),
      ]),
      p([
        strong([.text("Telefono")]),
        .text(" "),
        a(
          href: "tel:+393889762162",
          attributes: {"title": "Chiamaci"},
          [.text("+39 388 9762162")],
        ),
      ]),
    ]),
    div(classes: "contact-box-section contact-box-email", [
      a(
        href: "mailto:info@omnicron.it",
        attributes: {"title": "Contattaci ora"},
        [.text("info@omnicron.it")],
      ),
    ]),
  ]);
}

@immutable
class _HomeContactUsSectionRight extends StatelessComponent {
  const _HomeContactUsSectionRight();

  @override
  Component build(BuildContext context) => const div(classes: "contact-right-box", [
    h2([.text("Contattaci")]),
    ContactForm(),
  ]);
}