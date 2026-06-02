import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:website_jaspr/sections/copyright.dart";
import "package:website_jaspr/sections/home/above_the_fold.dart";
import "package:website_jaspr/sections/home/company.dart";
import "package:website_jaspr/sections/home/contact_us.dart";
import "package:website_jaspr/sections/home/legal.dart";
import "package:website_jaspr/sections/home/services.dart";

@immutable
class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) => const .fragment([
    main_(classes: "page", [
      HomeAboveTheFoldSection(),
      HomeServicesSection(),
      HomeCompanySection(),
      HomeContactUsSection(),
      HomeLegalSection(),
      CopyrightSection(),
    ]),
  ]);
}
