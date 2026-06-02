import "package:universal_web/js_interop.dart";
import "package:universal_web/web.dart";
import "package:website_jaspr/external/scroll_magic/controller.dart";
import "package:website_jaspr/external/scroll_magic/options/scene_options.dart";

@JS("ScrollMagic.Scene")
extension type ScrollMagicScene._(JSObject _) implements JSObject {

  external factory ScrollMagicScene.__(ScrollMagicSceneOptions options);

  factory ScrollMagicScene({
    Element? triggerElement,
    String? duration,
    double? offset,
    double? triggerHook,
  }) => .__(
    ScrollMagicSceneOptions(
      triggerElement: triggerElement,
      duration: duration,
      offset: offset,
      triggerHook: triggerHook,
    )
  );

  external ScrollMagicScene setClassToggle(Element element, String classes);

  external ScrollMagicScene addTo(ScrollMagicController controller);
}