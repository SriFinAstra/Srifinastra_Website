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
    this.headline,
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

  /// Optional punchy line shown above the title on the detail page.
  final String? headline;

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
    'GST Audit',
    'E-Invoicing & E-Way Bills',
    'GST Refunds (Exports, Inverted Duty)',
    'LUT Filing for Exports',
    'GST Advisory (Composition, Real Estate, Sectors)',
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
    'Company Closure & Strike-off',
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
      title: 'Income Tax / TDS',
      tagline: 'ITR Filing | TDS | Advance Tax | Appeals',
      summary:
          'We deliver comprehensive tax compliance and proactive planning '
          'solutions designed to protect your financial interests, minimize '
          'liabilities, and ensure seamless alignment with current regulatory '
          'frameworks.',
      description:
          'Efficient tax management protects your earnings and ensures '
          'regulatory compliance. We provide full-suite tax services, '
          'including income tax returns, TDS administration, advance tax '
          'structuring, and dedicated support for appeals and notices. Our '
          'experts take complete ownership of documentation, statutory '
          'deadlines, and departmental follow-ups, delivering tailored '
          'strategies that legally reduce your tax burden.',
      includes: [
        'Income Tax Return filing for salaried people, professionals, '
            'businesses, investors, NRIs and HUFs',
        'Regular, belated and revised returns',
        'Tax planning and advisory for individuals, firms and companies',
        'New vs old tax regime comparison',
        'Presumptive taxation advisory',
        'Capital gains advisory on sale of property, land and shares',
        'ESOP taxation',
        'Advance tax calculation and payment',
        'TDS and TCS compliance, including deduction, payment, returns '
            '(24Q, 26Q, 27Q) and TDS certificates',
        'PAN and TAN services',
        'PF and ESI registration and compliance for employees',
        'Tax audit under Section 44AB (Forms 3CA/3CB and 3CD)',
        'NRI taxation, including Form 15CA/15CB and DTAA advisory',
        'Income tax notice replies, scrutiny and assessment support',
        'Rectification, refund and reassessment support',
        'Appeals related to tax matters',
      ],
      icon: Icons.receipt_long_outlined,
      color: AppColors.primaryLight,
      image: AppAssets.serviceTax,
      headline: 'Precise compliance. Strategic optimization. Absolute peace '
          'of mind.',
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
        'GST audit',
        'E-invoicing and e-way bill generation',
        'GST refunds (exports, inverted duty)',
        'LUT filing for exports',
        'Composition scheme advice, and GST guidance for real estate and '
            'other specific sectors',
        'GST cancellation and amendment',
        'GST notice replies and support',
        'GST appeals support',
      ],
      icon: Icons.request_quote_outlined,
      color: Color(0xFFB8860B),
      image: AppAssets.serviceGst,
      sections: [
        ServiceSection(
          eyebrow: 'Why It Matters',
          title: 'Why GST Compliance Matters',
          subtitle: 'GST touches every sale and purchase. Getting it right '
              'keeps your business compliant and your cash flow healthy.',
          points: [
            ServicePoint(
              icon: Icons.verified_outlined,
              title: 'Stay legally compliant',
              text: 'Timely registration and returns help you avoid late '
                  'fees, interest and penalties under GST law.',
            ),
            ServicePoint(
              icon: Icons.account_balance_wallet_outlined,
              title: 'Claim your input tax credit',
              text: 'Eligible credit on business purchases lowers your tax '
                  'cost, but only when your records and returns match.',
            ),
            ServicePoint(
              icon: Icons.compare_arrows_rounded,
              title: 'Records that match',
              text: 'Reconciling your books with GSTR-2B and your returns '
                  'catches mismatches before the department does.',
            ),
            ServicePoint(
              icon: Icons.groups_2_outlined,
              title: 'Business credibility',
              text: 'A GST registration lets you issue GST invoices, which '
                  'many customers and suppliers expect, especially in '
                  'business-to-business trade.',
            ),
            ServicePoint(
              icon: Icons.notifications_active_outlined,
              title: 'Fewer notices',
              text: 'Accurate, on-time filing lowers the chance of notices, '
                  'and clean records make any reply easier.',
            ),
            ServicePoint(
              icon: Icons.event_available_outlined,
              title: 'Registration that stays right',
              text: 'Amendments and cancellations done properly avoid '
                  'unwanted filing obligations and compliance gaps later.',
            ),
          ],
        ),
      ],
    ),
    ServiceModel(
      slug: 'accounting-services',
      title: 'Accounting Services',
      tagline: 'Bookkeeping | Payroll & PF/ESI | Reconciliation',
      summary:
          'Clean, compliant, and optimized financials to scale your business '
          'seamlessly.',
      description:
          'We maintain your books, prepare financial statements and '
          'reconcile your accounts every month, so your numbers are always '
          'ready for decisions, lenders and tax filings.',
      includes: [
        'Day-to-day bookkeeping and ledger maintenance',
        'Accounting software setup and support: Tally, Zoho Books, '
            'QuickBooks',
        'Bank reconciliation',
        'Preparation of financial statements: P&L, balance sheet, cash flow',
        'Monthly MIS reports',
        'Payroll processing, including PF, ESI, PT and TDS on salary',
        'Accounts payable and receivable management',
        'Fixed asset register and depreciation',
        'Inventory accounting',
        'Cleanup of backlog or messy books',
        'Virtual or outsourced accounting department',
      ],
      icon: Icons.insert_chart_outlined_rounded,
      color: AppColors.accent,
      image: AppAssets.serviceAccounting,
      sections: [
        ServiceSection(
          eyebrow: 'Why It Matters',
          title: 'Why Proper Accounting Matters',
          subtitle: 'Good books are more than a tax requirement. They show '
              'you how your business is really doing.',
          points: [
            ServicePoint(
              icon: Icons.insights_outlined,
              title: 'Know where you stand',
              text: 'Up-to-date books show your income, expenses, profit '
                  'and cash position at any time.',
            ),
            ServicePoint(
              icon: Icons.fact_check_outlined,
              title: 'Smoother tax and audit',
              text: 'Organised records make tax filing, GST returns and '
                  'audits faster, with fewer corrections.',
            ),
            ServicePoint(
              icon: Icons.account_balance_outlined,
              title: 'Easier funding',
              text: 'Banks and investors ask for clear financial statements '
                  'before approving loans or funding.',
            ),
            ServicePoint(
              icon: Icons.manage_search_rounded,
              title: 'Catch errors early',
              text: 'Regular reconciliation spots missing entries, duplicate '
                  'postings and unrecorded charges while they are still '
                  'easy to fix.',
            ),
            ServicePoint(
              icon: Icons.payments_outlined,
              title: 'Control your cash flow',
              text: 'Tracking receivables, payables and payroll helps you '
                  'plan payments and avoid cash surprises.',
            ),
            ServicePoint(
              icon: Icons.bar_chart_rounded,
              title: 'Better decisions',
              text: 'Monthly MIS reports turn numbers into clear insights on '
                  'margins, costs and performance.',
            ),
          ],
        ),
      ],
    ),
    ServiceModel(
      slug: 'audit-assurance',
      title: 'Audit & Assurance',
      tagline: 'Statutory Audit | Internal Audit | Compliance',
      summary:
          'Transparent, thorough financial assurance designed to secure '
          'investor confidence and safeguard your marketplace reputation.',
      description:
          'An audit should protect your future, not just document your past. '
          'We partner with your organization to evaluate controls, isolate '
          'potential financial risks early, and give your leadership the '
          'insights needed to fulfill compliance duties confidently.',
      includes: [
        'Statutory audit (companies, LLPs, firms, trusts, societies)',
        'Tax audit',
        'Internal audit and risk-based audit',
        'GST audit and reconciliation audit',
        'Stock and inventory audit',
        'Management and operational audit',
        'Concurrent audit (banks)',
        'Due diligence: financial, tax, legal',
        'Certification work: net worth, turnover, FEMA/FC-GPR, UDIN-based '
            'certificates',
        'Internal financial controls review',
        'Forensic review and special audits',
      ],
      icon: Icons.verified_user_outlined,
      color: AppColors.primary,
      image: AppAssets.serviceAudit,
      sections: [
        ServiceSection(
          eyebrow: 'Why It Matters',
          title: 'Why Audit & Assurance Matter',
          subtitle: 'An independent review gives owners, lenders and '
              'regulators confidence in your numbers.',
          points: [
            ServicePoint(
              icon: Icons.verified_user_outlined,
              title: 'Meet legal requirements',
              text: 'Many businesses must be audited under the law. A timely '
                  'audit keeps you compliant.',
            ),
            ServicePoint(
              icon: Icons.lock_outline_rounded,
              title: 'Build trust',
              text: 'Audited financial statements give lenders, investors, '
                  'customers and partners confidence in your reporting.',
            ),
            ServicePoint(
              icon: Icons.warning_amber_rounded,
              title: 'Spot risks early',
              text: 'An independent review finds control gaps, errors and '
                  'unusual items before they grow into bigger problems.',
            ),
            ServicePoint(
              icon: Icons.rule_rounded,
              title: 'Stronger internal controls',
              text: 'Process reviews show where approvals, checks and '
                  'records can be tightened.',
            ),
            ServicePoint(
              icon: Icons.shield_outlined,
              title: 'Prevent errors and misuse',
              text: 'Regular checks on stock, assets and transactions help '
                  'detect mistakes and discourage misuse.',
            ),
            ServicePoint(
              icon: Icons.description_outlined,
              title: 'Ready for questions',
              text: 'Audited, well-documented accounts make it easier to '
                  'answer queries from banks, tax authorities and '
                  'regulators.',
            ),
          ],
        ),
      ],
    ),
    ServiceModel(
      slug: 'corporate-services',
      title: 'Corporate Services',
      tagline: 'Incorporation | Annual Filings | Director Compliance',
      summary:
          'Seamless entity incorporation, proactive ROC compliance '
          'management, and strategic corporate secretarial workflows.',
      description:
          'Beyond setting up your business, we protect its legal foundation. '
          'We oversee every critical milestone—including incorporation '
          'logistics, routine filings, board changes, and statutory KYC '
          'protocols—ensuring your enterprise maintains an unblemished, fully '
          'compliant standing.',
      includes: [
        'Company, LLP, OPC, Section 8 and partnership registration',
        'ROC annual filings: AOC-4, MGT-7, ADT-1, DIR-3 KYC',
        'Director appointment and resignation',
        'Share transfers and allotment (PAS-3)',
        'Maintenance of statutory registers and board/AGM minutes '
            '(secretarial support)',
        'Increase in authorised capital, MOA/AOA amendments, change of '
            'name, address or object',
        'Company or LLP closure: strike-off, winding up',
        'Other registrations: PAN/TAN, MSME (Udyam), IEC, Shops & '
            'Establishment, FSSAI, PF/ESI, Professional Tax, trademark',
        'Compliance calendar and annual compliance retainer',
        'FEMA/RBI filings: FLA return, FC-GPR, FC-TRS',
        'Foreign company setup and Indian subsidiary registration',
      ],
      icon: Icons.apartment_rounded,
      color: Color(0xFFB8593A),
      image: AppAssets.serviceCorporate,
      sections: [
        ServiceSection(
          eyebrow: 'Why It Matters',
          title: 'Why Corporate Compliance Matters',
          subtitle: 'Incorporation is only the start. Every year brings '
              'filings that keep your company active and your directors in '
              'good standing.',
          points: [
            ServicePoint(
              icon: Icons.event_busy_outlined,
              title: 'Avoid late fees',
              text: 'Missed ROC filings can attract additional fees that '
                  'build up with every day of delay.',
            ),
            ServicePoint(
              icon: Icons.person_off_outlined,
              title: 'Protect your directors',
              text: 'Continued non-filing can lead to director '
                  'disqualification and limits on future directorships.',
            ),
            ServicePoint(
              icon: Icons.business_center_outlined,
              title: 'Keep the company active',
              text: 'A company that stops filing risks being marked '
                  'inactive or even struck off the register.',
            ),
            ServicePoint(
              icon: Icons.groups_2_outlined,
              title: 'Credibility with others',
              text: 'Banks, investors and clients often check your ROC '
                  'records before doing business with you.',
            ),
            ServicePoint(
              icon: Icons.folder_shared_outlined,
              title: 'Clear ownership records',
              text: 'Accurate share, director and registered-office records '
                  'avoid disputes and confusion later.',
            ),
            ServicePoint(
              icon: Icons.trending_up_rounded,
              title: 'Ready to grow',
              text: 'A compliant company can raise funds, bring in partners '
                  'and expand with fewer hurdles.',
            ),
          ],
        ),
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
          'Expert advisory architecture designed to launch, structure, and '
          'scale your business with maximum financial efficiency.',
      description:
          'From legal entity formation to long-term commercial execution, we '
          'bridge the gap between planning and performance. Our advisory '
          'suite optimizes your legal structure, builds robust pitch-ready '
          'financial models, and streamlines the capital fundraising process '
          'to unlock your enterprise\'s true market potential.',
      includes: [
        'Business structuring (proprietorship, LLP, Pvt Ltd, OPC) and '
            'entity selection',
        'Business and project reports for bank loans (CMA data, DPR)',
        'Loan and funding assistance: MSME, Mudra, working capital',
        'Startup advisory: valuation, fundraising support',
        'Financial planning, budgeting and forecasting',
        'Virtual CFO services',
        'Cost optimisation and profitability analysis',
        'Valuation of shares and businesses',
        'Mergers, restructuring and succession planning',
        'Franchise and expansion advisory',
        'FEMA and foreign investment advisory',
      ],
      icon: Icons.groups_2_outlined,
      color: Color(0xFF2F7A70),
      image: AppAssets.serviceAdvisory,
      sections: [
        ServiceSection(
          eyebrow: 'Why It Matters',
          title: 'Why Business Advisory Matters',
          subtitle: 'The right guidance early on saves cost, time and rework '
              'as your business grows.',
          points: [
            ServicePoint(
              icon: Icons.account_tree_outlined,
              title: 'Choose the right structure',
              text: 'Proprietorship, partnership, LLP or company: the right '
                  'choice affects liability, tax, compliance and funding.',
            ),
            ServicePoint(
              icon: Icons.timeline_rounded,
              title: 'Plan with projections',
              text: 'Realistic projections and business plans show what your '
                  'business needs and what it can deliver.',
            ),
            ServicePoint(
              icon: Icons.account_balance_outlined,
              title: 'Smoother funding',
              text: 'Well-prepared projections and documentation make loan '
                  'and investor discussions easier.',
            ),
            ServicePoint(
              icon: Icons.rocket_launch_outlined,
              title: 'Use startup benefits',
              text: 'Registrations such as Startup India and MSME can open '
                  'up schemes and benefits you may be eligible for.',
            ),
            ServicePoint(
              icon: Icons.pie_chart_outline_rounded,
              title: 'Keep spending on track',
              text: 'Budgeting and financial planning keep costs under '
                  'control and prepare you for growth.',
            ),
            ServicePoint(
              icon: Icons.lightbulb_outline_rounded,
              title: 'Avoid costly mistakes',
              text: 'An early conversation on tax and structure can prevent '
                  'expensive changes later.',
            ),
          ],
        ),
      ],
    ),
  ];
}
