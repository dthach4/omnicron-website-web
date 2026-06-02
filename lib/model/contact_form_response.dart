import "package:meta/meta.dart";

@immutable
class ContactFormResponse {
  final bool success;
  final String? error;

  const ContactFormResponse({
    required this.success,
    this.error,
  });

  factory ContactFormResponse.fromMap(Map<String, dynamic> map) => ContactFormResponse(
    success: map["success"],
    error  : map.containsKey("error") ? map["error"]: null,
  );
}