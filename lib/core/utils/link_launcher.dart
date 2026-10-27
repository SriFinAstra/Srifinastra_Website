import 'package:url_launcher/url_launcher.dart';

/// Opens links, phone calls, WhatsApp chats and emails.
class LinkLauncher {
  LinkLauncher._();

  static Future<void> open(String url) async {
    await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
  }

  static Future<void> call(String phone) async {
    await launchUrl(Uri(scheme: 'tel', path: phone));
  }

  /// Opens a WhatsApp chat (wa.me) with an optional pre-filled message.
  static Future<void> whatsapp(String phone, {String? message}) async {
    final digits = phone.replaceAll(RegExp(r'[^0-9]'), '');
    final text =
        message == null ? '' : '?text=${Uri.encodeComponent(message)}';
    await launchUrl(
      Uri.parse('https://wa.me/$digits$text'),
      webOnlyWindowName: '_blank',
    );
  }

  static Future<void> email(
    String to, {
    String? subject,
    String? body,
  }) async {
    // Encode manually: Uri.queryParameters turns spaces into "+", which
    // most mail apps show literally.
    final parts = <String>[
      if (subject != null) 'subject=${Uri.encodeComponent(subject)}',
      if (body != null) 'body=${Uri.encodeComponent(body)}',
    ];
    final uri = Uri.parse(
      'mailto:$to${parts.isEmpty ? '' : '?${parts.join('&')}'}',
    );
    await launchUrl(uri);
  }
}
