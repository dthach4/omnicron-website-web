import "dart:async";

import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";

@client
@immutable
class AtfServices extends StatefulComponent {
  final List<String> services;

  const AtfServices(this.services, {super.key});

  @override
  State<AtfServices> createState() => _AtfServicesState();

  @css
  static List<StyleRule> get styles => [
    css(".atf-subtitles", [
      css("&").styles(
        padding: Spacing.zero,
        listStyle: ListStyle.none,
        fontSize: 1.5.rem,
      ),
      css("& .subtitle-option").styles(
        display: Display.none,
      ),
      css("& .subtitle-active").styles(
        height: 2.0.rem,
        textShadow: TextShadow(
          offsetX: 1.0.px,
          offsetY: 1.0.px,
          blur: Unit.zero,
          color: const Color.value(0x000000),
        ),
      ),
    ]),
  ];
}

class _AtfServicesState extends State<AtfServices> {
  String serviceText = "";

  void showService(int i) {
    int characters = 0;
    Timer.periodic(
      const Duration(milliseconds: 100),
      (Timer timer) {
        final String service = component.services[i];
        setState(() { serviceText = service.substring(0, characters); });
        characters++;
        if (characters > service.length) {
          timer.cancel();
          Timer(
            const Duration(seconds: 1),
            () { showService((i+1) % component.services.length); },
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      showService(0);
    }
  }
  
  @override
  Component build(BuildContext context) => ul(classes: "atf-subtitles", [
    ...component.services.map(
      (String service) => li(classes: "subtitle-option", [ .text(service) ]),
    ),
    li(classes: "subtitle-active", [ .text(serviceText) ]),
  ]);
}