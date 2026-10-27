import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';

/// One card inside a [ServiceSection] (icon, short title, short text).
class ServicePoint {
  const ServicePoint({
    required this.icon,
    required this.title,
    required this.text,
  });

  final IconData icon;
  final String title;
  final String text;
}

/// An extra band on a service's detail page, shown as a grid of cards.
class ServiceSection {
  const ServiceSection({
    required this.eyebrow,
    required this.title,
    this.subtitle,
    required this.points,
  });

  final String eyebrow;
  final String title;
  final String? subtitle;
  final List<ServicePoint> points;
}

class ServiceModel {
  const ServiceModel({
    required this.slug,
    required this.title,
    required this.tagline,
    required this.summary,
    required this.description,
    required this.includes,
    required this.icon,
    required this.color,
    required this.image,
    this.sections = const [],
  });

  /// Used in the URL: /services/`<slug>`
  final String slug;
  final String title;

  /// Short pipe-separated line shown on cards.
  final String tagline;

  /// One sentence for the Services page list.
  final String summary;

  /// Longer text for the detail page.
  final String description;

  /// "What's included" bullet points.
  final List<String> includes;

  final IconData icon;
  final Color color;
  final String image;

  /// Extra card sections on the detail page (optional).
  final List<ServiceSection> sections;

  /// Short names for the "Everything We Offer" list on the Services page.
  static const List<String> allOfferings = [
    // Tax
    'ITR Filing',
    'TDS Return Filing',
    'TDS on Property Sale & Purchase',
    'TDS for Employers & Contractors',
    'Advance Tax',
    'PAN & TAN Services',
    'Professional Tax Services',
    'Capital Gains Advisory',
    'Transfer Pricing',
    'Income Tax Notices & Appeals',
    // GST
    'GST Registration (Regular / Composition)',
    'GST Return Filing (GSTR-1 / GSTR-3B)',
    'GSTR-2B & ITC Reconciliation',
    'GSTR-9 Annual Return',
    'GST Cancellation & Amendment',
    'GST Notices & Appeals',
    // Accounting
    'Bookkeeping & Accounting',
    'Account Reconciliation',
    'Payroll Management',
    'PF & ESI Registration & Services',
    'MIS Reports for Management',
    // Audit
    'Statutory, Internal & Tax Audits',
    // Corporate
    'Company Incorporation',
    'ROC Related Work',
    'Director Appointments & KYC',
    // Advisory
    'Tax Planning',
    'Tax & Business Advisory',
    'Preparation of Projections',
    'Startup India & MSME Registration',
    'Budgeting & Financial Planning',
  ];

  static ServiceModel? bySlug(String slug) {
    for (final s in all) {
      if (s.slug == slug) return s;
    }
    return null;
  }

