import "package:universal_web/js_interop.dart";
import "package:universal_web/web.dart";

extension type ScrollMagicSceneOptions._(JSObject _) implements JSObject {
  external factory ScrollMagicSceneOptions({
    Element? triggerElement,
    String? duration,
    double? offset,
    double? triggerHook,
  });
}