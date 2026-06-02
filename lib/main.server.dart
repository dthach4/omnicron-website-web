library;

import "package:jaspr/dom.dart";
import "package:jaspr/server.dart";
import "package:jaspr_content/jaspr_content.dart";
import "package:jaspr_content/theme.dart";
import "package:jaspr_router/jaspr_router.dart";
import "package:website_jaspr/layouts/legal.dart";

import "app.dart";

import "main.server.options.dart";

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );
  runApp(
    Document(
      lang: "it",
      title: "Omnicron - Soluzioni digitali innovative",
      head: [
        ...[
          "/dist/app/fonts/roboto-v30-latin/roboto-v30-latin-300.woff2",
          "/dist/app/fonts/roboto-v30-latin/roboto-v30-latin-500.woff2",
          "/dist/app/fonts/comfortaa-v40-latin/comfortaa-v40-latin-500.woff2",
          "/dist/app/fonts/comfortaa-v40-latin/comfortaa-v40-latin-700.woff2",
        ].map(
          (String path) => link(
            href: path,
            rel : "preload",
            as  : "font",
            type: "font/woff2",
            attributes: {
              "crossorigin": "",
            },
          )
        ),
        ...[
          "/dist/fontawesome/css/app.css",
          "/dist/oc-cookie-banner/css/oc-cookie-banner.css",
        ].map(
          (String path) => .fragment([
            link(
              href: path,
              rel: "preload",
              as: "style",
              attributes: {
                "onload": "this.onload=null;this.rel='stylesheet'",
              },
            ),
            Component.element(
              tag: "noscript",
              children: [
                link(href: path, rel: "stylesheet")
              ],
            ),
          ]),
        ),
        const link(
          rel: "preload",
          href: "https://cdnjs.cloudflare.com/ajax/libs/notie/4.3.1/notie.css",
          as: "style",
          attributes: {
            "integrity": "sha512-7DgarsuahzxiOonlZeYgjXuPFVEDIylPzzlmANJdccCIO0H7ofXKbAKf0FWCkh8NkCFswe3Hpj6HegSTYH6SJQ==",
            "crossorigin": "anonymous",
            "referrerpolicy": "no-referrer",
            "onload": "this.onload=null;this.rel='stylesheet'",
          }
        ),
        const Component.element(
          tag: "noscript",
          children: [
            link(
              rel: "stylesheet",
              href: "https://cdnjs.cloudflare.com/ajax/libs/notie/4.3.1/notie.css",
              attributes: {
                "integrity": "sha512-7DgarsuahzxiOonlZeYgjXuPFVEDIylPzzlmANJdccCIO0H7ofXKbAKf0FWCkh8NkCFswe3Hpj6HegSTYH6SJQ==",
                "crossorigin": "anonymous",
                "referrerpolicy": "no-referrer",
              }
            ),
          ],
        ),
        const link(
          href: "https://omnicron.it/",
          rel : "canonical",
        ),
        const link(
          href: "/dist/app/imgs/favicon-black.png",
          rel : "icon",
          type: "image/png",
        ),
        const link(
          href: "/dist/app/css/fonts.css",
          rel : "stylesheet",
        ),
      ],
      meta: {
        "description"        : "Web Agency di Lecco che si occupa di sviluppare siti e applicazioni ad hoc per il cliente.",
        "robots"             : "index, follow",
        "og:title"           : "Omnicron - Web Agency",
        "og:type"            : "website",
        "og:image"           : "https://www.omnicron.it/dist/app/imgs/og-snippet.png",
        "og:image:secure_url": "https://www.omnicron.it/dist/app/imgs/og-snippet.png",
        "og:image:type"      : "image/png",
        "og:image:width"     : "1200",
        "og:image:height"    : "630",
        "og:image:alt"       : "Omnicron logo",
        "og:url"             : "https://www.omnicron.it/",
        "og:site_name"       : "Omnicron - Web Agency",
        "og:description"     : "Sviluppiamo applicazioni mobili, siti web, chatbot e altro ancora per migliorare la visibilità e l'automazione della tua attività",
        "og:locale"          : "it_IT",
        "twitter:card"       : "summary_large_image",
        "twitter:site"       : "",
        "twitter:title"      : "Omnicron - Soluzioni Digitali",
        "twitter:description": "Sviluppiamo applicazioni mobili, siti web, chatbot e altro ancora per migliorare la visibilità e l'automazione della tua attività",
      },
      body: ContentApp.custom(
        loaders: [
          FilesystemLoader("content"),
        ],
        configResolver: PageConfig.all(
          layouts: [ const LegalLayout() ],
          parsers: [ const MarkdownParser() ],
          theme: const ContentTheme.none(),
        ),
        routerBuilder: (List<List<RouteBase>> routes) => App(routes: routes),
      ),
    ),
  );
}
