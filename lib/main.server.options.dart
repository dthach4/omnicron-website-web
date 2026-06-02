// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:website_jaspr/components/atf_background.dart'
    as _atf_background;
import 'package:website_jaspr/components/atf_services.dart' as _atf_services;
import 'package:website_jaspr/components/contact_form.dart' as _contact_form;
import 'package:website_jaspr/components/cookie_banner.dart' as _cookie_banner;
import 'package:website_jaspr/sections/home/services.dart' as _services;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _atf_background.AtfBackground: ClientTarget<_atf_background.AtfBackground>(
      'atf_background',
    ),
    _atf_services.AtfServices: ClientTarget<_atf_services.AtfServices>(
      'atf_services',
      params: __atf_servicesAtfServices,
    ),
    _contact_form.ContactForm: ClientTarget<_contact_form.ContactForm>(
      'contact_form',
    ),
    _cookie_banner.CookieBanner: ClientTarget<_cookie_banner.CookieBanner>(
      'cookie_banner',
    ),
    _services.HomeServicesSection: ClientTarget<_services.HomeServicesSection>(
      'services',
    ),
  },
  stylesId: 'main.css',
);

Map<String, Object?> __atf_servicesAtfServices(_atf_services.AtfServices c) => {
  'services': c.services,
};
