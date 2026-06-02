import "package:universal_web/js_interop.dart";
import "package:website_jaspr/external/oc_cookie_banner/options/add_category.dart";
import "package:website_jaspr/external/oc_cookie_banner/properties/strings.dart";

@JS("OcCookieBanner")
extension type OcCookieBanner._(JSObject _) implements JSObject {
  @JS()
  external OcCookieBannerStrings strings;
  
  @JS()
  external OcCookieBanner();

  @JS("addCategory")
  external void _addCategory(OcCookieBannerAddCategoryOptions options);

  void addCategory({
    required String id,
    required String title,
    required String description,
    bool mandatory = false,
    required void Function() callback,
  }) => _addCategory(OcCookieBannerAddCategoryOptions(
    id         : id,
    title      : title,
    description: description,
    mandatory  : mandatory,
    callback   : callback.toJS,
  ));

  @JS()
  external void load();
}
