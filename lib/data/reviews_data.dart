class ReviewModel {
  const ReviewModel({
    required this.text,
    required this.author,
    required this.detail,
    this.rating = 5,
  });

  final String text;

  /// Who wrote it, e.g. "Small business owner".
  final String author;

  /// The service they used, e.g. "GST services".
  final String detail;

  final int rating;
}

/// Reviews shown in the scrolling carousel on the Home page.
///
/// TODO: These are SAMPLE reviews. Replace them with real reviews from the
/// firm's clients (with their permission) before the site goes live.
class ReviewsData {
  ReviewsData._();

  static const reviews = <ReviewModel>[
    ReviewModel(
      text: 'I had been postponing my return for years. The team explained '
          'everything clearly, filed it quickly and kept me updated at every '
          'step.',
      author: 'Salaried professional',
      detail: 'Income tax filing',
    ),
    ReviewModel(
      text: 'Our GST returns used to be a monthly headache. Now they are '
          'filed on time and our input credit matches every month.',
      author: 'Small business owner',
      detail: 'GST services',
    ),
    ReviewModel(
      text: 'They set up our private limited company from name approval to '
          'incorporation and told us exactly which filings to expect each '
          'year.',
      author: 'Startup founder',
      detail: 'Company incorporation',
    ),
    ReviewModel(
      text: 'Clear books, monthly reports and quick answers on WhatsApp. I '
          'finally understand how my shop is actually performing.',
      author: 'Retail business owner',
      detail: 'Accounting and MIS',
    ),
    ReviewModel(
      text: 'When we received a tax notice we panicked. They went through it '
          'step by step and the reply was filed well before the deadline.',
      author: 'Independent consultant',
      detail: 'Notice support',
    ),
    ReviewModel(
      text: 'Straightforward advice on business structure and projections for '
          'our bank loan. Professional, patient and always reachable.',
      author: 'Entrepreneur',
      detail: 'Business advisory',
    ),
    ReviewModel(
      text: 'As an NRI, I wanted someone who could handle my Indian income '
          'and disclosures properly. Everything was done remotely and '
          'smoothly.',
      author: 'NRI client',
      detail: 'Income tax filing',
    ),
    ReviewModel(
      text: 'Payroll, PF and ESI used to eat up my time. Now it is done on '
          'schedule every month and I can focus on my work.',
      author: 'Small business owner',
      detail: 'Payroll and compliance',
    ),
  ];
}
