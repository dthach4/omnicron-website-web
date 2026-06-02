// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:website_jaspr/components/atf_background.dart'
    deferred as _atf_background;
import 'package:website_jaspr/components/atf_services.dart'
    deferred as _atf_services;
import 'package:website_jaspr/components/contact_form.dart'
    deferred as _contact_form;
import 'package:website_jaspr/components/cookie_banner.dart'
    deferred as _cookie_banner;
import 'package:website_jaspr/sections/home/services.dart'
    deferred as _services;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'atf_background': ClientLoader(
      (p) => _atf_background.AtfBackground(),
      loader: _atf_background.loadLibrary,
    ),
    'atf_services': ClientLoader(
      (p) => _atf_services.AtfServices(
        (p['services'] as List<Object?>).cast<String>(),
      ),
      loader: _atf_services.loadLibrary,
    ),
    'contact_form': ClientLoader(
      (p) => _contact_form.ContactForm(),
      loader: _contact_form.loadLibrary,
    ),
    'cookie_banner': ClientLoader(
      (p) => _cookie_banner.CookieBanner(),
      loader: _cookie_banner.loadLibrary,
    ),
    'services': ClientLoader(
      (p) => _services.HomeServicesSection(),
      loader: _services.loadLibrary,
    ),
  },
);
