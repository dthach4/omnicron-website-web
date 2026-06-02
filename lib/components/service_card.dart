import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:website_jaspr/constants/theme.dart";

@immutable
class ServiceCard extends StatelessComponent {
  static const int cardsPerRowLarge = 4;
  static const int cardsPerRowMedium = 3;
  static const int cardsPerRowSmall = 2;
  static const int cardsPerRowExtraSmall = 1;
  
  final String iconClass;
  final String title;
  final String description;

  const ServiceCard({
    required this.iconClass,
    required this.title,
    required this.description,
  });

  @override
  Component build(BuildContext context) => div(classes: "service-card-wrapper", [
    div(classes: "service-card", [
      div(classes: "service-card-content", [
        div(classes: "service-icon", [
          i(classes: iconClass, [])
        ]),
        h3(classes: "service-title", [ .text(title) ]),
        p(classes: "service-description", [ .text(description) ]),
      ]),
    ]),
  ]);
  
  @css
  static List<StyleRule> get styles => [
    css(".service-card-wrapper", [
      css("&").styles(
        width: (100.0 / cardsPerRowLarge).percent,
        padding: .all(1.0.em),
        flex: .basis((100.0 / cardsPerRowLarge).percent),
        textAlign: .center,
      ),
      css("& .service-card", [
        css("&").styles(
          opacity: 0.0,
          transition: const Transition(
            "all",
            duration: Duration(seconds: 1),
            curve: Curve.easeInOut,
          ),
          transform: .combine([
            const .scale(0.8),
            .translate(y: 100.0.px),
          ]),
        ),
        css("&.visible").styles(
          opacity: 1.0,
          transform: const .scale(1.0),
        ),
        css("& .service-card-content", [
          css("&").styles(
            width: 100.0.percent,
            height: 100.0.percent,
            padding: .symmetric(vertical: .zero, horizontal: 2.0.em),
            margin: const .symmetric(vertical: .zero, horizontal: .auto),
            radius: .circular(5.0.px),
          ),
          css("& .service-icon").styles(
            width: 3.0.rem,
            height: 3.0.rem,
            margin: const .symmetric(vertical: .zero, horizontal: .auto),
            radius: .circular(50.0.percent),
            shadow: BoxShadow(
              offsetX: .zero,
              offsetY: .zero,
              blur: 5.0.px,
              color: const .value(0x556F94),
            ),
            color: const .value(0x1F1F1F),
            fontSize: 1.25.rem,
            lineHeight: 3.0.rem,
            backgroundColor: const .value(0xA4B9D6),
          ),
          css("& .service-title").styles(
            display: .flex,
            height: 2.4.em,
            margin: .only(bottom: 0.5.em),
            flexDirection: .row,
            justifyContent: .center,
            alignItems: .center,
            fontFamily: titleFontFamily,
            fontWeight: titleFontWeight,
            lineHeight: 1.2.em,
          ),
          css("& .service-description").styles(
            fontSize: 0.85.rem,
            lineHeight: 1.5.em,
          ),
        ]),
      ]),
      css.media(.screen(maxWidth: 1200.0.px), [
        css("&").styles(
          width: (100 / cardsPerRowMedium).percent,
          flex: .basis((100 / cardsPerRowMedium).percent),
        ),
      ]),
      css.media(.screen(maxWidth: 992.0.px), [
        css("&").styles(
          width: (100 / cardsPerRowSmall).percent,
          flex: .basis((100 / cardsPerRowSmall).percent),
        ),
      ]),
      css.media(.screen(maxWidth: 768.0.px), [
        css("&").styles(
          width: (100 / cardsPerRowExtraSmall).percent,
          flex: .basis((100 / cardsPerRowExtraSmall).percent),
        ),
      ]),
    ]),
  ];
}