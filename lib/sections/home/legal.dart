import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:website_jaspr/constants/theme.dart";

class HomeLegalSection extends StatelessComponent {
  const HomeLegalSection({super.key});

  @override
  Component build(BuildContext context) => const section(
    classes: "legal-section",
    attributes: {
      "itemscope": "",
      "itemtype": "https://schema.org/Organization",
    },
    [
      div(classes: "legal-section-inner", [
        div(classes: "legal-logo", [
          img(
            src: "",
            classes: "lazyload",
            alt: "Omnicron logo",
            width: 96,
            height: 83,
            attributes: {"data-src": "/dist/app/imgs/logo-white-text.png"},
          ),
        ]),
        div(classes: "legal-company-data", [
          div(classes: "legal-company-name", attributes: { "itemprop": "name" }, [p([.text("Omnicron di Dany Thach")])]),
          div(classes: "legal-company-address", attributes: { "itemprop": "legalAddress "}, [
            p([span(attributes: { "itemprop": "streetAddress" }, [.text("Via Col di Lana, 10")])]),
            p([
              span(attributes: { "itemprop": "postalCode" }, [.text("23900")]),
              .text(" "),
              span(attributes: { "itemprop": "addressLocality"}, [.text("Lecco")]),
              .text(" "),
              span([.text("(LC)")]),
            ]),
            p(attributes: { "itemprop": "addressCountry" }, [.text("Italia")]),
          ]),
        ]),
        div(classes: "legal-company-data", [
          div(classes: "legal-company-fiscal", [
            p([strong([.text("Codice Fiscale")]), .text(" "), span(attributes: { "itemprop": "taxId" }, [.text("THCDNY92C16E507V")])]),
            p([strong([.text("Partita IVA")]), .text(" "), span(attributes: { "itemprop": "vatId" }, [.text("03841560133")])]),
            p([strong([.text("Iscritto al registro delle imprese di")]), .text(" COMO-LECCO")]),
            p([strong([.text("Numero REA")]), .text(" LC - 400823")]),
          ]),
          div(classes: "legal-company-contacts", [
            p([strong([.text("Indirizzo e-mail")]), .text(" "), a(href: "mailto:info@omnicron.it", attributes: { "itemprop": "email" }, [.text("info@omnicron.it")])]),
            p([strong([.text("Indirizzo PEC")]), .text(" "), a(href: "mailto:d.thach@pec.it", [.text("d.thach@pec.it")])]),
            p([strong([.text("Telefono")]), .text(" "), a(href: "tel:00393889762162", attributes: { "itemprop": "telephone" }, [.text("+39 388 9762162")])]),
          ]),
        ]),
      ]),
    ]
  );

  @css
  static List<StyleRule> get styles => [
    css(".legal-section", [
      css("&").styles(
        padding: .all(1.0.rem),
      ),
      css("& .legal-section-inner", [
        css("&").styles(
          display: .flex,
          width: 980.0.px,
          maxWidth: 100.0.percent,
          padding: .all(1.0.rem),
          margin: const .symmetric(vertical: .zero, horizontal: .auto),
          flexDirection: .row,
          alignItems: .center,
        ),
        css.media(.screen(maxWidth: 768.0.px), [
          css("&").styles(
            flexDirection: .column,
          ),
        ]),
        css("& .legal-logo", [
          css("&").styles(
            width: (100.0 / 3).percent,
            padding: .symmetric(vertical: .zero, horizontal: 3.0.rem),
            textAlign: .right,
          ),
          css.media(.screen(maxWidth: 768.0.px), [
            css("&").styles(
              width: 100.0.percent,
              textAlign: .center,
            ),
          ]),
          css("& img").styles(
            width: 96.0.px,
            maxWidth: 100.0.percent,
          ),
        ]),
        css("& .legal-company-data", [
          css("&").styles(
            width: (100.0 / 3).percent,
            textAlign: .left,
          ),
          css.media(.screen(maxWidth: 768.0.px), [
            css("&").styles(
              width: 100.0.percent,
              textAlign: .center,
            ),
          ]),
          css("& p").styles(
            margin: .zero,
          ),
          css("& .legal-company-name, & .legal-company-address, & .legal-company-fiscal, & .legal-company-contacts").styles(
            margin: .symmetric(vertical: 1.0.rem, horizontal: .zero),
          ),
          css("& .legal-company-address, & .legal-company-fiscal, & .legal-company-contacts").styles(
            fontSize: 0.85.rem,
          ),
          css("& .legal-company-name p").styles(
            fontWeight: boldFontWeight,
          ),
        ]),
      ]),
    ]),
  ];
}
