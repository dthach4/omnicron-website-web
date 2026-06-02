import "dart:convert";

import "package:http/http.dart" as http;
import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:universal_web/web.dart" hide Animation;
import "package:website_jaspr/components/form_text_field.dart";
import "package:website_jaspr/components/privacy_acceptance.dart";
import "package:website_jaspr/external/notie/notie.dart";
import "package:website_jaspr/model/contact_form_response.dart";

@client
@immutable
class ContactForm extends StatefulComponent {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();

  @css
  static List<StyleRule> get styles => [
    css(".contact-form-footer").styles(
      display: .flex,
      flexDirection: .row,
      justifyContent: .end,
      alignItems: .end,
    ),
    css.keyframes("spinner", {
      "from": Styles(
        transform: .rotate(0.0.deg),
      ),
      "to": Styles(
        transform: .rotate((-360.0).deg),
      ),
    }),
    css(".form-spinner").styles(
      width: 2.5.rem,
      height: 2.5.rem,
      raw: {
        "object-fit": "contain",
        "animation": "spinner 3s linear infinite",
      },
    ),
  ];
}

class _ContactFormState extends State<ContactForm> {
  final GlobalNodeKey<HTMLFormElement> formKey = GlobalNodeKey();
  final GlobalNodeKey<HTMLInputElement> nameKey = GlobalNodeKey();
  final GlobalNodeKey<HTMLInputElement> surnameKey = GlobalNodeKey();
  final GlobalNodeKey<HTMLInputElement> companyKey = GlobalNodeKey();
  final GlobalNodeKey<HTMLInputElement> emailKey = GlobalNodeKey();
  final GlobalNodeKey<HTMLTextAreaElement> messageKey = GlobalNodeKey();
  final GlobalNodeKey<HTMLInputElement> privacyKey = GlobalNodeKey();

  bool isLoading = false;
  
  @override
  Component build(BuildContext context) => form(
    key: formKey,
    events: {
      "submit": (Event event) {
        event.preventDefault();
        submit();
      },
    },
    [
      div(classes: "oc-row", [
        div(classes: "oc-col-half", [FormTextField(inputKey: nameKey, label: "Nome", name: "nome", required: true)]),
        div(classes: "oc-col-half", [FormTextField(inputKey: surnameKey, label: "Cognome", name: "cognome", required: true)]),
        div(classes: "oc-col-half", [FormTextField(inputKey: companyKey, label: "Azienda", name: "azienda", required: false)]),
        div(classes: "oc-col-half", [FormTextField(inputKey: emailKey, label: "Indirizzo e-mail", name: "email", isEmail: true, required: true)]),
        div(classes: "oc-col-full", [FormTextField(inputKey: messageKey, label: "Messaggio", name: "messaggio", isTextArea: true, required: true)]),
      ]),
      PrivacyAcceptance(inputKey: privacyKey, name: "privacy"),
      div(classes: "contact-form-footer", [
        isLoading
          ? const img(src: "/dist/app/imgs/logo-black.png", classes: "form-spinner")
          : const input(
            type: InputType.submit,
            value: "Invia",
            classes: "button-solid",
          ),
      ]),
    ]
  );

  void submit() async {
    final String name    = nameKey.currentNode!.value;
    final String surname = surnameKey.currentNode!.value;
    final String company = companyKey.currentNode!.value;
    final String email   = emailKey.currentNode!.value;
    final String message = messageKey.currentNode!.value;
    final bool   privacy = privacyKey.currentNode!.checked;
    const String apiUrlString = String.fromEnvironment("API_URL");
    final Map<String, dynamic> input = {
      "name"   : name,
      "surname": surname,
      "company": company,
      "email"  : email,
      "message": message,
      "privacy": privacy
    };
    setState(() { isLoading = true; });
    final Uri apiUri = Uri.parse(apiUrlString).resolve("sendMail");
    try {
      final http.Response response = await http.post(
        apiUri,
        body: jsonEncode(input),
        encoding: const Utf8Codec(),
      );
      final ContactFormResponse responseObject = .fromMap(jsonDecode(response.body));
      if (responseObject.success) {
        Notie.alert(
          type: .success,
          text: "Messaggio inviato con successo!",
          position: .top,
          stay: false,
          time: const Duration(seconds: 3),
        );
        for (GlobalNodeKey<HTMLInputElement> nodeKey in [nameKey, surnameKey, companyKey, emailKey]) {
          nodeKey.currentNode!
            ..value = ""
            ..parentElement!.classList.remove("active");
        }
        messageKey.currentNode!
          ..value = ""
          ..parentElement!.classList.remove("active");
        privacyKey.currentNode!.checked = false;
        setState(() { isLoading = false; });
        return;
      }
      Notie.alert(
        type: .error,
        text: responseObject.error ?? "Si è verificato un errore",
        position: .top,
        stay: false,
        time: const Duration(seconds: 3),
      );
      setState(() { isLoading = false; });
    } on Exception {
      Notie.alert(
        type: .error,
        text: "Si è verificato un errore",
        position: .top,
        stay: false,
        time: const Duration(seconds: 3),
      );
      setState(() { isLoading = false; });
    }
  }
}