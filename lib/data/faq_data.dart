/// One question with its answer.
///
/// Each entry in [answer] is one paragraph. A line starting with "• " is
/// shown as a bullet point.
class FaqItem {
  const FaqItem(this.question, this.answer);

  final String question;
  final List<String> answer;
}

class FaqCategory {
  const FaqCategory(this.label, this.items);

  final String label;
  final List<FaqItem> items;
}

/// FAQ content for the FAQ page and the Home page preview.
///
/// TODO: have the CA confirm the wording. Tax and GST rules change often, so
/// this text avoids hard-coded due dates and turnover limits on purpose.
class FaqData {
  FaqData._();

  static const categories = <FaqCategory>[
    FaqCategory('Income Tax', [
      FaqItem('Who should file an Income Tax Return (ITR)?', [
        'Individuals and businesses may be required to file an Income Tax '
            'Return depending on their income, entity type and other '
            'prescribed conditions. Even where filing is not mandatory, a '
            'person may have reasons to file an eligible return.',
        'The correct requirement should be checked based on your individual '
            'circumstances and the applicable assessment year. The Income '
            'Tax Department provides different return forms depending on the '
            'taxpayer and the nature of income.',
        'Need help deciding whether you should file an ITR? Contact Sri Fin '
            'Astra for assistance.',
      ]),
      FaqItem('What are the benefits of filing an ITR?', [
        'Filing an ITR provides an official record of the income and tax '
            'information reported to the Income Tax Department. An eligible '
            'return can also be relevant when claiming applicable refunds and '
            'reporting income from different sources.',
        'Beyond statutory filing requirements, properly maintained tax '
            'records may also be useful when you need to demonstrate your '
            'declared income for financial or administrative purposes.',
      ]),
      FaqItem('I have no tax payable. Do I still need to file an ITR?', [
        'Possibly. Whether you are required to file a return is not '
            'determined solely by whether you have tax payable. Filing '
            'requirements depend on the provisions applicable to your income '
            'and circumstances.',
        'If you are uncertain, it is better to check your filing requirement '
            'rather than assume that zero tax means no return is required.',
      ]),
      FaqItem('Which ITR form should I file?', [
        'It depends on factors such as your residential status, income level '
            'and sources of income.',
        'For example, ITR-1 is meant only for qualifying resident '
            'individuals whose income is within a prescribed limit and comes '
            'from specified sources, and it cannot be used where there is '
            'income from business or profession. ITR-2, ITR-3 and ITR-4 '
            'cater to different income profiles.',
        'Sri Fin Astra can help you identify the applicable return based on '
            'your income profile.',
      ]),
      FaqItem(
          'I earn income from freelancing or a profession. Do I need to file '
          'an ITR?',
          [
            'Freelance or professional income can fall under business or '
                'professional income for income-tax return purposes. For '
                'example, ITR-1 cannot be used by an individual who has '
                'income from business or profession.',
            'The filing requirement and appropriate ITR form depend on your '
                'overall income and circumstances.',
          ]),
      FaqItem('Can I file an ITR after the regular due date?', [
        'Depending on the circumstances and applicable provisions, options '
            'such as belated, revised or updated returns may be available.',
        'Because deadlines and eligibility conditions can change by '
            'assessment year, check with us as early as possible rather than '
            'waiting for the due date to pass.',
      ]),
    ]),
    FaqCategory('GST', [
      FaqItem('Who needs GST registration?', [
        'GST registration depends on factors such as the nature of your '
            'activities, turnover, location and other conditions prescribed '
            'under GST law. Certain categories can also have specific '
            'registration requirements.',
        'Registration conditions can vary, so tell us about your business '
            'and we will check whether GST registration applies to you.',
      ]),
      FaqItem('What are the benefits of GST registration?', [
        'For an eligible business, GST registration enables it to operate '
            'within the GST system and undertake applicable GST compliance. '
            'A registered taxpayer may also be able to claim eligible Input '
            'Tax Credit (ITC), subject to applicable GST conditions.',
        'GST registration can therefore be particularly relevant for '
            'businesses operating within a GST-compliant supply chain.',
      ]),
      FaqItem('What is Input Tax Credit (ITC)?', [
        'In simple terms, Input Tax Credit relates to credit for eligible '
            'GST paid on business purchases and input supplies, subject to '
            'GST rules and conditions.',
        'Example: if your business pays eligible GST on business purchases '
            'and collects GST on taxable sales, eligible ITC may be '
            'available for set-off, subject to applicable conditions.',
      ]),
      FaqItem('Should a small business take GST registration voluntarily?', [
        'It depends on the business. Before voluntarily registering, '
            'consider factors such as:',
        '• Who your customers are',
        '• Whether your customers expect GST invoices',
        '• Your type of supplies',
        '• Your eligible input taxes',
        '• Additional compliance requirements after registration',
        'This is a question where personalised advice is more useful than a '
            'yes or no answer.',
      ]),
      FaqItem('What is the GST Composition Scheme?', [
        'The Composition Scheme is a GST mechanism available to certain '
            'eligible taxpayers, subject to applicable turnover limits and '
            'restrictions.',
        'It is not available to everyone. The GST Portal lists restrictions '
            'for certain taxpayers and transactions, so eligibility should be '
            'checked before opting for it.',
      ]),
      FaqItem(
          'Do I need to file GST returns if there is no business during a '
          'period?',
          [
            'GST return obligations depend on the taxpayer\'s registration '
                'type and the relevant return requirements. A business '
                'should not simply stop filing because there were no '
                'transactions.',
            'Sri Fin Astra can help you understand the filings applicable to '
                'your GST registration.',
          ]),
    ]),
    FaqCategory('Accounting & Reporting', [
      FaqItem('Why does my business need proper bookkeeping?', [
        'Good bookkeeping helps you understand important questions such as:',
        '• How much are you earning?',
        '• How much are you spending?',
        '• Who owes you money?',
        '• Whom do you need to pay?',
        '• Is your business actually profitable?',
        '• How is your cash position?',
        'It also creates an organised financial record that can support '
            'taxation, reporting and business decision-making.',
      ]),
      FaqItem(
          'I have a small business. Do I really need monthly accounting?',
          [
            'Monthly accounting can be valuable even for small businesses.',
            'Waiting until the end of the year may make it harder to '
                'identify missing transactions, unpaid customer balances, '
                'cash-flow issues or unusual expenses. Regular bookkeeping '
                'gives you more current visibility into how the business is '
                'performing.',
          ]),
      FaqItem('What is the difference between bookkeeping and accounting?', [
        'Bookkeeping primarily focuses on recording and organising day-to-day '
            'financial transactions.',
        'Accounting goes further by classifying, reviewing and interpreting '
            'financial information so that financial statements, compliance '
            'information and management reports can be prepared.',
        'For many small businesses, they work together.',
      ]),
      FaqItem('Why should I reconcile my bank accounts regularly?', [
        'Bank reconciliation compares your accounting records against your '
            'bank transactions.',
        'Regular reconciliation can help identify missing entries, '
            'duplicate postings, unrecorded charges and differences between '
            'your books and bank records.',
      ]),
      FaqItem('What is an MIS report?', [
        'A Management Information System (MIS) report presents important '
            'business and financial information in a structured format to '
            'support management decisions. Depending on the business, this '
            'could cover:',
        '• Revenue',
        '• Expenses',
        '• Profitability',
        '• Cash flow',
        '• Receivables and payables',
        '• Budget vs actual',
        'The purpose is not simply to produce another report. It is to help '
            'the owner understand what is happening in the business.',
      ]),
      FaqItem('How can monthly financial reports help my business?', [
        'Monthly reports can help you identify trends instead of waiting '
            'until year-end. For example, you may discover that:',
        '• Sales are increasing but margins are falling',
        '• Expenses are growing faster than revenue',
        '• Customers are taking longer to pay',
        '• Certain products or services are more profitable',
        '• Actual spending is exceeding the budget',
        'That allows management to act earlier.',
      ]),
      FaqItem(
          'My accountant already handles tax filing. Why do I need '
          'financial reporting?',
          [
            'Tax compliance and management reporting serve different '
                'purposes.',
            'Tax and compliance reporting focuses on applicable statutory '
                'requirements. Management reporting focuses on helping the '
                'business owner understand performance and make decisions.',
            'A business may therefore require both.',
          ]),
    ]),
    FaqCategory('Business Registration', [
      FaqItem('Which business structure should I choose?', [
        'There is no single structure that is best for everyone.',
        'Depending on the business and applicable law, entrepreneurs may '
            'consider structures such as a proprietorship, partnership, LLP '
            'or company. Factors to evaluate include the number of owners, '
            'liability, compliance, tax implications, funding plans and '
            'future growth.',
        'For companies, MCA\'s SPICe+ is part of the incorporation '
            'framework, while LLPs have their own incorporation and filing '
            'processes such as FiLLiP.',
      ]),
      FaqItem(
          'What is the difference between an LLP and a Private Limited '
          'Company?',
          [
            'Both are formal business structures, but their '
                'ownership and governance, compliance and statutory '
                'requirements differ.',
            'The right choice depends on factors such as the founders, '
                'nature of business, capital and funding plans and desired '
                'operating structure.',
            'Sri Fin Astra can help you understand the practical '
                'considerations before you choose a structure.',
          ]),
      FaqItem('Why should I register my business?', [
        'Formal registration establishes the business in the legal '
            'structure selected by its owners and can create clearer '
            'separation between personal operations and business '
            'arrangements, depending on that structure.',
        'The resulting compliance obligations differ significantly between '
            'structures, so look at both the benefit of registration and the '
            'ongoing compliance burden before choosing.',
      ]),
    ]),
    FaqCategory('Compliance & Payroll', [
      FaqItem('What is ROC compliance?', [
        'Registrar of Companies (ROC) compliance broadly refers to '
            'statutory filings and requirements applicable to registered '
            'companies and LLPs.',
        'The Ministry of Corporate Affairs states that the ROC\'s duties '
            'include registering companies and LLPs and ensuring that they '
            'comply with statutory requirements under applicable law.',
      ]),
      FaqItem(
          'Does my company or LLP need annual ROC filing even if there is '
          'little or no business?',
          [
            'Being incorporated can create statutory filing obligations '
                'independent of how active the business is. The exact '
                'requirements depend on the entity and its circumstances.',
            'For example, MCA provides LLP filing forms including Form 8 '
                '(Statement of Account & Solvency) and Form 11 (Annual '
                'Return).',
            'It is therefore important not to assume that low activity '
                'automatically means no compliance.',
          ]),
      FaqItem('Why should businesses maintain proper payroll records?', [
        'Payroll records help businesses systematically track employee '
            'salaries, deductions, employer costs and related payments.',
        'For a growing business, an organised payroll process can also make '
            'financial reporting and applicable statutory compliance easier '
            'to manage.',
      ]),
      FaqItem(
          'My business has started hiring employees. What compliance '
          'should I consider?',
          [
            'Your requirements will depend on factors such as the number and '
                'category of employees, salary structure, location and '
                'nature of the establishment.',
            'Depending on applicability, considerations may include payroll '
                'TDS and other employee-related statutory requirements. '
                'Because applicability varies, a case-specific review is the '
                'best way to know what applies to you.',
          ]),
    ]),
    FaqCategory('Financial Advisory', [
      FaqItem(
          'My business is profitable, so why do I need financial planning?',
          [
            'Profitability alone does not always tell you how financially '
                'healthy a business is. Financial planning helps you look '
                'forward at issues such as:',
            '• Expected revenue and costs',
            '• Future cash requirements',
            '• Business investments',
            '• Working capital',
            '• Profitability',
            '• Growth plans',
            'A business can therefore use financial planning to make more '
                'informed decisions instead of relying only on historical '
                'numbers.',
          ]),
      FaqItem('What is budgeting and why does my business need it?', [
        'A budget is a financial plan for a future period.',
        'It gives business owners a benchmark against which actual revenue '
            'and expenditure can be compared. This helps management '
            'understand where the business is performing better or worse '
            'than planned and decide whether corrective action is required.',
      ]),
      FaqItem('What is a cash-flow forecast and why is it important?', [
        'A cash-flow forecast estimates expected cash coming into and going '
            'out of the business over a future period.',
        'It can help business owners anticipate potential cash shortages, '
            'plan major payments and understand when additional funding or '
            'tighter collection of receivables may be needed.',
      ]),
    ]),
  ];

  /// Questions shown on the Home page, with a "View All FAQs" button.
  static final List<FaqItem> popular = [
    categories[0].items[0], // Who should file an ITR?
    categories[0].items[1], // Benefits of filing an ITR
    categories[1].items[0], // Who needs GST registration?
    categories[1].items[1], // Benefits of GST registration
    categories[2].items[0], // Why bookkeeping?
    categories[5].items[0], // Why financial planning?
  ];
}
