import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constants/app_assets.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../core/responsive/responsive.dart';
import '../../core/utils/link_launcher.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/section_container.dart';
import '../../data/models/service_model.dart';
import '../../shared/widgets/hero_banner.dart';
import '../../shared/widgets/page_scaffold.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = Responsive.isDesktop(context);

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InfoTile(
          icon: Icons.phone_outlined,
          title: 'Call us',
          text: AppInfo.phone,
          onTap: () => LinkLauncher.call(AppInfo.phoneRaw),
        ),
        _InfoTile(
          brandIcon: FontAwesomeIcons.whatsapp,
          title: 'WhatsApp us',
          text: 'Send us a message on WhatsApp',
          onTap: () => LinkLauncher.whatsapp(AppInfo.phoneRaw, message: 'Hi'),
        ),
        _InfoTile(
          icon: Icons.mail_outline_rounded,
          title: 'Email us',
          text: AppInfo.email,
          onTap: () => LinkLauncher.email(AppInfo.email),
        ),
        const _InfoTile(
          icon: Icons.location_on_outlined,
          title: 'Visit us',
          text: 'Hyderabad, Telangana, India',
        ),
        const _InfoTile(
          icon: Icons.schedule_rounded,
          title: 'Office hours',
          text: AppInfo.hours,
        ),
      ],
    );

    return PageScaffold(
      children: [
        const HeroBanner(
          image: AppAssets.contactHero,
          minHeight: 480,
          eyebrow: 'Contact Us',
          title: "Let's Talk About\nYour Finances",
          body: 'Have a question about tax, accounts or compliance? Send us '
              'a message or call us, and we will get back to you within one '
              'working day.',
        ),
        SectionContainer(
          child: desktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 4, child: info),
                    const SizedBox(width: 48),
                    const Expanded(flex: 6, child: _ContactForm()),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [info, const SizedBox(height: 32), const _ContactForm()],
                ),
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    this.icon,
    this.brandIcon,
    required this.title,
    required this.text,
    this.onTap,
  }) : assert(icon != null || brandIcon != null);

  /// A Material icon, or...
  final IconData? icon;

  /// ...a Font Awesome brand icon (e.g. WhatsApp).
  final FaIconData? brandIcon;
  final String title;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: AppColors.mint,
                    shape: BoxShape.circle,
                  ),
                  child: brandIcon != null
                      ? FaIcon(brandIcon, color: AppColors.primary, size: 20)
                      : Icon(icon, color: AppColors.primary, size: 21),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppText.small.copyWith(fontSize: 12.5)),
                      const SizedBox(height: 2),
                      Text(text, style: AppText.title.copyWith(fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

typedef _Enquiry = ({
  String? service,
  String name,
  String email,
  String phone,
  String message,
});

/// Static-site friendly form: the visitor can send the enquiry by email
/// (opens their mail app) or by WhatsApp (opens a pre-filled chat).
/// For silent delivery later, post the form to Formspree / EmailJS / a
/// Firebase function instead.
class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _message = TextEditingController();
  String? _service;

  static final _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _message.dispose();
    super.dispose();
  }

  String? _required(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Required' : null;

  /// Returns the enquiry details, or null while the form is invalid.
  _Enquiry? _collect() {
    if (!(_formKey.currentState?.validate() ?? false)) return null;
    final service = (_service == null || _service == 'Other') ? null : _service;
    return (
      service: service,
      name: _name.text.trim(),
      email: _email.text.trim(),
      phone: _phone.text.trim(),
      message: _message.text.trim(),
    );
  }

  /// "Hi," / the visitor's own message / "Regards," + their details.
  String _compose(_Enquiry d) {
    final b = StringBuffer()
      ..writeln('Hi,')
      ..writeln()
      ..writeln(d.message)
      ..writeln()
      ..writeln('Regards,')
      ..writeln(d.name)
      ..writeln('Email: ${d.email}');
    if (d.phone.isNotEmpty) b.writeln('Phone: ${d.phone}');
    if (d.service != null) b.writeln('Service: ${d.service}');
    return b.toString().trim();
  }

  void _notify(String text) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  Future<void> _sendEmail() async {
    final d = _collect();
    if (d == null) return;

    await LinkLauncher.email(
      AppInfo.email,
      subject: d.service == null
          ? 'Website enquiry - ${d.name}'
          : 'Website enquiry: ${d.service} - ${d.name}',
      body: _compose(d),
    );
    _notify('Opening your email app to send the message...');
  }

  Future<void> _sendWhatsApp() async {
    final d = _collect();
    if (d == null) return;

    await LinkLauncher.whatsapp(AppInfo.phoneRaw, message: _compose(d));
  }

  @override
  Widget build(BuildContext context) {
    final wide = !Responsive.isMobile(context);

    final nameField = TextFormField(
      controller: _name,
      decoration: const InputDecoration(labelText: 'Full name'),
      textInputAction: TextInputAction.next,
      validator: _required,
    );
    final emailField = TextFormField(
      controller: _email,
      decoration: const InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (v) {
        if (_required(v) != null) return 'Required';
        return _emailPattern.hasMatch(v!.trim()) ? null : 'Enter a valid email';
      },
    );
    final phoneField = TextFormField(
      controller: _phone,
      decoration: const InputDecoration(labelText: 'Phone (optional)'),
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
    );
    final serviceField = DropdownButtonFormField<String>(
      isExpanded: true,
      decoration: const InputDecoration(labelText: 'Service'),
      items: [
        for (final s in ServiceModel.all)
          DropdownMenuItem(value: s.title, child: Text(s.title)),
        const DropdownMenuItem(value: 'Other', child: Text('Other')),
      ],
      onChanged: (v) => setState(() => _service = v),
    );

    Widget pair(Widget a, Widget b) => wide
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: a),
              const SizedBox(width: 16),
              Expanded(child: b),
            ],
          )
        : Column(children: [a, const SizedBox(height: 16), b]);

    return Container(
      padding: EdgeInsets.all(wide ? 32 : 22),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withAlpha(12),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Send us a message', style: AppText.h3),
            const SizedBox(height: 24),
            pair(nameField, emailField),
            const SizedBox(height: 16),
            pair(phoneField, serviceField),
            const SizedBox(height: 16),
            TextFormField(
              controller: _message,
              decoration: const InputDecoration(
                labelText: 'Your message',
                alignLabelWithHint: true,
              ),
              minLines: 5,
              maxLines: 8,
              validator: _required,
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                AppButton(
                  label: 'Send Email',
                  showArrow: true,
                  onPressed: _sendEmail,
                ),
                AppButton(
                  label: 'Send on WhatsApp',
                  variant: AppButtonVariant.outline,
                  onPressed: _sendWhatsApp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
