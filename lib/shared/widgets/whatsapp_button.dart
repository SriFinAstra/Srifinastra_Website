import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/constants/app_text.dart';
import '../../core/constants/whatsapp_messages.dart';
import '../../core/utils/link_launcher.dart';

/// Round WhatsApp button that floats at the bottom-right of every page.
class WhatsAppButton extends StatelessWidget {
  const WhatsAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Chat on WhatsApp',
      child: Material(
        color: const Color(0xFF25D366),
        shape: const CircleBorder(),
        elevation: 6,
        shadowColor: Colors.black38,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => LinkLauncher.whatsapp(
            AppInfo.phoneRaw,
            message: WhatsAppMessages.general,
          ),
          child: const Padding(
            padding: EdgeInsets.all(14),
            child: FaIcon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