  // TODO: confirm service wording with the client.
  static const List<ServiceModel> all = [
    ServiceModel(
      slug: 'tax-services',
      title: 'Tax Services',
      tagline: 'ITR Filing | TDS | Advance Tax | Appeals',
      summary:
          'Accurate filings and year-round planning, so you stay compliant '
          'and pay only what you owe.',
      description:
          'From individual income tax returns to TDS, advance tax and '
          'appeals, we handle the paperwork, deadlines and follow-ups so '
          'you can focus on your work. We also help you plan ahead to '
          'reduce your tax outgo legally.',
      includes: [
        'Income Tax Return filing for salaried people, professionals, '
            'businesses, investors, NRIs and HUFs',
        'Revised, belated and nil returns',
        'TDS return filing',
        'TDS payment on property sale and purchase, and other transactions',
        'TDS compliance for employers and contractors',
        'Advance tax calculation and payment',
        'PAN and TAN services',
        'Professional tax registration and returns',
        'Capital gains advisory',
        'Transfer pricing documentation and compliance',
        'Appeals related to tax matters',
        'Handling income tax notices, with replies and assessment support',
        'Tax planning and advisory',
      ],
      icon: Icons.receipt_long_outlined,
      color: AppColors.primaryLight,
      image: AppAssets.serviceTax,
      sections: [
        ServiceSection(
          eyebrow: 'Why It Matters',
          title: 'Why Filing Your ITR Is Important',
          subtitle: 'Even when your income is low or tax has already been '
              'deducted, a filed return works in your favour.',
          points: [
            ServicePoint(
              icon: Icons.gavel_rounded,
              title: 'Stay legally compliant',
              text: 'Filing on time helps you avoid late fees, interest and '
                  'notices from the Income Tax Department.',
            ),
            ServicePoint(
              icon: Icons.currency_rupee_rounded,
              title: 'Claim your refund',
              text: 'Tax deducted at source or paid in excess comes back to '
                  'you only when you file a return.',
            ),
            ServicePoint(
              icon: Icons.account_balance_outlined,
              title: 'Proof of income',
              text: 'Banks, insurers and landlords ask for your recent '
                  'returns before approving loans, credit cards or '
                  'property purchases.',
            ),
            ServicePoint(
              icon: Icons.flight_takeoff_rounded,
              title: 'Visa and overseas travel',
              text: 'Embassies often ask for past returns as evidence of '
                  'your income and financial standing.',
            ),
            ServicePoint(
              icon: Icons.trending_up_rounded,
              title: 'Carry forward losses',
              text: 'Business and capital losses can generally be set off '
                  'against future income only if the return is filed on '
                  'time.',
            ),
            ServicePoint(
              icon: Icons.savings_outlined,
              title: 'Use every deduction',
              text: 'Eligible investments, expenses and exemptions lower '
                  'your tax only when they are claimed in your return.',
            ),
          ],
        ),
        ServiceSection(
          eyebrow: 'Who We Help',
          title: 'Who Can We File For?',
          subtitle: 'Filing is mandatory above the basic exemption limit, '
              'and in some cases, such as holding assets abroad, whatever '
              'your income. Not sure about your case? We will check it '
              'for you.',
          points: [
            ServicePoint(
              icon: Icons.work_outline_rounded,
              title: 'Salaried individuals',
              text: 'One or more employers, with Form 16, pension and other '
                  'income. We make sure every eligible deduction is '
                  'claimed.',
            ),
            ServicePoint(
              icon: Icons.laptop_mac_outlined,
              title: 'Freelancers and professionals',
              text: 'Consultants, doctors, designers, lawyers and other '
                  'self-employed people, including those under the '
                  'presumptive scheme.',
            ),
            ServicePoint(
              icon: Icons.storefront_outlined,
              title: 'Business owners',
              text: 'Proprietors and small businesses, with accounts and '
                  'returns prepared together.',
            ),
            ServicePoint(
              icon: Icons.show_chart_rounded,
              title: 'Investors and traders',
              text: 'Capital gains from shares, mutual funds, property and '
                  'crypto, as well as F&O income.',
            ),
            ServicePoint(
              icon: Icons.home_work_outlined,
              title: 'Property owners',
              text: 'Rental and house property income, including home-loan '
                  'interest where eligible.',
            ),
            ServicePoint(
              icon: Icons.public_rounded,
              title: 'NRIs and foreign income',
              text: 'Non-residents with Indian income, and residents with '
                  'foreign income or assets, with the required disclosures.',
            ),
            ServicePoint(
              icon: Icons.elderly_rounded,
              title: 'Senior citizens and pensioners',
              text: 'Pension, interest and other income, with the benefits '
                  'available to senior citizens.',
            ),
            ServicePoint(
              icon: Icons.family_restroom_rounded,
              title: 'Hindu Undivided Families',
              text: 'HUFs with income from property, investments or '
                  'business.',
            ),
            ServicePoint(
              icon: Icons.business_rounded,
              title: 'Firms, LLPs and companies',
              text: 'Income tax returns for partnership firms, LLPs and '
                  'companies, along with audit-related filings.',
            ),
          ],
        ),
      ],
    ),
    ServiceModel(
      slug: 'gst-services',
      title: 'GST Services',
      tagline: 'Registration | Return Filing | Reconciliation | Notices',
      summary:
          'End-to-end GST support, from registration and monthly returns '
          'to reconciliation, notices and appeals.',
      description:
          'We handle your GST from start to finish: getting you registered, '
          'filing returns on time, reconciling your purchases and input tax '
          'credit, and supporting you when a notice or appeal comes up.',
      includes: [
        'GST registration (Regular / Composition)',
        'GST return filing (GSTR-1 and GSTR-3B)',
        'GSTR-2B reconciliation',
        'Input Tax Credit reconciliation and support',
        'GSTR-9 annual return',
        'GST cancellation and amendment',
        'GST notice replies and support',
        'GST appeals support',
      ],
      icon: Icons.request_quote_outlined,
      color: Color(0xFFB8860B),
      image: AppAssets.serviceGst,
    ),
    ServiceModel(
      slug: 'accounting-services',
      title: 'Accounting Services',
      tagline: 'Bookkeeping | Payroll & PF/ESI | Reconciliation',
      summary:
          'Clean, up-to-date books that give you a clear picture of your '
          'business at any time.',
      description:
          'We maintain your books, prepare financial statements and '
          'reconcile your accounts every month, so your numbers are always '
          'ready for decisions, lenders and tax filings.',
      includes: [
        'Bookkeeping and ledger maintenance',
        'Account reconciliation (bank, vendor and customer)',
        'Financial statements (P&L, Balance Sheet)',
        'Payroll management and processing',
        'PF and ESI registration, returns and compliance',
        'Monthly MIS reports for management',
      ],
      icon: Icons.insert_chart_outlined_rounded,
      color: AppColors.accent,
      image: AppAssets.serviceAccounting,
    ),
    ServiceModel(
      slug: 'audit-assurance',
      title: 'Audit & Assurance',
      tagline: 'Statutory Audit | Internal Audit | Compliance',
      summary:
          'Independent, thorough audits that build trust with investors, '
          'banks and regulators.',
      description:
          'Our audits go beyond ticking boxes. We review your processes and '
          'controls, flag risks early and help you meet every statutory '
          'requirement with confidence.',
      includes: [
        'Statutory audit under the Companies Act',
        'Tax audit',
        'Internal audit and process review',
        'Stock and fixed-asset verification',
        'ROC and regulatory compliance',
      ],
      icon: Icons.verified_user_outlined,
      color: AppColors.primary,
      image: AppAssets.serviceAudit,
    ),
    ServiceModel(
      slug: 'corporate-services',
      title: 'Corporate Services',
      tagline: 'Incorporation | Annual Filings | Director Compliance',
      summary:
          'Company setup and every ROC filing, director change and KYC, '
          'handled on time.',
      description:
          'Starting a company is only the first step. We take care of your '
          'incorporation and then every Registrar of Companies filing, '
          'director change and KYC that follows, so your company stays '
          'compliant and your directors stay in good standing.',
      includes: [
        'Company, LLP and One Person Company incorporation',
        'Annual ROC filings and other ROC related work',
        'Director appointment, resignation and changes',
        'DIN application and Director KYC filings',
        'Share allotment, transfer and capital changes',
        'Registered office, name and MOA/AOA changes',
        'Auditor appointment, board and general meeting support',
        'Strike-off and closure of inactive companies',
      ],
      icon: Icons.apartment_rounded,
      color: Color(0xFFB8593A),
      image: AppAssets.serviceCorporate,
      sections: [
        ServiceSection(
          eyebrow: 'Corporate Services',
          title: 'Company Law & ROC Compliance',
          subtitle: 'From the day you incorporate to every yearly filing, we '
              'keep your company in good standing. Missed filings can '
              'attract heavy late fees and even director disqualification.',
          points: [
            ServicePoint(
              icon: Icons.apartment_rounded,
              title: 'Company incorporation',
              text: 'Private Limited, LLP and One Person Company '
                  'registration, including name approval, DIN, '
                  'incorporation documents, PAN and TAN.',
            ),
            ServicePoint(
              icon: Icons.fact_check_outlined,
              title: 'Annual filings',
              text: 'Yearly financial statements and annual return for '
                  'companies and LLPs, filed with the Registrar of '
                  'Companies within the due dates.',
            ),
            ServicePoint(
              icon: Icons.person_add_alt_1_outlined,
              title: 'Director appointments',
              text: 'Appointment, re-appointment and resignation of '
                  'directors, with board resolutions and ROC intimation.',
            ),
            ServicePoint(
              icon: Icons.badge_outlined,
              title: 'DIN and Director KYC',
              text: 'New DIN applications and KYC filings, so every '
                  "director's DIN stays active and free of late fees.",
            ),
            ServicePoint(
              icon: Icons.pie_chart_outline_rounded,
              title: 'Share and capital changes',
              text: 'Allotment and transfer of shares, increase in '
                  'authorised capital and updates to your MOA and AOA.',
            ),
            ServicePoint(
              icon: Icons.archive_outlined,
              title: 'Office, name and closure',
              text: 'Registered office and name changes, auditor '
                  'appointments, and strike-off of companies that are no '
                  'longer in operation.',
            ),
          ],
        ),
      ],
    ),
    ServiceModel(
      slug: 'business-advisory',
      title: 'Business Advisory',
      tagline: 'Startups | Growth Strategy | Financial Planning',
      summary:
          'Practical guidance to start, structure and grow your business '
          'the right way.',
      description:
          'Whether you are registering a new venture or planning your next '
          'stage of growth, we help you choose the right structure, '
          'prepare projections and arrange funding.',
      includes: [
        'Tax and business advisory',
        'Choosing the right structure: Private Limited, LLP or partnership',
        'Preparation of projections and business plans',
        'Startup India and MSME registration',
        'Project financing and loan documentation',
        'Budgeting and financial planning',
      ],
      icon: Icons.groups_2_outlined,
      color: Color(0xFF2F7A70),
      image: AppAssets.serviceAdvisory,
    ),
  ];
}
