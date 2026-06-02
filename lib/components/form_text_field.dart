import "dart:math";

import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:universal_web/web.dart";
import "package:website_jaspr/constants/theme.dart";
import "package:website_jaspr/external/autosize/autosize.dart";

@immutable
class FormTextField extends StatefulComponent {
  final String label;
  final String name;
  final GlobalNodeKey? inputKey;
  final bool isEmail;
  final bool isTextArea;
  final bool required;

  const FormTextField({
    super.key,
    required this.label,
    required this.name,
    this.inputKey,
    this.isEmail = false,
    this.isTextArea = false,
    this.required = false,
  }) : assert(!isEmail || !isTextArea);

  @override
  State<FormTextField> createState() => _FormTextFieldState();

  @css
  static List<StyleRule> get styles => [
    css(".form-text-field", [
      css("&").styles(
        position: const .relative(),
        width: 100.0.percent,
        opacity: 0.7,
      ),
      css("& label").styles(
        position: .absolute(
          left: 1.0.rem,
          top: 0.88.rem,
        ),
        pointerEvents: .none,
        transition: const .combine([
          Transition("top", duration: Duration(milliseconds: 200), curve: .linear),
          Transition("font-size", duration: Duration(milliseconds: 200), curve: .linear),
        ]),
        fontFamily: fancyFontFamily,
        fontSize: 1.25.rem,
      ),
      css("&.active label").styles(
        position: .absolute(
          top: 0.31.rem,
        ),
        fontSize: 0.69.rem,
      ),
      css("& textarea").styles(
        raw: {
          "resize": "vertical",
        },
      ),
      css("& input[type=\"text\"], & input[type=\"email\"], & textarea").styles(
        width: 100.0.percent,
        padding: .only(top: 1.0.rem, right: 1.0.rem, bottom: 0.75.rem, left: 1.0.rem),
        border: .none,
        radius: .circular(5.0.px),
        outline: .unset,
        shadow: BoxShadow(
          offsetX: .zero,
          offsetY: 3.0.px,
          blur: 6.0.px,
          color: const .rgba(0, 0, 0, 0.15),
        ),
        fontSize: 1.25.rem,
        lineHeight: 1.0.em,
        backgroundColor: const .value(0xFFFFFF),
      ),
      css("& input[type=\"text\"]:focus+label, & input[type=\"email\"]:focus+label, & textarea:focus+label").styles(
        color: const .value(0x556F94),
      ),
    ]),
  ];
}

class _FormTextFieldState extends State<FormTextField> {
  final GlobalNodeKey<HTMLElement> fieldKey = GlobalNodeKey();
  GlobalNodeKey<Node> textareaKey = GlobalNodeKey();

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      if (component.inputKey != null) {
        textareaKey = component.inputKey!;
      }
      context.binding.addPostFrameCallback(() {
        final HTMLTextAreaElement? textareaElement = textareaKey.currentNode as HTMLTextAreaElement?;
        if (textareaElement != null) {
          autosize(textareaElement);
        }
      });
    }
  }
  
  @override
  Component build(BuildContext context) {
    final Random random = Random();
    final String id = "field-${component.name}-${random.nextInt(999999).toString().padLeft(6, "0")}";
    return div(key: fieldKey, classes: "form-text-field", [
      component.isTextArea
        ? textarea(
            key: textareaKey,
            name: component.name,
            id: id,
            rows: 5,
            events: {
              "focus": onFocus,
              "blur": onBlur,
            },
            []
          )
        : input(
          key: component.inputKey,
          type: component.isEmail ? .email : .text,
          name: component.name,
          id: id,
          attributes: {
            if (component.required)
              "required": ""
          },
          events: {
            "focus": onFocus,
            "blur": onBlur,
          }
        ),
      label(
        htmlFor: id,
        [.text("${component.label}${component.required ? "*" : ""}")],
      ),
    ]);
  }

  void onFocus(Event event) {
    final HTMLElement field = fieldKey.currentNode!;
    field.classList.add("active");
  }

  void onBlur(Event event) {
    final HTMLInputElement input = event.currentTarget as HTMLInputElement;
    if (input.value == "") {
      final HTMLElement field = fieldKey.currentNode!;
      field.classList.remove("active");
    }
  }
}