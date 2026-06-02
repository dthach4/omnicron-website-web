import "package:universal_web/js_interop.dart";

extension type NotieAlertOptions._(JSObject _) implements JSObject {
  external factory NotieAlertOptions({
    String? type,
    required String text,
    bool? stay,
    double? time,
    String? position,
  });
}