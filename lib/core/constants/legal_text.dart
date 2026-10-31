import 'app_text.dart';

class LegalSection {
  const LegalSection(this.heading, this.paragraphs);

  final String heading;
  final List<String> paragraphs;
}

class LegalDoc {
  const LegalDoc({
    required this.title,
    required this.updated,
    required this.intro,
    required this.sections,
  });

  final String title;
  final String updated;
  final String intro;
  final List<LegalSection> sections;
}

/// Text shown in the Privacy Policy and Terms & Conditions pop-ups.
///
/// TODO: have the firm (and a lawyer) review this wording before launch,
/// and update it if you add analytics or a form backend.
class LegalText {
  LegalText._();

  static const _updated = 'October 2026';

  static const privacy = LegalDoc(
    title: 'Privacy Policy',
    updated: _updated,
    intro: '${AppInfo.name} is a firm of Chartered Accountants. This policy '
        'explains what information we collect through this website and how '
        'we handle it.',
    sections: [
      LegalSection('Information we collect', [
        'We collect only what you choose to share when you contact us: your '
            'name, email address, phone number, the service you are '
            'interested in and your message.',
        'Please do not send PAN, Aadhaar, bank details or other sensitive '
            'documents through the contact form or WhatsApp chat. We will '
            'tell you how to share documents securely once we start working '
            'together.',
      ]),
      LegalSection('How your message reaches us', [
        'The contact form on this website does not store your details. When '
            'you choose Send Email or Send on WhatsApp, your own email app '
            'or WhatsApp opens with your message filled in, and nothing is '
            'sent until you send it yourself.',
        'Messages sent this way are handled by your email provider or '
            'WhatsApp under their own privacy policies.',
      ]),
      LegalSection('How we use your information', [
        'We use it to reply to your enquiry, to provide the services you '
            'ask for, and to meet our legal and professional obligations. '
            'We do not sell your information.',
      ]),
      LegalSection('Sharing', [
        'We do not share your personal information with others, except where '
            'the law requires it, or where it is needed to deliver a service '
            'you have asked us to provide.',
      ]),
      LegalSection('Cookies and third-party services', [
        'We do not use advertising or tracking cookies on this website. The '
            'site loads fonts from Google Fonts, and it links to WhatsApp, '
            'LinkedIn, Instagram and YouTube, which have their own privacy '
            'policies.',
        'Our hosting provider may keep standard server logs, such as IP '
            'address and browser type, for security and performance.',
      ]),
      LegalSection('Security', [
        'We take reasonable steps to protect the information we hold. No '
            'method of sending information over the internet is completely '
            'secure, so we cannot guarantee absolute security.',
      ]),
      LegalSection('Your choices', [
        'You can ask us to show, correct or delete the personal information '
            'we hold about you by writing to ${AppInfo.email}.',
      ]),
      LegalSection('Changes to this policy', [
        'We may update this policy from time to time. The latest version '
            'is always available from the footer of this website.',
      ]),
      LegalSection('Contact us', [
        'Questions about this policy? Email ${AppInfo.email} or call '
            '${AppInfo.phone}.',
      ]),
    ],
  );

  static const terms = LegalDoc(
    title: 'Terms & Conditions',
    updated: _updated,
    intro: 'By using this website you agree to these terms. If you do not '
        'agree with them, please do not use the website.',
    sections: [
      LegalSection('General information only', [
        'The content on this website is for general information about '
            '${AppInfo.name} and our services. It is not professional '
            'advice, and it is not an advertisement or a solicitation of '
            'work.',
        'Tax and company-law rules, limits and due dates change often. '
            'Please speak to us before acting on anything you read here.',
      ]),
      LegalSection('No professional engagement', [
        'Contacting us through this website, or receiving a reply from us, '
            'does not create a client relationship. Our services begin only '
            'after the scope and fees have been agreed with you.',
      ]),
      LegalSection('Accuracy', [
        'We try to keep the information on this website correct and up to '
            'date, but we do not guarantee that it is complete or current.',
      ]),
      LegalSection('Your responsibilities', [
        'Please give accurate details when you contact us, and do not use '
            'this website for anything unlawful or harmful.',
      ]),
      LegalSection('Third-party links', [
        'This website links to other sites, such as WhatsApp and social '
            'media. We do not control them and are not responsible for '
            'their content or practices.',
      ]),
      LegalSection('Intellectual property', [
        'The text, logo and design of this website belong to '
            '${AppInfo.name}. Please do not copy or reuse them without our '
            'written permission.',
      ]),
      LegalSection('Limitation of liability', [
        'To the extent the law allows, ${AppInfo.name} is not liable for '
            'any loss that results from using this website or relying on '
            'its content.',
      ]),
      LegalSection('Governing law', [
        'These terms are governed by the laws of India, and any dispute is '
            'subject to the courts of competent jurisdiction.',
      ]),
      LegalSection('Changes and contact', [
        'We may update these terms from time to time. For any question, '
            'email ${AppInfo.email} or call ${AppInfo.phone}.',
      ]),
    ],
  );
}
