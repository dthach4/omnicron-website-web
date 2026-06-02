import "dart:convert";

import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:website_jaspr/external/oc_cookie_banner/oc_cookie_banner.dart";

@client
@immutable
class CookieBanner extends StatefulComponent {
  const CookieBanner();

  @override
  State<CookieBanner> createState() => _CookieBannerState();
}

class _CookieBannerState extends State<CookieBanner> {
  bool isAnalyticsAccepted = false;

  static const String? matomoBaseUrl = bool.hasEnvironment("MATOMO_URL") ? String.fromEnvironment("MATOMO_URL") : null;
  
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      context.binding.addPostFrameCallback(() {
        final OcCookieBanner cookieBanner = OcCookieBanner();
        cookieBanner.strings.banner.text = """
<p>Il nostro sito utilizza cookies. Cliccando su "Gestisci cookies" puoi
  modificare le tue preferenze sui cookies per tipologia.</p>
<p>Per maggiori informazioni, leggi la nostra
  <a href="/cookie-policy/" target="_blank">Cookie Policy</a></p>""";
        cookieBanner.strings.settings.text = """
<p>In questa pagina puoi selezionare le categorie di cookie che vuoi
  attivare.</p>
<p>Per maggiori informazioni sui cookie utilizzati dal nostro sito, leggi la
  nostra <a href="/cookie-policy/" target="_blank">Cookie Policy</a>.</p>""";
        cookieBanner.addCategory(
          id: "mandatory",
          title: "Tecnici",
          description: """
<p>Cookie che permettono il funzionamento del sito, senza il quale il sito
  potrebbe avere comportamenti anomali. Questi tipi di cookies non sono
  disattivabili.</p>""",
          mandatory: true,
          callback: () {},
        );
        cookieBanner.addCategory(
          id: "analytics",
          title: "Analitici",
          description: """
<p>Cookie che permettono di collezionare informazioni anonime per rendere i
  contenuti più interessanti e attinenti ai desideri dell'utenza, ad esempio
  raccogliendo in forma anonima come l'utenza arrivi sul sito e le pagine più
  visitate dagli utenti.</p>
<p>Cookie attivati da questa categoria:
  <ul>
    <li>_pk_id.1.d60d</li>
    <li>_pk_ses.1.d60d</li>
  </ul>
</p>""",
          mandatory: false,
          callback: () {
            setState(() {
              isAnalyticsAccepted = true;
            });
          },
        );
        cookieBanner.load();
      });
    }
  }
  
  @override
  Component build(BuildContext context) => Component.fragment([
    if (isAnalyticsAccepted && matomoBaseUrl != null)
      script(content: """
var _paq = window._paq = window._paq || [];
/* tracker methods like "setCustomDimension" should be called before "trackPageView" */
_paq.push(['trackPageView']);
_paq.push(['enableLinkTracking']);
(function() {
  var u=${jsonEncode(matomoBaseUrl)};
  _paq.push(['setTrackerUrl', u+'matomo.php']);
  _paq.push(['setSiteId', '1']);
  var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
  g.async=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
})();"""
      ),
  ]);
}