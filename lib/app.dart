import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:jaspr_router/jaspr_router.dart";
import "package:website_jaspr/components/cookie_banner.dart";
import "package:website_jaspr/components/lazy_loader.dart";
import "package:website_jaspr/constants/theme.dart";

import "pages/home.dart";

@immutable
class App extends StatelessComponent {
  final List<List<RouteBase>> routes;
  
  const App({
    super.key,
    this.routes = const [],
  });

  @override
  Component build(BuildContext context) => Component.fragment([
    Router(
      routes: [
        Route(
          path: "/",
          builder: (context, state) => const Home(),
        ),
        ...routes.expand((List<RouteBase> r) => r),
      ],
    ),
    const LazyLoader(),
    const CookieBanner(),
    const script(
      src: "https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js",
      attributes: {
        "integrity": "sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==",
        "crossorigin": "anonymous",
        "referrerpolicy": "no-referrer",
      },
      defer: true,
    ),
    const script(
      src: "https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.3.2/lazysizes.min.js",
      attributes: {
        "integrity": "sha512-q583ppKrCRc7N5O0n2nzUiJ+suUv7Et1JGels4bXOaMFQcamPk9HjdUknZuuFjBNs7tsMuadge5k9RzdmO+1GQ==",
        "crossorigin": "anonymous",
        "referrerpolicy": "no-referrer",
      },
      defer: true,
    ),
    const script(
      src: "https://cdnjs.cloudflare.com/ajax/libs/autosize.js/5.0.1/autosize.min.js",
      attributes: {
        "integrity": "sha512-aBxhlAogg9r6Gtes+dsuqW6IQ4Ee0MtjexckbMNOVdxAfi5NSEd38BNEgFiaBWS6cl67r+8OImzxVKDdmswhnA==",
        "crossorigin": "anonymous",
        "referrerpolicy": "no-referrer",
      },
      defer: true,
    ),
    const script(
      src: "https://cdnjs.cloudflare.com/ajax/libs/notie/4.3.1/notie.min.js",
      attributes: {
        "integrity": "sha512-NHRCwRf2LnVSlLDejCA9oS3fG3/FLSQIPCjAWl3M7tVi5wszwr6FxkjotWnQDXLE+aLKcxRrzFDNEgXj9nvkPw==",
        "crossorigin": "anonymous",
        "referrerpolicy": "no-referrer",
      },
      defer: true,
    ),
    const script(
      src: "/dist/oc-cookie-banner/js/oc-cookie-banner.js",
      defer: true,
    ),
  ]);

  @css
  static List<StyleRule> get styles => [
    css("*").styles(
      boxSizing:  .borderBox,
      fontFamily: textFontFamily,
      fontWeight: textFontWeight,
    ),
    css(":root").styles(
      fontSize: 16.0.px,
    ),
    css("html, body").styles(
      width: 100.percent,
      minHeight: 100.vh,
      padding: .zero,
      margin: .zero,
      fontFamily: const .list([FontFamily("Roboto"), FontFamilies.sansSerif]),
    ),
    css("strong").styles(
      fontWeight: boldFontWeight,
    ),
    css("h2").styles(
      textAlign: .center,
      fontFamily: titleFontFamily,
      fontSize: 2.5.rem,
      fontWeight: titleFontWeight,
      textTransform: .upperCase,
    ),
    css("a", [
      css("&").styles(
        opacity: 0.7,
        color: .inherit,
        textDecoration: .none,
      ),
      css("&:hover").styles(
        opacity: 1.0,
      ),
    ]),
    css(".button-solid").styles(
      padding: .symmetric(vertical: 0.75.rem, horizontal: 2.75.rem),
      border: .none,
      radius: .circular(2.0.rem),
      cursor: .pointer,
      color: const .value(0xF1F1F1),
      fontFamily: fancyFontFamily,
      fontSize: 1.0.rem,
      fontWeight: boldFontWeight,
      textTransform: .upperCase,
      lineHeight: 1.0.em,
      backgroundColor: const .value(0x1F1F1F),
    ),
    css(".page").styles(
      minHeight: 100.0.percent,
      color: const .value(0xFFFFFF),
      fontFamily: textFontFamily,
      backgroundColor: const .value(0x1F1F1F),
    ),
    css(".oc-row", [
      css("&").styles(
        display: .flex,
        margin: .symmetric(vertical: .zero, horizontal: (-0.2).rem),
        flexDirection: .row,
        flexWrap: .wrap,
        justifyContent: .start,
      ),
      css("& .oc-col-full, & .oc-col-half").styles(
        padding: .all(0.3.rem),
      ),
      css("& .oc-col-full").styles(
        width: 100.0.percent,
        flex: .basis(100.0.percent),
      ),
      css("& .oc-col-half", [
        css("&").styles(
          width: (100.0 / 2).percent,
          flex: .basis((100.0 / 2).percent),
        ),
        css.media(.screen(maxWidth: 576.0.px), [
          css("&").styles(
            width: 100.0.percent,
            flex: .basis(100.0.percent),
          ),
        ]),
      ]),
    ]),
  ];
}
