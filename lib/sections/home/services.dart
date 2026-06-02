import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:universal_web/web.dart";
import "package:website_jaspr/components/service_card.dart";
import "package:website_jaspr/constants/theme.dart";
import "package:website_jaspr/external/scroll_magic/controller.dart";
import "package:website_jaspr/external/scroll_magic/scene.dart";

@client
@immutable
class HomeServicesSection extends StatefulComponent {
  const HomeServicesSection();

  @override
  State<HomeServicesSection> createState() => _HomeServicesSectionState();

  @css
  static List<StyleRule> get styles => [
    css(".services-section", [
      css("&").styles(
        padding: .symmetric(vertical: 1.0.rem),
        raw: {
          "background-image": "linear-gradient(to bottom, #1f1f1f 0%, #000000 100%)",
        },
      ),
      css("& .service-cards").styles(
        display: .flex,
        width: containerSize,
        maxWidth: 100.0.percent,
        padding: .only(top: 1.2.rem, right: 1.2.rem, bottom: 3.0.rem, left: 1.2.rem),
        margin: const .symmetric(vertical: .zero, horizontal: .auto,),
        flexDirection: .row,
        flexWrap: .wrap,
        justifyContent: .center,
      ),
    ]),
  ];
}

class _HomeServicesSectionState extends State<HomeServicesSection> {
  final GlobalNodeKey<HTMLElement> rootKey = GlobalNodeKey();
  
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      final ScrollMagicController scrollMagicController = ScrollMagicController();
      context.binding.addPostFrameCallback(() {
        final HTMLElement rootElement = rootKey.currentNode!;
        final NodeList nodes = rootElement.querySelectorAll(".service-card-wrapper");
        for (int i = 0; i < nodes.length; i++) {
          final HTMLElement element = nodes.item(i) as HTMLElement;
          final HTMLElement card = element.querySelector(".service-card") as HTMLElement;
          ScrollMagicScene(
            triggerElement: element,
            duration: 100.0.percent.value,
            offset: element.clientHeight / 2,
            triggerHook: 1.0,
          )
            .setClassToggle(card, "visible")
            .addTo(scrollMagicController);
        }
      });
    }
  }
  
  @override
  Component build(BuildContext context) => section(key: rootKey, classes: "services-section", [
    const h2([ .text("Servizi") ]),
    const div(classes: "service-cards", [
      ServiceCard(
        iconClass: "fa-solid fa-mobile",
        title: "Applicazioni mobili Android/iOS",
        description:
          "Grazie alla conoscenza di tecnologie recenti come Flutter, offriamo"
          " la possibilità di creare la vostra applicazione mobile e"
          " distribuirla per dispositivi Android e iOS.",
      ),
      ServiceCard(
        iconClass: "fa-solid fa-person-chalkboard",
        title: "Software gestionali",
        description:
          "Aiutiamo i clienti nella loro crescita sviluppando sistemi di"
          " automazione ad hoc per le loro aziende, mantenendo il contatto con"
          " loro fino al perfetto allineamento dei sistemi con le loro"
          " esigenze.",
      ),
      ServiceCard(
        iconClass: "fa-solid fa-laptop",
        title: "Siti web",
        description:
          "L'immagine della propria azienda sul web è ormai di vitale"
          " importanza. Sviluppiamo siti web per le aziende seguendo le scelte"
          " stilistiche e di marketing più efficaci.",
      ),
      ServiceCard(
        iconClass: "fa-solid fa-pen-ruler",
        title: "Branding",
        description:
        "Ogni realtà ha la sua identità personale e come tale dev'essere"
        " rappresentata con un logo su misura.",
      ),
      ServiceCard(
        iconClass: "fa-brands fa-wordpress-simple",
        title: "Plugin WordPress",
        description:
          "Comprendiamo le limitazioni che i clienti hanno con siti web creati"
          " su piattaforme CMS come WordPress. Per questo, sviluppiamo plugin"
          " per eliminare le barriere imposte dal CMS e permettere al cliente"
          " di avere le funzionalità che desidera."
      ),
      ServiceCard(
        iconClass: "fa-solid fa-users",
        title: "Social Media Manager",
        description:
          "L'attività sulle piattaforme social è in continuo avanzamento. Per"
          " questo, offriamo al cliente strategie efficaci per ottimizzare la"
          " visibilità nei social network più utilizzati."
      ),
      ServiceCard(
        iconClass: "fa-solid fa-pen-fancy",
        title: "SEO & Editor",
        description:
        "Se il vostro sito web non dà i risultati sperati, probabilmente la"
        " causa è da cercare nell'ottimizzazione per i motori di ricerca (SEO)."
        " Un'analisi dei testi e del codice da parte nostra può aiutarvi nella"
        " visibilità sul web.",
      ),
      ServiceCard(
        iconClass: "fa-solid fa-robot",
        title: "Bot Telegram & Discord",
        description:
          "Quante volte vi è capitato di perdere tempo sulle stesse domande da"
          " parte dei clienti? Per migliorare il vostro Customer Engagement"
          " possiamo sviluppare dei Chatbot per Telegram e Discord.",
      ),
    ]),
  ]);
}