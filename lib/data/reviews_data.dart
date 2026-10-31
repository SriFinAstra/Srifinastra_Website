class ReviewModel {
  const ReviewModel({
    required this.name,
    required this.text,
    this.rating = 5,
  });

  /// The reviewer's name, shown under the review.
  final String name;
  final String text;
  final int rating;
}

/// Reviews shown in the scrolling carousel on the Home page.
///
/// TODO: These are SAMPLE reviews with made-up names. Replace them with real
/// reviews from the firm's clients (with their permission) before the site
/// goes live. Publishing invented reviews as real ones can mislead visitors.
class ReviewsData {
  ReviewsData._();

  static const reviews = <ReviewModel>[
    ReviewModel(
      name: 'Priya S.',
      text: 'I had been postponing my return for years. The team explained '
          'everything clearly, filed it quickly and kept me updated at every '
          'step.',
    ),
    ReviewModel(
      name: 'Ravi K.',
      text: 'Our GST returns used to be a monthly headache. Now they are '
          'filed on time and our input credit matches every month.',
    ),
    ReviewModel(
      name: 'Anitha R.',
      text: 'They set up our private limited company from name approval to '
          'incorporation and told us exactly which filings to expect each '
          'year.',
    ),
    ReviewModel(
      name: 'Suresh M.',
      text: 'Clear books, monthly reports and quick answers on WhatsApp. I '
          'finally understand how my shop is actually performing.',
    ),
    ReviewModel(
      name: 'Kavya N.',
      text: 'When we received a tax notice we panicked. They went through it '
          'step by step and the reply was filed well before the deadline.',
    ),
    ReviewModel(
      name: 'Mohammed I.',
      text: 'Straightforward advice on business structure and projections for '
          'our bank loan. Professional, patient and always reachable.',
    ),
    ReviewModel(
      name: 'Deepak R.',
      text: 'As an NRI, I wanted someone who could handle my Indian income '
          'and disclosures properly. Everything was done remotely and '
          'smoothly.',
    ),
    ReviewModel(
      name: 'Lakshmi P.',
      text: 'Payroll, PF and ESI used to eat up my time. Now it is done on '
          'schedule every month and I can focus on my work.',
    ),
    ReviewModel(
      name: 'Srinivas G.',
      text: 'Director KYC and our yearly ROC filings are now handled before '
          'the deadline, without me having to chase anyone.',
    ),
    ReviewModel(
      name: 'Harika V.',
      text: 'Their audit review pointed out gaps in our records that we had '
          'missed. Fixing them early saved us a lot of stress later.',
    ),
  ];
}
