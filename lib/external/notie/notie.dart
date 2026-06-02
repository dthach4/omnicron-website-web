import "package:universal_web/js_interop.dart";
import "package:website_jaspr/external/notie/options/alert_options.dart";

@JS("notie")
extension type Notie._(JSObject _) implements JSObject {
  @JS("alert")
  external static void _alert(NotieAlertOptions options);
  
  static void alert({
    NotieAlertType? type,
    required String text,
    bool? stay,
    Duration? time,
    NotiePosition? position,
  }) => _alert(
    NotieAlertOptions(
      type    : type?.toString(),
      text    : text,
      stay    : stay,
      time    : time != null ? (time.inMilliseconds / 1000.0): null,
      position: position?.toString(),
    )
  );
}

enum NotieAlertType {
  success,
  warning,
  error,
  info,
  neutral;

  @override
  String toString() => switch (this) {
    success => "success",
    warning => "warning",
    error   => "error",
    info    => "info",
    neutral => "neutral",
  };
}

enum NotiePosition {
  top,
  bottom;

  @override
  String toString() => switch (this) {
    top    => "top",
    bottom => "bottom",
  };
}